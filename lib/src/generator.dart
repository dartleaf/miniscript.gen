import 'dart:mirrors';

import 'annotations.dart';

/// Information about a property that should be exposed to MiniScript.
class PropertyInfo {
  final String name;
  final Type type;
  final bool isReadable;
  final bool isWritable;
  final bool isMethod;
  final List<Type> parameterTypes;
  final Type returnType;

  PropertyInfo({
    required this.name,
    required this.type,
    this.isReadable = true,
    this.isWritable = true,
    this.isMethod = false,
    this.parameterTypes = const [],
    this.returnType = dynamic,
  });
}

/// Information about a class that should be wrapped for MiniScript.
class ClassInfo {
  final String name;
  final Type type;
  final List<PropertyInfo> properties;
  final List<PropertyInfo> methods;

  ClassInfo({
    required this.name,
    required this.type,
    required this.properties,
    required this.methods,
  });
}

/// Main code generator class for creating MiniScript wrappers.
class MiniScriptGenerator {
  static final MiniScriptGenerator _instance = MiniScriptGenerator._internal();

  /// Gets the singleton instance of the generator.
  static MiniScriptGenerator get instance => _instance;

  MiniScriptGenerator._internal();

  /// Analyzes a class and generates wrapper information.
  ClassInfo analyzeClass(Type classType) {
    var classMirror = reflectClass(classType);
    var className = classMirror.simpleName.toString();
    className = className.replaceAll('Symbol("', '').replaceAll('")', '');

    // Check if class has @visible annotation
    bool hasVisibleAnnotation = false;
    for (var metadata in classMirror.metadata) {
      if (metadata.reflectee is Visible) {
        hasVisibleAnnotation = true;
        break;
      }
    }

    if (!hasVisibleAnnotation) {
      throw ArgumentError('Class $className must have @visible annotation');
    }

    var properties = <PropertyInfo>[];
    var methods = <PropertyInfo>[];

    // Analyze instance variables
    classMirror.declarations.forEach((symbol, declaration) {
      var memberName = symbol.toString();
      memberName = memberName.replaceAll('Symbol("', '').replaceAll('")', '');

      // Skip private members
      if (memberName.startsWith('_')) return;

      // Check for @hide annotation
      bool isHidden = false;
      for (var metadata in declaration.metadata) {
        if (metadata.reflectee is Hide) {
          isHidden = true;
          break;
        }
      }

      if (isHidden) return;

      if (declaration is VariableMirror) {
        // It's a property
        var propertyInfo = PropertyInfo(
          name: memberName,
          type: declaration.type.reflectedType,
          isReadable: true,
          isWritable: !declaration.isFinal,
        );
        properties.add(propertyInfo);
      } else if (declaration is MethodMirror && !declaration.isConstructor) {
        // It's a method
        var parameterTypes = <Type>[];
        for (var param in declaration.parameters) {
          parameterTypes.add(param.type.reflectedType);
        }

        var methodInfo = PropertyInfo(
          name: memberName,
          type: declaration.returnType.reflectedType,
          isMethod: true,
          parameterTypes: parameterTypes,
          returnType: declaration.returnType.reflectedType,
        );
        methods.add(methodInfo);
      }
    });

    return ClassInfo(
      name: className,
      type: classType,
      properties: properties,
      methods: methods,
    );
  }

  /// Generates the wrapper class code for a given class.
  String generateWrapperClass(ClassInfo classInfo) {
    var buffer = StringBuffer();
    var className = classInfo.name;
    var wrapperName = '${className}Wrapper';

    // Generate class header
    buffer.writeln('/// Generated wrapper for $className');
    buffer.writeln('class $wrapperName extends BaseWrapper<$className> {');
    buffer.writeln('  $wrapperName(super.dartObject);');
    buffer.writeln();

    // Generate property names list
    buffer.writeln('  @override');
    buffer.writeln('  List<String> getPropertyNames() {');
    buffer.writeln('    return [');
    for (var prop in classInfo.properties) {
      buffer.writeln('      "${prop.name}",');
    }
    for (var method in classInfo.methods) {
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
    for (var prop in classInfo.properties) {
      buffer.writeln('      case "${prop.name}":');
      buffer.writeln(
        '        return dartToMiniScript(dartValue.${prop.name});',
      );
    }

    // Generate method bindings
    for (var method in classInfo.methods) {
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

    // Generate property setters
    for (var prop in classInfo.properties) {
      if (prop.isWritable) {
        buffer.writeln('      case "${prop.name}":');
        buffer.writeln('        try {');
        buffer.writeln('          var dartValue = miniScriptToDart(value);');
        buffer.writeln(
          '          if (dartValue is ${prop.type.toString()} || dartValue == null) {',
        );
        buffer.writeln('            this.dartValue.${prop.name} = dartValue;');
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
    for (var method in classInfo.methods) {
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
      buffer.writeln(
        '        // This would be called by MiniScript when the method is invoked',
      );
      buffer.writeln('        // For now, we return a placeholder');
      buffer.writeln(
        '        valuePointer.value = ValString("Method ${method.name} called");',
      );
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

    return buffer.toString();
  }

  /// Generates the complete wrapper file for a class.
  String generateWrapperFile(ClassInfo classInfo) {
    var buffer = StringBuffer();
    var className = classInfo.name;

    // Generate file header
    buffer.writeln('/// Generated MiniScript wrapper for $className');
    buffer.writeln('/// This file is auto-generated. Do not edit manually.');
    buffer.writeln();

    // Generate imports
    buffer.writeln('import "package:miniscript/miniscript_types/value.dart";');
    buffer.writeln(
      'import "package:miniscript/miniscript_types/value_map.dart";',
    );
    buffer.writeln(
      'import "package:miniscript/miniscript_types/value_string.dart";',
    );
    buffer.writeln(
      'import "package:miniscript/miniscript_types/value_number.dart";',
    );
    buffer.writeln(
      'import "package:miniscript/miniscript_types/value_list.dart";',
    );
    buffer.writeln(
      'import "package:miniscript/miniscript_types/value_null.dart";',
    );
    buffer.writeln('import "package:miniscript/value_pointer.dart";');
    buffer.writeln();
    buffer.writeln('import "../base_wrapper.dart";');
    buffer.writeln('import "../cache.dart";');
    buffer.writeln('import "../conversion.dart";');
    buffer.writeln();
    buffer.writeln('// Import the original class');
    buffer.writeln('// TODO: Add proper import path for $className');
    buffer.writeln();

    // Generate wrapper class
    buffer.write(generateWrapperClass(classInfo));

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

  /// Generates the setup function that registers all wrappers.
  String generateSetupFunction(List<ClassInfo> classes) {
    var buffer = StringBuffer();

    buffer.writeln('/// Auto-generated setup function for MiniScript cache');
    buffer.writeln('/// This file is auto-generated. Do not edit manually.');
    buffer.writeln();

    // Generate imports
    buffer.writeln('import "cache.dart";');
    buffer.writeln();

    // Import all wrapper files
    for (var classInfo in classes) {
      buffer.writeln(
        'import "wrappers/${classInfo.name.toLowerCase()}_wrapper.dart";',
      );
    }
    buffer.writeln();

    // Generate setup function
    buffer.writeln(
      '/// Sets up the MiniScript cache with all generated wrappers.',
    );
    buffer.writeln('void setupMiniScriptCache() {');
    buffer.writeln('  var cache = MiniScriptCache.instance;');
    buffer.writeln();

    for (var classInfo in classes) {
      buffer.writeln('  // Register ${classInfo.name} wrapper');
      buffer.writeln('  register${classInfo.name}Wrapper();');
    }

    buffer.writeln('}');

    return buffer.toString();
  }

  /// Capitalizes the first letter of a string.
  String _capitalize(String str) {
    if (str.isEmpty) return str;
    return str[0].toUpperCase() + str.substring(1);
  }
}

/// Convenience function to analyze and generate wrapper for a class.
String generateWrapperForClass(Type classType) {
  var generator = MiniScriptGenerator.instance;
  var classInfo = generator.analyzeClass(classType);
  return generator.generateWrapperFile(classInfo);
}

/// Convenience function to generate setup function for multiple classes.
String generateSetupForClasses(List<Type> classTypes) {
  var generator = MiniScriptGenerator.instance;
  var classInfos =
      classTypes.map((type) => generator.analyzeClass(type)).toList();
  return generator.generateSetupFunction(classInfos);
}
