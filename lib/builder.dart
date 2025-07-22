import 'package:analyzer/dart/element/element.dart';
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
    buffer.writeln('import "package:miniscript/miniscript_types/value.dart";');
    buffer.writeln(
      'import "package:miniscript/miniscript_types/value_map.dart";',
    );
    buffer.writeln(
      'import "package:miniscript/miniscript_types/value_string.dart";',
    );
    buffer.writeln(
      'import "package:miniscript/miniscript_types/value_null.dart";',
    );
    buffer.writeln();
    buffer.writeln('import "package:miniscriptgen/src/base_wrapper.dart";');
    buffer.writeln('import "package:miniscriptgen/src/cache.dart";');
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

  String _generateWrapperClass(ClassElement classElement) {
    final className = classElement.name;
    final wrapperName = '${className}Wrapper';
    final buffer = StringBuffer();

    // Generate wrapper class
    buffer.writeln('/// Generated wrapper for $className');
    buffer.writeln('class $wrapperName extends BaseWrapper<$className> {');
    buffer.writeln(
      '  $wrapperName($className dartObject) : super(dartObject);',
    );
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
      buffer.writeln('      case "${prop.name}":');
      buffer.writeln(
        '        return dartToMiniScript(dartValue.${prop.name});',
      );
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
        buffer.writeln('      case "${prop.name}":');
        buffer.writeln('        try {');
        buffer.writeln('          var dartValue = miniScriptToDart(value);');

        // Handle numeric type conversions
        if (dartType == 'int') {
          buffer.writeln(
            '          if (dartValue is num || dartValue == null) {',
          );
          buffer.writeln(
            '            this.dartValue.${prop.name} = dartValue?.toInt();',
          );
        } else if (dartType == 'double') {
          buffer.writeln(
            '          if (dartValue is num || dartValue == null) {',
          );
          buffer.writeln(
            '            this.dartValue.${prop.name} = dartValue?.toDouble();',
          );
        } else {
          buffer.writeln(
            '          if (dartValue is $dartType || dartValue == null) {',
          );
          buffer.writeln(
            '            this.dartValue.${prop.name} = dartValue;',
          );
        }

        buffer.writeln('            return true;');
        buffer.writeln('          }');
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

    // Generate method wrappers
    for (final method in methods) {
      buffer.writeln(
        '  /// Creates a MiniScript callable method for ${method.name}',
      );
      buffer.writeln('  Value _create${_capitalize(method.name)}Method() {');
      buffer.writeln('    var methodMap = ValMap();');
      buffer.writeln('    methodMap.userData = this;');
      buffer.writeln('    methodMap.evalOverride = (key, valuePointer) {');
      buffer.writeln('      if (key is ValString && key.value == "call") {');
      buffer.writeln(
        '        valuePointer.value = _${method.name}CallMethod();',
      );
      buffer.writeln('        return true;');
      buffer.writeln('      }');
      buffer.writeln('      return false;');
      buffer.writeln('    };');
      buffer.writeln('    return methodMap;');
      buffer.writeln('  }');
      buffer.writeln();

      buffer.writeln('  /// Callable method implementation for ${method.name}');
      buffer.writeln('  Value _${method.name}CallMethod() {');
      buffer.writeln('    var callableMap = ValMap();');
      buffer.writeln('    callableMap.userData = this;');
      buffer.writeln('    callableMap.evalOverride = (key, valuePointer) {');
      buffer.writeln('      if (key is ValString && key.value == "invoke") {');

      // Generate method call logic
      if (method.parameters.isEmpty) {
        if (method.returnType is DynamicType || method.returnType is VoidType) {
          buffer.writeln('        dartValue.${method.name}();');
          buffer.writeln('        valuePointer.value = ValNull.instance;');
        } else {
          buffer.writeln('        var result = dartValue.${method.name}();');
          buffer.writeln(
            '        valuePointer.value = dartToMiniScript(result);',
          );
        }
      } else {
        buffer.writeln('        // TODO: Handle method parameters');
        buffer.writeln(
          '        valuePointer.value = ValString("Method ${method.name} called");',
        );
      }

      buffer.writeln('        return true;');
      buffer.writeln('      }');
      buffer.writeln('      return false;');
      buffer.writeln('    };');
      buffer.writeln('    return callableMap;');
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

  String _getDartTypeString(DartType type) {
    if (type is DynamicType) return 'dynamic';
    if (type is VoidType) return 'void';
    return type.getDisplayString(withNullability: false);
  }

  String _capitalize(String str) {
    if (str.isEmpty) return str;
    return str[0].toUpperCase() + str.substring(1);
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
