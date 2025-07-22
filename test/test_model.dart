// This file now serves as a simple reference for the test models
// The actual @visible classes have been moved to models.dart

// Import the test models
import 'models.dart';

/// Simple test helper functions for working with test models
class TestModelHelper {
  static TestModel createBasicTestModel(String name, int value) {
    return TestModel(name, value);
  }

  static TestConfig createTestConfig() {
    return TestConfig(
      environment: 'test',
      debugMode: true,
      features: ['test', 'debug'],
      settings: {'timeout': 30, 'retries': 3},
    );
  }

  static TestResult createTestResult(
    String testName,
    bool passed,
    int duration,
  ) {
    return TestResult(testName: testName, passed: passed, duration: duration);
  }

  static ComplexTestModel createComplexTestModel() {
    return ComplexTestModel(
      name: 'Complex Test',
      intValue: 42,
      doubleValue: 3.14,
      boolValue: true,
      stringList: ['item1', 'item2', 'item3'],
      stringIntMap: {'key1': 1, 'key2': 2},
      intList: [10, 20, 30],
      dynamicMap: {'config': 'value', 'count': 5},
    );
  }

  static PerformanceTestModel createPerformanceTestModel(String id) {
    return PerformanceTestModel(
      id,
      0,
      DateTime.now().millisecondsSinceEpoch.toDouble(),
      [],
    );
  }

  static ErrorTestModel createErrorTestModel() {
    return ErrorTestModel(
      nullableString: null,
      nonNullableInt: 100,
      flag: false,
    );
  }
}
