import 'package:miniscript/miniscript.dart';
import 'package:miniscriptgen/lib.dart';

// Import test models
import 'models.dart';

// Import generated wrappers
import 'models.miniscript.dart';

/// Demo showing how to use generated MiniScript wrappers
void main() {
  print('=== MiniScript Wrapper Demo ===\n');

  // Register all wrappers with the cache
  registerAllWrappers();

  // Demo 1: Basic wrapper usage
  demoBasicWrapper();

  // Demo 2: Property access and modification
  demoPropertyAccess();

  // Demo 3: Method invocation
  demoMethodInvocation();

  // Demo 4: Type conversions
  demoTypeConversions();

  // Demo 5: Complex data structures
  demoComplexStructures();

  // Demo 6: Error handling
  demoErrorHandling();

  // Demo 7: Cache integration
  demoCacheIntegration();

  print('\n=== Demo Complete! ===');
}

/// Register all generated wrappers with the cache
void registerAllWrappers() {
  print('📝 Registering wrappers with cache...');

  registerTestModelWrapper();
  registerTestConfigWrapper();
  registerTestResultWrapper();
  registerComplexTestModelWrapper();
  registerPerformanceTestModelWrapper();
  registerErrorTestModelWrapper();

  print('✅ All wrappers registered\n');
}

/// Demo 1: Basic wrapper creation and usage
void demoBasicWrapper() {
  print('🔧 Demo 1: Basic Wrapper Usage');

  // Create a Dart object
  final player = TestModel('John Doe', 100);
  print('Created Dart object: ${player.name} with ${player.value} health');

  // Create wrapper
  final wrapper = TestModelWrapper(player);
  print('Created wrapper for TestModel');

  // Access properties through wrapper
  final nameValue = wrapper.getProperty('name');
  final healthValue = wrapper.getProperty('value');

  print('Name from wrapper: ${(nameValue as ValString).value}');
  print('Health from wrapper: ${(healthValue as ValNumber).value}');

  // Check available properties
  final properties = wrapper.getPropertyNames();
  print('Available properties: ${properties.join(', ')}');

  print('✅ Basic wrapper demo complete\n');
}

/// Demo 2: Property access and modification
void demoPropertyAccess() {
  print('🔧 Demo 2: Property Access and Modification');

  final config = TestConfig(
    environment: 'development',
    debugMode: true,
    features: ['logging', 'debugging'],
  );
  final wrapper = TestConfigWrapper(config);

  // Read properties
  print('Original environment: ${config.environment}');
  print('Original debug mode: ${config.debugMode}');
  print('Original features: ${config.features}');

  // Modify properties through wrapper
  wrapper.setProperty('environment', ValString('production'));
  wrapper.setProperty('debugMode', ValNumber(0.0)); // false

  print('Modified environment: ${config.environment}');
  print('Modified debug mode: ${config.debugMode}');

  // Modify list property
  final newFeatures = ValList();
  newFeatures.values.add(ValString('performance'));
  newFeatures.values.add(ValString('security'));
  wrapper.setProperty('features', newFeatures);

  print('Modified features: ${config.features}');

  print('✅ Property access demo complete\n');
}

/// Demo 3: Method invocation
void demoMethodInvocation() {
  print('🔧 Demo 3: Method Invocation');

  final model = TestModel('Alice', 50);
  final wrapper = TestModelWrapper(model);

  print('Original name: ${model.name}');
  print('Original value: ${model.value}');

  // Get method objects
  final setValueMethod = wrapper.getProperty('setValue');
  final getNameMethod = wrapper.getProperty('getName');

  print('setValue method type: ${setValueMethod.runtimeType}');
  print('getName method type: ${getNameMethod.runtimeType}');

  // Methods are ValMap objects with special behavior
  if (setValueMethod is ValMap) {
    print('setValue method has userData: ${setValueMethod.userData != null}');
    print(
      'setValue method is callable: ${setValueMethod.evalOverride != null}',
    );
  }

  // Call getName method (demonstrates method invocation structure)
  if (getNameMethod is ValMap && getNameMethod.evalOverride != null) {
    final callPointer = ValuePointer<Value>();
    final hasCall = getNameMethod.evalOverride!(ValString('call'), callPointer);

    if (hasCall && callPointer.value is ValMap) {
      final callMethod = callPointer.value as ValMap;
      final invokePointer = ValuePointer<Value>();
      final canInvoke = callMethod.evalOverride!(
        ValString('invoke'),
        invokePointer,
      );

      if (canInvoke) {
        print('Method invocation result: ${invokePointer.value}');
      }
    }
  }

  print('✅ Method invocation demo complete\n');
}

/// Demo 4: Type conversions
void demoTypeConversions() {
  print('🔧 Demo 4: Type Conversions');

  final complex = ComplexTestModel(
    name: 'TypeDemo',
    intValue: 42,
    doubleValue: 3.14,
    boolValue: true,
    stringList: ['item1', 'item2'],
    stringIntMap: {'key1': 10, 'key2': 20},
    intList: [1, 2, 3],
    dynamicMap: {'setting': 'value'},
  );
  final wrapper = ComplexTestModelWrapper(complex);

  // Demonstrate various type conversions
  print('Original int value: ${complex.intValue}');
  wrapper.setProperty('intValue', ValNumber(100.7)); // Double to int
  print('After setting double (100.7): ${complex.intValue}');

  print('Original double value: ${complex.doubleValue}');
  wrapper.setProperty('doubleValue', ValNumber(50.0)); // Int to double
  print('After setting int (50): ${complex.doubleValue}');

  print('Original bool value: ${complex.boolValue}');
  wrapper.setProperty('boolValue', ValNumber(0.0)); // Number to bool
  print('After setting 0.0: ${complex.boolValue}');

  // List and Map conversions
  print('String list length: ${complex.stringList.length}');
  final stringListValue = wrapper.getProperty('stringList');
  if (stringListValue is ValList) {
    print('Converted to ValList with ${stringListValue.values.length} items');
  }

  print('String-int map size: ${complex.stringIntMap.length}');
  final mapValue = wrapper.getProperty('stringIntMap');
  if (mapValue is ValMap) {
    print('Converted to ValMap with ${mapValue.keys.length} keys');
  }

  print('✅ Type conversions demo complete\n');
}

/// Demo 5: Complex data structures
void demoComplexStructures() {
  print('🔧 Demo 5: Complex Data Structures');

  // Create complex nested data
  final testResult = TestResult(
    testName: 'Integration Test',
    passed: true,
    errorMessage: null,
    duration: 2500,
  );

  final wrapper = TestResultWrapper(testResult);

  // Access nested properties
  print('Test name: ${testResult.testName}');
  print('Test passed: ${testResult.passed}');
  print('Error message: ${testResult.errorMessage}');
  print('Duration: ${testResult.duration}ms');

  // Convert to JSON-like structure
  final jsonValue = wrapper.getProperty('toJson');
  if (jsonValue is ValMap) {
    print('toJson method available');
  }

  // Test computed properties
  final isSuccessValue = wrapper.getProperty('isSuccess');
  print('isSuccess (computed): ${(isSuccessValue as ValNumber).value == 1.0}');

  // Modify and see changes
  wrapper.setProperty('passed', ValNumber(0.0));
  wrapper.setProperty('errorMessage', ValString('Test failed'));

  print('After modification:');
  print('  passed: ${testResult.passed}');
  print('  errorMessage: ${testResult.errorMessage}');

  final newIsSuccessValue = wrapper.getProperty('isSuccess');
  print('  isSuccess: ${(newIsSuccessValue as ValNumber).value == 1.0}');

  print('✅ Complex structures demo complete\n');
}

/// Demo 6: Error handling
void demoErrorHandling() {
  print('🔧 Demo 6: Error Handling');

  final errorModel = ErrorTestModel(
    nullableString: 'initial',
    nonNullableInt: 42,
    flag: true,
  );
  final wrapper = ErrorTestModelWrapper(errorModel);

  // Test valid operations
  print('Original nullable string: ${errorModel.nullableString}');
  final validSet = wrapper.setProperty(
    'nullableString',
    ValString('new value'),
  );
  print('Valid set result: $validSet');
  print('New nullable string: ${errorModel.nullableString}');

  // Test null assignment to nullable property
  final nullSet = wrapper.setProperty('nullableString', ValNull.instance);
  print('Null set result: $nullSet');
  print('Nullable string after null: ${errorModel.nullableString}');

  // Test null assignment to non-nullable property
  final invalidNullSet = wrapper.setProperty(
    'nonNullableInt',
    ValNull.instance,
  );
  print('Invalid null set result: $invalidNullSet');
  print('Non-nullable int unchanged: ${errorModel.nonNullableInt}');

  // Test type mismatch
  final typeMismatch = wrapper.setProperty(
    'nonNullableInt',
    ValString('not a number'),
  );
  print('Type mismatch result: $typeMismatch');
  print('Non-nullable int unchanged: ${errorModel.nonNullableInt}');

  // Test invalid property access
  final invalidGet = wrapper.getProperty('nonExistentProperty');
  print('Invalid property get result: $invalidGet');

  final invalidSet = wrapper.setProperty(
    'nonExistentProperty',
    ValString('test'),
  );
  print('Invalid property set result: $invalidSet');

  print('✅ Error handling demo complete\n');
}

/// Demo 7: Cache integration
void demoCacheIntegration() {
  print('🔧 Demo 7: Cache Integration');

  // Create objects
  final model1 = TestModel('Player1', 100);
  final model2 = TestModel('Player2', 200);

  // Use cache to create wrappers
  final wrapper1 = createTestModelWrapper(model1);
  final wrapper2 = createTestModelWrapper(model2);

  print('Created wrapper1 for: ${model1.name}');
  print('Created wrapper2 for: ${model2.name}');

  // Test wrapper properties
  final name1 = wrapper1.getProperty('name');
  final name2 = wrapper2.getProperty('name');
  print('Wrapper1 name: ${(name1 as ValString).value}');
  print('Wrapper2 name: ${(name2 as ValString).value}');

  // Test wrapper value access
  final value1 = wrapper1.getProperty('value');
  final value2 = wrapper2.getProperty('value');
  print('Wrapper1 value: ${(value1 as ValNumber).value}');
  print('Wrapper2 value: ${(value2 as ValNumber).value}');

  // Modify values through wrappers
  wrapper1.setProperty('value', ValNumber(150.0));
  wrapper2.setProperty('value', ValNumber(250.0));
  print('After modification via wrappers:');
  print('  Model1 value: ${model1.value}');
  print('  Model2 value: ${model2.value}');

  // Test wrapper method access
  final getName1 = wrapper1.getProperty('getName');
  final getName2 = wrapper2.getProperty('getName');
  print('Wrapper1 getName method: ${getName1.runtimeType}');
  print('Wrapper2 getName method: ${getName2.runtimeType}');

  // Use dartToMiniScript function (uses cache)
  final miniScriptValue1 = ConversionUtils.dartToValue(model1);
  final miniScriptValue2 = ConversionUtils.dartToValue(model2);

  print('Converted to MiniScript values:');
  print('  Value1 type: ${miniScriptValue1.runtimeType}');
  print('  Value2 type: ${miniScriptValue2.runtimeType}');

  // Convert back to Dart
  final dartValue1 = ConversionUtils.valueToDart(miniScriptValue1);
  final dartValue2 = ConversionUtils.valueToDart(miniScriptValue2);

  print('Converted back to Dart:');
  print('  Value1 type: ${dartValue1.runtimeType}');
  print('  Value2 type: ${dartValue2.runtimeType}');

  if (dartValue1 is TestModel) {
    print('  Value1 name: ${dartValue1.name}');
  }

  if (dartValue2 is TestModel) {
    print('  Value2 name: ${dartValue2.name}');
  }

  // Show cache statistics
  final cacheStats = MiniScriptCache.instance.getCacheStats();
  print('Cache statistics: $cacheStats');

  print('✅ Cache integration demo complete\n');
}

/// Utility function to demonstrate conversion
void showConversion(String label, dynamic value) {
  final miniScriptValue = ConversionUtils.dartToValue(value);
  final backToDart = ConversionUtils.valueToDart(miniScriptValue);

  print('$label:');
  print('  Dart: $value (${value.runtimeType})');
  print('  MiniScript: $miniScriptValue (${miniScriptValue.runtimeType})');
  print('  Back to Dart: $backToDart (${backToDart.runtimeType})');
  print('  Round-trip successful: ${value == backToDart}');
}
