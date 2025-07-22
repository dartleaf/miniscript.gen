import 'package:miniscript/miniscript.dart';
import 'package:miniscriptgen/src/conversion.dart';
import 'dart:io';

// Import test models
import 'models.dart';

// Import generated wrappers
import 'models.miniscript.dart';

/// Test suite specifically for validating generated wrapper functionality
/// This test thoroughly validates that the generated code actually works correctly
void main() {
  print('=== Generated Wrapper Test Suite ===\n');

  // Run all wrapper tests
  testTestModelWrapper();
  testTestConfigWrapper();
  testTestResultWrapper();
  testComplexTestModelWrapper();
  testPerformanceTestModelWrapper();
  testErrorTestModelWrapper();
  testWrapperInteraction();
  testMethodInvocation();
  testTypeConversions();
  testNullHandling();

  print('\n=== All Generated Wrapper Tests Passed! ===');
}

/// Test TestModel wrapper functionality
void testTestModelWrapper() {
  print('🔧 Testing TestModel wrapper...');

  // Create model and wrapper
  final model = TestModel('TestName', 42);
  final wrapper = TestModelWrapper(model);

  // Test property names
  final propertyNames = wrapper.getPropertyNames();
  assert(propertyNames.contains('name'), 'Should contain name property');
  assert(propertyNames.contains('value'), 'Should contain value property');
  assert(propertyNames.contains('isValid'), 'Should contain isValid getter');
  assert(propertyNames.contains('setValue'), 'Should contain setValue method');
  assert(propertyNames.contains('getName'), 'Should contain getName method');
  assert(
    !propertyNames.contains('_secretKey'),
    'Should not contain hidden property',
  );

  // Test property getters
  final nameValue = wrapper.getProperty('name');
  assert(nameValue is ValString, 'name should be ValString');
  assert((nameValue as ValString).value == 'TestName', 'name should match');

  final valueValue = wrapper.getProperty('value');
  assert(valueValue is ValNumber, 'value should be ValNumber');
  assert((valueValue as ValNumber).value == 42.0, 'value should match');

  final isValidValue = wrapper.getProperty('isValid');
  assert(isValidValue is ValNumber, 'isValid should be ValNumber (boolean)');
  assert(
    (isValidValue as ValNumber).value == 1.0,
    'isValid should be true (1.0)',
  );

  // Test property setters
  final nameSetResult = wrapper.setProperty('name', ValString('NewName'));
  assert(nameSetResult == true, 'name should be settable');
  assert(model.name == 'NewName', 'model.name should be updated');

  final valueSetResult = wrapper.setProperty('value', ValNumber(100.0));
  assert(valueSetResult == true, 'value should be settable');
  assert(model.value == 100, 'model.value should be updated');

  // Test invalid property access
  final invalidGet = wrapper.getProperty('nonexistent');
  assert(invalidGet == null, 'Invalid property should return null');

  final invalidSet = wrapper.setProperty('nonexistent', ValString('test'));
  assert(invalidSet == false, 'Invalid property set should return false');

  // Test read-only property
  final readOnlySet = wrapper.setProperty('isValid', ValNumber(0.0));
  assert(readOnlySet == false, 'Read-only property should not be settable');

  // Test method access
  final setValueMethod = wrapper.getProperty('setValue');
  assert(setValueMethod is ValFunction, 'Method should be ValFunction');

  final getNameMethod = wrapper.getProperty('getName');
  assert(getNameMethod is ValFunction, 'Method should be ValFunction');

  print('✅ TestModel wrapper tests passed');
}

/// Test TestConfig wrapper functionality
void testTestConfigWrapper() {
  print('🔧 Testing TestConfig wrapper...');

  final config = TestConfig(
    environment: 'test',
    debugMode: true,
    features: ['feature1', 'feature2'],
    settings: {'timeout': 30, 'retries': 3},
  );
  final wrapper = TestConfigWrapper(config);

  // Test string property
  final envValue = wrapper.getProperty('environment');
  assert(envValue is ValString, 'environment should be ValString');
  assert((envValue as ValString).value == 'test', 'environment should match');

  // Test boolean property
  final debugValue = wrapper.getProperty('debugMode');
  assert(debugValue is ValNumber, 'debugMode should be ValNumber (boolean)');
  assert((debugValue as ValNumber).value == 1.0, 'debugMode should be true');

  // Test list property
  final featuresValue = wrapper.getProperty('features');
  assert(featuresValue is ValList, 'features should be ValList');
  final featuresList = featuresValue as ValList;
  assert(featuresList.values.length == 2, 'features should have 2 items');
  assert(
    (featuresList.values[0] as ValString).value == 'feature1',
    'First feature should match',
  );

  // Test map property
  final settingsValue = wrapper.getProperty('settings');
  assert(settingsValue is ValMap, 'settings should be ValMap');
  final settingsMap = settingsValue as ValMap;
  final timeoutValue = settingsMap.lookup(
    ValString('timeout'),
    ValuePointer<Value>(),
  );
  assert(timeoutValue is ValNumber, 'timeout should be ValNumber');
  assert((timeoutValue as ValNumber).value == 30.0, 'timeout should be 30');

  // Test property modification
  final envSetResult = wrapper.setProperty(
    'environment',
    ValString('production'),
  );
  assert(envSetResult == true, 'environment should be settable');
  assert(
    config.environment == 'production',
    'config.environment should be updated',
  );

  // Test list property modification
  final newFeatures = ValList();
  newFeatures.values.add(ValString('newFeature'));
  final featuresSetResult = wrapper.setProperty('features', newFeatures);
  assert(featuresSetResult == true, 'features should be settable');
  assert(config.features.length == 1, 'config.features should be updated');
  assert(
    config.features[0] == 'newFeature',
    'config.features should contain new feature',
  );

  print('✅ TestConfig wrapper tests passed');
}

/// Test TestResult wrapper functionality
void testTestResultWrapper() {
  print('🔧 Testing TestResult wrapper...');

  final result = TestResult(
    testName: 'SampleTest',
    passed: false,
    errorMessage: 'Test failed',
    duration: 1500,
  );
  final wrapper = TestResultWrapper(result);

  // Test required string property
  final nameValue = wrapper.getProperty('testName');
  assert(nameValue is ValString, 'testName should be ValString');
  assert(
    (nameValue as ValString).value == 'SampleTest',
    'testName should match',
  );

  // Test boolean property
  final passedValue = wrapper.getProperty('passed');
  assert(passedValue is ValNumber, 'passed should be ValNumber (boolean)');
  assert(
    (passedValue as ValNumber).value == 0.0,
    'passed should be false (0.0)',
  );

  // Test nullable string property
  final errorValue = wrapper.getProperty('errorMessage');
  assert(errorValue is ValString, 'errorMessage should be ValString');
  assert(
    (errorValue as ValString).value == 'Test failed',
    'errorMessage should match',
  );

  // Test int property
  final durationValue = wrapper.getProperty('duration');
  assert(durationValue is ValNumber, 'duration should be ValNumber');
  assert((durationValue as ValNumber).value == 1500.0, 'duration should match');

  // Test getter property
  final isSuccessValue = wrapper.getProperty('isSuccess');
  assert(isSuccessValue is ValNumber, 'isSuccess should be ValNumber');
  assert(
    (isSuccessValue as ValNumber).value == 0.0,
    'isSuccess should be false',
  );

  // Test property modification
  final passedSetResult = wrapper.setProperty('passed', ValNumber(1.0));
  assert(passedSetResult == true, 'passed should be settable');
  assert(result.passed == true, 'result.passed should be updated');

  // Test nullable property with null
  final nullSetResult = wrapper.setProperty('errorMessage', ValNull.instance);
  assert(nullSetResult == true, 'errorMessage should accept null');
  assert(result.errorMessage == null, 'result.errorMessage should be null');

  print('✅ TestResult wrapper tests passed');
}

/// Test ComplexTestModel wrapper functionality
void testComplexTestModelWrapper() {
  print('🔧 Testing ComplexTestModel wrapper...');

  final model = ComplexTestModel(
    name: 'Complex',
    intValue: 42,
    doubleValue: 3.14,
    boolValue: true,
    stringList: ['item1', 'item2'],
    stringIntMap: {'key1': 1, 'key2': 2},
    intList: [10, 20, 30],
    dynamicMap: {'config': 'value'},
  );
  final wrapper = ComplexTestModelWrapper(model);

  // Test all property types
  final nameValue = wrapper.getProperty('name');
  assert(nameValue is ValString, 'name should be ValString');

  final intValue = wrapper.getProperty('intValue');
  assert(intValue is ValNumber, 'intValue should be ValNumber');
  assert((intValue as ValNumber).value == 42.0, 'intValue should match');

  final doubleValue = wrapper.getProperty('doubleValue');
  assert(doubleValue is ValNumber, 'doubleValue should be ValNumber');
  assert((doubleValue as ValNumber).value == 3.14, 'doubleValue should match');

  final boolValue = wrapper.getProperty('boolValue');
  assert(boolValue is ValNumber, 'boolValue should be ValNumber (boolean)');
  assert((boolValue as ValNumber).value == 1.0, 'boolValue should be true');

  final stringListValue = wrapper.getProperty('stringList');
  assert(stringListValue is ValList, 'stringList should be ValList');
  final stringList = stringListValue as ValList;
  assert(stringList.values.length == 2, 'stringList should have 2 items');

  final stringIntMapValue = wrapper.getProperty('stringIntMap');
  assert(stringIntMapValue is ValMap, 'stringIntMap should be ValMap');

  final intListValue = wrapper.getProperty('intList');
  assert(intListValue is ValList, 'intList should be ValList');
  final intList = intListValue as ValList;
  assert(intList.values.length == 3, 'intList should have 3 items');

  final dynamicMapValue = wrapper.getProperty('dynamicMap');
  assert(dynamicMapValue is ValMap, 'dynamicMap should be ValMap');

  // Test computed properties
  final listLengthValue = wrapper.getProperty('listLength');
  assert(listLengthValue is ValNumber, 'listLength should be ValNumber');
  assert((listLengthValue as ValNumber).value == 2.0, 'listLength should be 2');

  final mapSizeValue = wrapper.getProperty('mapSize');
  assert(mapSizeValue is ValNumber, 'mapSize should be ValNumber');
  assert((mapSizeValue as ValNumber).value == 2.0, 'mapSize should be 2');

  // Test type conversions for setters
  final intSetResult = wrapper.setProperty('intValue', ValNumber(100.0));
  assert(intSetResult == true, 'intValue should be settable');
  assert(model.intValue == 100, 'model.intValue should be updated');

  final doubleSetResult = wrapper.setProperty('doubleValue', ValNumber(2.71));
  assert(doubleSetResult == true, 'doubleValue should be settable');
  assert(model.doubleValue == 2.71, 'model.doubleValue should be updated');

  print('✅ ComplexTestModel wrapper tests passed');
}

/// Test PerformanceTestModel wrapper functionality
void testPerformanceTestModelWrapper() {
  print('🔧 Testing PerformanceTestModel wrapper...');

  final model = PerformanceTestModel(
    'perf_001',
    0,
    DateTime.now().millisecondsSinceEpoch.toDouble(),
    ['data1', 'data2'],
  );
  final wrapper = PerformanceTestModelWrapper(model);

  // Test all properties
  final idValue = wrapper.getProperty('id');
  assert(idValue is ValString, 'id should be ValString');
  assert((idValue as ValString).value == 'perf_001', 'id should match');

  final counterValue = wrapper.getProperty('counter');
  assert(counterValue is ValNumber, 'counter should be ValNumber');
  assert((counterValue as ValNumber).value == 0.0, 'counter should be 0');

  final timestampValue = wrapper.getProperty('timestamp');
  assert(timestampValue is ValNumber, 'timestamp should be ValNumber');

  final dataValue = wrapper.getProperty('data');
  assert(dataValue is ValList, 'data should be ValList');
  final dataList = dataValue as ValList;
  assert(dataList.values.length == 2, 'data should have 2 items');

  // Test computed status property
  final statusValue = wrapper.getProperty('status');
  assert(statusValue is ValString, 'status should be ValString');
  final statusString = (statusValue as ValString).value;
  assert(statusString.contains('ID: perf_001'), 'status should contain ID');
  assert(statusString.contains('Counter: 0'), 'status should contain counter');
  assert(
    statusString.contains('Data: 2 items'),
    'status should contain data count',
  );

  // Test methods
  final incrementMethod = wrapper.getProperty('increment');
  assert(incrementMethod is ValFunction, 'increment should be method');

  final updateTimestampMethod = wrapper.getProperty('updateTimestamp');
  assert(
    updateTimestampMethod is ValFunction,
    'updateTimestamp should be method',
  );

  final addDataMethod = wrapper.getProperty('addData');
  assert(addDataMethod is ValFunction, 'addData should be method');

  print('✅ PerformanceTestModel wrapper tests passed');
}

/// Test ErrorTestModel wrapper functionality
void testErrorTestModelWrapper() {
  print('🔧 Testing ErrorTestModel wrapper...');

  final model = ErrorTestModel(
    nullableString: null,
    nonNullableInt: 42,
    flag: true,
  );
  final wrapper = ErrorTestModelWrapper(model);

  // Test nullable property
  final nullableValue = wrapper.getProperty('nullableString');
  assert(nullableValue is ValNull, 'nullableString should be ValNull');

  // Test non-nullable property
  final nonNullableValue = wrapper.getProperty('nonNullableInt');
  assert(nonNullableValue is ValNumber, 'nonNullableInt should be ValNumber');
  assert(
    (nonNullableValue as ValNumber).value == 42.0,
    'nonNullableInt should be 42',
  );

  // Test flag property
  final flagValue = wrapper.getProperty('flag');
  assert(flagValue is ValNumber, 'flag should be ValNumber');
  assert((flagValue as ValNumber).value == 1.0, 'flag should be true');

  // Test computed description property
  final descriptionValue = wrapper.getProperty('description');
  assert(descriptionValue is ValString, 'description should be ValString');
  final descriptionString = (descriptionValue as ValString).value;
  assert(
    descriptionString.contains('String: null'),
    'description should contain null string',
  );
  assert(
    descriptionString.contains('Int: 42'),
    'description should contain int value',
  );
  assert(
    descriptionString.contains('Flag: true'),
    'description should contain flag value',
  );

  // Test setting nullable property
  final nullSetResult = wrapper.setProperty(
    'nullableString',
    ValString('test'),
  );
  assert(nullSetResult == true, 'nullableString should be settable');
  assert(
    model.nullableString == 'test',
    'model.nullableString should be updated',
  );

  // Test setting nullable property to null
  final nullBackResult = wrapper.setProperty(
    'nullableString',
    ValNull.instance,
  );
  assert(nullBackResult == true, 'nullableString should accept null');
  assert(model.nullableString == null, 'model.nullableString should be null');

  print('✅ ErrorTestModel wrapper tests passed');
}

/// Test wrapper interaction and integration
void testWrapperInteraction() {
  print('🔧 Testing wrapper interaction...');

  // Create multiple wrappers
  final model1 = TestModel('Model1', 10);
  final model2 = TestModel('Model2', 20);
  final wrapper1 = TestModelWrapper(model1);
  final wrapper2 = TestModelWrapper(model2);

  // Test that wrappers are independent
  wrapper1.setProperty('value', ValNumber(100.0));
  wrapper2.setProperty('value', ValNumber(200.0));

  assert(model1.value == 100, 'model1.value should be 100');
  assert(model2.value == 200, 'model2.value should be 200');

  // Test property access independence
  final value1 = wrapper1.getProperty('value');
  final value2 = wrapper2.getProperty('value');
  assert((value1 as ValNumber).value == 100.0, 'wrapper1 value should be 100');
  assert((value2 as ValNumber).value == 200.0, 'wrapper2 value should be 200');

  // Test with cache registration
  registerTestModelWrapper();

  print('✅ Wrapper interaction tests passed');
}

/// Test method invocation functionality
void testMethodInvocation() {
  print('🔧 Testing method invocation...');

  final model = TestModel('Test', 42);
  final wrapper = TestModelWrapper(model);

  // Test method retrieval
  final setValueMethod = wrapper.getProperty('setValue');
  assert(
    setValueMethod is ValFunction,
    'setValue should be ValFunction method',
  );

  final getNameMethod = wrapper.getProperty('getName');
  assert(getNameMethod is ValFunction, 'getName should be ValFunction method');

  // Test method has call property
  final f = ConversionUtils.valueToDartFunction(
    (setValueMethod as ValFunction),
  );
  final value = f(Interpreter(), [ValNumber(100)]);
  assert(value == null, 'Call should return null');

  print('✅ Method invocation tests passed');
}

/// Test type conversion edge cases
void testTypeConversions() {
  print('🔧 Testing type conversions...');

  final model = ComplexTestModel(
    name: 'Convert',
    intValue: 42,
    doubleValue: 3.14,
    boolValue: true,
    stringList: ['a', 'b'],
    stringIntMap: {'x': 1, 'y': 2},
    intList: [1, 2, 3],
    dynamicMap: {'test': 'value'},
  );
  final wrapper = ComplexTestModelWrapper(model);

  // Test int to double conversion
  final intSetResult = wrapper.setProperty('intValue', ValNumber(50.7));
  assert(intSetResult == true, 'intValue should accept double');
  assert(model.intValue == 50, 'intValue should be converted to int');

  // Test double to int conversion
  final doubleSetResult = wrapper.setProperty('doubleValue', ValNumber(100.0));
  assert(doubleSetResult == true, 'doubleValue should accept int');
  assert(model.doubleValue == 100.0, 'doubleValue should be 100.0');

  // Test type mismatch rejection
  final wrongTypeResult = wrapper.setProperty(
    'intValue',
    ValString('not a number'),
  );
  assert(wrongTypeResult == false, 'intValue should reject string');

  // Test null assignment to non-nullable
  final nullResult = wrapper.setProperty('intValue', ValNull.instance);
  assert(nullResult == false, 'intValue should reject null');

  print('✅ Type conversion tests passed');
}

/// Test null handling in various scenarios
void testNullHandling() {
  print('🔧 Testing null handling...');

  final model = ErrorTestModel(
    nullableString: 'initial',
    nonNullableInt: 42,
    flag: false,
  );
  final wrapper = ErrorTestModelWrapper(model);

  // Test nullable property with null
  final nullSetResult = wrapper.setProperty('nullableString', ValNull.instance);
  assert(nullSetResult == true, 'nullable property should accept null');
  assert(model.nullableString == null, 'model property should be null');

  // Test nullable property with value
  final valueSetResult = wrapper.setProperty(
    'nullableString',
    ValString('test'),
  );
  assert(valueSetResult == true, 'nullable property should accept value');
  assert(model.nullableString == 'test', 'model property should have value');

  // Test non-nullable property with null
  final nonNullableNullResult = wrapper.setProperty(
    'nonNullableInt',
    ValNull.instance,
  );
  assert(
    nonNullableNullResult == false,
    'non-nullable property should reject null',
  );
  assert(model.nonNullableInt == 42, 'model property should be unchanged');

  // Test getter with null value
  model.nullableString = null;
  final nullGetResult = wrapper.getProperty('nullableString');
  assert(nullGetResult is ValNull, 'getter should return ValNull for null');

  print('✅ Null handling tests passed');
}

/// Helper function to test file existence
bool fileExists(String path) {
  return File(path).existsSync();
}

/// Helper function to validate generated file structure
void validateGeneratedFile(String path) {
  if (!fileExists(path)) {
    throw Exception('Generated file not found: $path');
  }

  final content = File(path).readAsStringSync();

  // Check for required imports
  assert(
    content.contains('import "package:miniscript/miniscript_types/value.dart"'),
    'Generated file should import Value',
  );
  assert(
    content.contains('import "package:miniscriptgen/src/base_wrapper.dart"'),
    'Generated file should import BaseWrapper',
  );
  assert(
    content.contains('import "package:miniscriptgen/src/cache.dart"'),
    'Generated file should import cache',
  );

  // Check for wrapper class
  assert(
    content.contains('extends BaseWrapper'),
    'Generated file should contain wrapper class',
  );

  // Check for required methods
  assert(
    content.contains('getPropertyNames()'),
    'Generated file should have getPropertyNames method',
  );
  assert(
    content.contains('getProperty(String propertyName)'),
    'Generated file should have getProperty method',
  );
  assert(
    content.contains('setProperty(String propertyName, Value? value)'),
    'Generated file should have setProperty method',
  );
}
