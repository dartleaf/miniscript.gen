import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

/// Builder for generating MiniScript wrappers using build_runner
Builder miniScriptWrapperBuilder(BuilderOptions options) => LibraryBuilder(
  MiniScriptWrapperGenerator(),
  generatedExtension: '.miniscript.dart',
);

/// Source generator for MiniScript wrappers
class MiniScriptWrapperGenerator extends Generator {
  @override
  String generate(LibraryReader library, BuildStep buildStep) {
    final buffer = StringBuffer();

    // Find all classes with @Visible annotation
    final visibleClasses = <ClassElement>[];
    for (final element in library.allElements) {
      if (element is ClassElement) {
        final hasVisibleAnnotation = element.metadata.any((metadata) {
          final value = metadata.computeConstantValue();
          return value?.type?.element?.name == 'Visible';
        });

        if (hasVisibleAnnotation) {
          visibleClasses.add(element);
        }
      }
    }

    // If no visible classes found, return empty string
    if (visibleClasses.isEmpty) {
      return '';
    }

    // Generate file header and imports only once
    buffer.writeln('// Generated MiniScript wrappers');
    buffer.writeln('// This file is auto-generated. Do not edit manually.');
    buffer.writeln();

    // Generate imports at the top
    buffer.writeln(
      'import "package:miniscript/miniscript_intrinsics/intrinsic.dart";',
    );
    buffer.writeln(
      'import "package:miniscript/miniscript_intrinsics/intrinsic_result.dart";',
    );
    buffer.writeln('import "package:miniscript/miniscript_tac/context.dart";');
    buffer.writeln('import "package:miniscriptgen/miniscriptgen.dart";');
    buffer.writeln();

    // Import the source library
    final sourceFile = library.element.source.uri.path;
    if (sourceFile.endsWith('.dart')) {
      final importPath = sourceFile.split('/').last;
      buffer.writeln('import "$importPath";');
    }

    // Generate imports for referenced classes
    final referencedClasses = <String>{};
    for (final classElement in visibleClasses) {
      final visibleMembers = _getVisibleMembers(classElement);
      for (final member in visibleMembers) {
        final typeString = _getDartTypeString(member.type);
        if (typeString.contains('List<') && typeString.contains('>')) {
          final innerType = typeString.substring(
            typeString.indexOf('<') + 1,
            typeString.lastIndexOf('>'),
          );
          if (innerType != 'String' &&
              innerType != 'int' &&
              innerType != 'double' &&
              innerType != 'bool' &&
              innerType != 'dynamic') {
            referencedClasses.add(innerType);
          }
        }
      }
    }

    for (final className in referencedClasses) {
      buffer.writeln('import "${className.toLowerCase()}.dart";');
    }
    buffer.writeln();

    // Generate wrapper classes for each visible class
    for (final classElement in visibleClasses) {
      buffer.writeln(_generateWrapperClass(classElement));
      buffer.writeln();
    }

    return buffer.toString();
  }

  static String convert(DartType dartType, String value) {
    if (dartType is ParameterizedType) {
      if (dartType.isDartCoreMap) {
        final keyType = dartType.typeArguments[0];
        final valueType = dartType.typeArguments[1];

        final keyTypeName = keyType.getDisplayString();
        final valueTypeName = valueType.getDisplayString();

        return "($value).cast<$keyTypeName, $valueTypeName>()";
      }
      if (dartType.isDartCoreList) {
        final elementType = dartType.typeArguments[0];
        final elementTypeName = elementType.getDisplayString();

        final valueTypeName = elementTypeName;

        return "($value).cast<$valueTypeName>()";
      }
    }

    final typeName = _getDartTypeString(dartType).replaceAll("?", "");

    return "ConversionUtils.hardConvert<$typeName>($value) as $typeName";
  }

  String _generateWrapperClass(ClassElement classElement) {
    final className = classElement.name;
    final wrapperName = '${className}Wrapper';
    final buffer = StringBuffer();

    // Generate wrapper class
    buffer.writeln('/// Generated wrapper for $className');
    buffer.writeln('class $wrapperName extends BaseWrapper<$className> {');
    buffer.writeln('  $wrapperName(super.dartObject);');
    buffer.writeln();

    // Get visible properties and methods
    final visibleMembers = _getVisibleMembers(classElement);
    final properties = visibleMembers.where((m) => m.isProperty).toList();
    final methods = visibleMembers.where((m) => m.isMethod).toList();

    // Generate property names list
    buffer.writeln('  @override');
    buffer.writeln('  List<String> getPropertyNames() {');
    buffer.writeln('    return [');
    for (final prop in properties) {
      buffer.writeln('      "${prop.name}",');
    }
    for (final method in methods) {
      buffer.writeln('      "${method.name}",');
    }
    buffer.writeln('    ];');
    buffer.writeln('  }');
    buffer.writeln();

    // Generate getProperty method
    buffer.writeln('  @override');
    buffer.writeln('  Value? getProperty(String propertyName) {');
    buffer.writeln('    switch (propertyName) {');

    // Generate property getters
    for (final prop in properties) {
      //final dartType = _getDartTypeString(prop.type);
      final isNullable =
          prop.type.nullabilitySuffix == NullabilitySuffix.question;
      if (isNullable) {
        buffer.writeln('      case "${prop.name}":');
        buffer.writeln('        final value = dartValue.${prop.name};');
        buffer.writeln(
          '        if (value == null) { return ValNull.instance; }',
        );
        buffer.writeln('        return ConversionUtils.dartToValue(value);');
      } else {
        buffer.writeln('      case "${prop.name}":');
        buffer.writeln(
          '        return ConversionUtils.dartToValue(dartValue.${prop.name});',
        );
      }
    }

    // Generate method bindings
    for (final method in methods) {
      buffer.writeln('      case "${method.name}":');
      buffer.writeln(
        '        return _create${_capitalize(method.name)}Method();',
      );
    }

    buffer.writeln('      default:');
    buffer.writeln('        return null;');
    buffer.writeln('    }');
    buffer.writeln('  }');
    buffer.writeln();

    // Generate setProperty method
    buffer.writeln('  @override');
    buffer.writeln('  bool setProperty(String propertyName, Value? value) {');
    buffer.writeln('    switch (propertyName) {');

    // Generate property setters (exclude getters and read-only properties)
    for (final prop in properties) {
      if (prop.isWritable && !prop.isGetter && prop.isProperty) {
        final dartType = _getDartTypeString(prop.type);
        final isNullable =
            prop.type.nullabilitySuffix == NullabilitySuffix.question;
        buffer.writeln('      case "${prop.name}":');
        buffer.writeln('        try {');
        buffer.writeln(
          '          var dartValue = ConversionUtils.valueToDart(value);',
        );

        if (isNullable) {
          // Nullish property: allow null and ValNull.instance
          if (dartType == 'int?') {
            buffer.writeln(
              '          if (dartValue == null || dartValue == ValNull.instance) {',
            );
            buffer.writeln('            this.dartValue.${prop.name} = null;');
            buffer.writeln('            return true;');
            buffer.writeln('          }');
            buffer.writeln('          if (dartValue is num) {');
            buffer.writeln(
              '            this.dartValue.${prop.name} = dartValue.toInt();',
            );
            buffer.writeln('            return true;');
            buffer.writeln('          }');
          } else if (dartType == 'double?') {
            buffer.writeln(
              '          if (dartValue == null || dartValue == ValNull.instance) {',
            );
            buffer.writeln('            this.dartValue.${prop.name} = null;');
            buffer.writeln('            return true;');
            buffer.writeln('          }');
            buffer.writeln('          if (dartValue is num) {');
            buffer.writeln(
              '            this.dartValue.${prop.name} = dartValue.toDouble();',
            );
            buffer.writeln('            return true;');
            buffer.writeln('          }');
          } else {
            buffer.writeln(
              '          if (dartValue == null || dartValue == ValNull.instance) {',
            );
            buffer.writeln('            this.dartValue.${prop.name} = null;');
            buffer.writeln('            return true;');
            buffer.writeln('          }');
            buffer.writeln(
              '            this.dartValue.${prop.name} = ${convert(prop.type, "dartValue")};',
            );
            buffer.writeln('            return true;');
          }
        } else {
          // Non-nullish property: do not allow null or ValNull.instance
          if (dartType == 'int') {
            buffer.writeln('          if (dartValue is num) {');
            buffer.writeln(
              '            this.dartValue.${prop.name} = dartValue.toInt();',
            );
            buffer.writeln('            return true;');
            buffer.writeln('          }');
          } else if (dartType == 'double') {
            buffer.writeln('          if (dartValue is num) {');
            buffer.writeln(
              '            this.dartValue.${prop.name} = dartValue.toDouble();',
            );
            buffer.writeln('            return true;');
            buffer.writeln('          }');
          } else {
            buffer.writeln(
              '            this.dartValue.${prop.name} = ${convert(prop.type, "dartValue")};',
            );
            buffer.writeln('            return true;');
          }
        }
        buffer.writeln('        } catch (e) {');
        buffer.writeln('          // Type conversion failed');
        buffer.writeln('        }');
        buffer.writeln('        return false;');
      }
    }

    buffer.writeln('      default:');
    buffer.writeln('        return false;');
    buffer.writeln('    }');
    buffer.writeln('  }');
    buffer.writeln();

    // Generate method wrappers using Intrinsic
    for (final method in methods) {
      buffer.writeln(
        '  /// Creates a MiniScript callable method for ${method.name}',
      );
      buffer.writeln('  Value _create${_capitalize(method.name)}Method() {');
      buffer.writeln('    final fn = Intrinsic.create("_\\\$");');
      buffer.writeln('    fn.name = "${method.name}";');
      // Add parameters
      for (final param in method.parameters) {
        //final paramType = _getDartTypeString(param.type);
        final isNullable =
            param.type.nullabilitySuffix == NullabilitySuffix.question;
        final defaultValue = param.defaultValueCode;
        String defaultValStr = 'null';
        if (defaultValue != null) {
          // Try to convert Dart default value to a MiniScript Value
          // For now, just use as string, but ideally should parse to Value
          defaultValStr = 'ValString(${_escapeString(defaultValue)})';
        } else if (isNullable) {
          defaultValStr = 'ValNull.instance';
        }
        buffer.write('    fn.addParam("${param.name}"');
        if (defaultValStr != 'null') {
          buffer.write(', $defaultValStr');
        }
        buffer.writeln(');');
      }
      buffer.writeln(
        '    Value? f(Context context, [IntrinsicResult? partialResult]) {',
      );
      // Argument extraction
      for (final param in method.parameters) {
        final paramType = _getDartTypeString(param.type);
        final isNullable =
            param.type.nullabilitySuffix == NullabilitySuffix.question;
        buffer.writeln(
          '      var ${param.name} = ConversionUtils.valueToDart(context.getLocal("${param.name}"));',
        );
        if (!isNullable) {
          buffer.writeln('      if (${param.name} == null) {');
          buffer.writeln(
            '        return ValString("Missing required argument: ${param.name}");',
          );
          buffer.writeln('      }');
        }
        if (paramType == 'int') {
          buffer.writeln(
            '      if (${param.name} is num) ${param.name} = ${param.name}.toInt();',
          );
        } else if (paramType == 'double') {
          buffer.writeln(
            '      if (${param.name} is num) ${param.name} = ${param.name}.toDouble();',
          );
        }
      }
      // Call the Dart method
      final argList = method.parameters.map((p) => p.name).join(', ');
      if (method.returnType is DynamicType || method.returnType is VoidType) {
        buffer.writeln('      dartValue.${method.name}($argList);');
        buffer.writeln('      return ValNull.instance;');
      } else {
        buffer.writeln(
          '      var result = dartValue.${method.name}($argList);',
        );
        buffer.writeln('      return ConversionUtils.dartToValue(result);');
      }
      buffer.writeln('    }');
      buffer.writeln(
        '     fn.code = (Context context, [IntrinsicResult? partialResult]) {',
      );
      buffer.writeln(
        '      return IntrinsicResult(f(context, partialResult));',
      );
      buffer.writeln('    };');
      buffer.writeln('    return fn.valFunction;');
      buffer.writeln('  }');
      buffer.writeln();
    }

    buffer.writeln('}');
    buffer.writeln();

    // Generate factory function
    buffer.writeln('/// Factory function to create ${className}Wrapper');
    buffer.writeln(
      '${className}Wrapper create${className}Wrapper($className dartObject) {',
    );
    buffer.writeln('  return ${className}Wrapper(dartObject);');
    buffer.writeln('}');
    buffer.writeln();

    // Generate registration helper
    buffer.writeln('/// Register $className wrapper with the cache');
    buffer.writeln('void register${className}Wrapper() {');
    buffer.writeln('  MiniScriptCache.instance.registerWrapper<$className>(');
    buffer.writeln(
      '    (${className.toLowerCase()}) => ${className}Wrapper(${className.toLowerCase()}),',
    );
    buffer.writeln('  );');
    buffer.writeln('}');

    return buffer.toString();
  }

  List<_MemberInfo> _getVisibleMembers(ClassElement classElement) {
    final members = <_MemberInfo>[];
    final processedNames = <String>{};

    // Handle explicit getters only (not synthetic ones)
    for (final accessor in classElement.accessors) {
      if (!accessor.isPrivate &&
          !_hasHideAnnotation(accessor) &&
          !accessor.isSynthetic) {
        if (accessor.isGetter && !processedNames.contains(accessor.name)) {
          members.add(
            _MemberInfo(
              name: accessor.name,
              isProperty: true,
              isMethod: false,
              isWritable: false,
              isGetter: true,
              type: accessor.returnType,
              parameters: [],
              returnType: accessor.returnType,
            ),
          );
          processedNames.add(accessor.name);
        }
      }
    }

    // Visit all class fields (but skip ones that have explicit getters)
    for (final field in classElement.fields) {
      if (!field.isPrivate &&
          !_hasHideAnnotation(field) &&
          !processedNames.contains(field.name)) {
        members.add(
          _MemberInfo(
            name: field.name,
            isProperty: true,
            isMethod: false,
            isWritable: !field.isFinal,
            isGetter: false,
            type: field.type,
            parameters: [],
            returnType: field.type,
          ),
        );
        processedNames.add(field.name);
      }
    }

    // Handle methods
    for (final method in classElement.methods) {
      if (!method.isPrivate &&
          !method.isOperator &&
          !_hasHideAnnotation(method) &&
          !processedNames.contains(method.name)) {
        members.add(
          _MemberInfo(
            name: method.name,
            isProperty: false,
            isMethod: true,
            isWritable: false,
            isGetter: false,
            type: method.returnType,
            parameters: method.parameters,
            returnType: method.returnType,
          ),
        );
        processedNames.add(method.name);
      }
    }

    return members;
  }

  bool _hasHideAnnotation(Element element) {
    return element.metadata.any((metadata) {
      final value = metadata.computeConstantValue();
      return value?.type?.element?.name == 'Hide';
    });
  }

  static String _getDartTypeString(DartType type) {
    if (type is DynamicType) return 'dynamic';
    if (type is VoidType) return 'void';
    return type.getDisplayString();
  }

  String _capitalize(String str) {
    if (str.isEmpty) return str;
    return str[0].toUpperCase() + str.substring(1);
  }

  String _escapeString(String input) {
    // Escape for Dart string literal
    return "'${input.replaceAll("'", "\\'")}'";
  }
}

class _MemberInfo {
  final String name;
  final bool isProperty;
  final bool isMethod;
  final bool isWritable;
  final bool isGetter;
  final DartType type;
  final List<ParameterElement> parameters;
  final DartType returnType;

  _MemberInfo({
    required this.name,
    required this.isProperty,
    required this.isMethod,
    required this.isWritable,
    required this.isGetter,
    required this.type,
    required this.parameters,
    required this.returnType,
  });
}
