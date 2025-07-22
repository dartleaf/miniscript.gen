import 'package:miniscriptgen/miniscriptgen.dart';

/// Basic test model for wrapper generation testing
@visible
class TestModel {
  String name;
  int value;

  @hide
  String secretKey = 'hidden';

  TestModel(this.name, this.value);

  void setValue(int newValue) {
    value = newValue;
  }

  String getName() {
    return name;
  }

  bool get isValid => value > 0;

  @hide
  void internalMethod() {
    // This should not be accessible from MiniScript
  }
}

/// Test configuration class for build settings
@visible
class TestConfig {
  String environment;
  bool debugMode;
  List<String> features;
  Map<String, dynamic> settings;

  TestConfig({
    this.environment = 'test',
    this.debugMode = true,
    this.features = const ['test', 'debug'],
    this.settings = const {'timeout': 30, 'retries': 3},
  });

  void enableFeature(String feature) {
    if (!features.contains(feature)) {
      features.add(feature);
    }
  }

  void setSetting(String key, dynamic value) {
    settings[key] = value;
  }

  dynamic getSetting(String key) {
    return settings[key];
  }
}

/// Test result class for tracking test outcomes
@visible
class TestResult {
  String testName;
  bool passed;
  String? errorMessage;
  int duration;

  TestResult({
    required this.testName,
    required this.passed,
    this.errorMessage,
    required this.duration,
  });

  void markPassed() {
    passed = true;
    errorMessage = null;
  }

  void markFailed(String error) {
    passed = false;
    errorMessage = error;
  }

  bool get isSuccess => passed;

  Map<String, dynamic> toJson() {
    return {
      'testName': testName,
      'passed': passed,
      'errorMessage': errorMessage,
      'duration': duration,
    };
  }
}

/// Complex test model with various types
@visible
class ComplexTestModel {
  String name;
  int intValue;
  double doubleValue;
  bool boolValue;
  List<String> stringList;
  Map<String, int> stringIntMap;
  List<int> intList;
  Map<String, dynamic> dynamicMap;

  @hide
  String privateField = 'private';

  ComplexTestModel({
    required this.name,
    required this.intValue,
    required this.doubleValue,
    required this.boolValue,
    required this.stringList,
    required this.stringIntMap,
    required this.intList,
    required this.dynamicMap,
  });

  void updateValues(String newName, int newInt, double newDouble) {
    name = newName;
    intValue = newInt;
    doubleValue = newDouble;
  }

  void addToList(String item) {
    stringList.add(item);
  }

  void removeFromList(String item) {
    stringList.remove(item);
  }

  void setMapValue(String key, int value) {
    stringIntMap[key] = value;
  }

  int? getMapValue(String key) {
    return stringIntMap[key];
  }

  void clearAll() {
    stringList.clear();
    stringIntMap.clear();
    intList.clear();
    dynamicMap.clear();
  }

  int get listLength => stringList.length;
  int get mapSize => stringIntMap.length;

  @hide
  void internalCleanup() {
    // Hidden method
  }
}

/// Performance test model for benchmarking
@visible
class PerformanceTestModel {
  String id;
  int counter;
  double timestamp;
  List<String> data;

  PerformanceTestModel(this.id, this.counter, this.timestamp, this.data);

  void increment() {
    counter++;
  }

  void updateTimestamp() {
    timestamp = DateTime.now().millisecondsSinceEpoch.toDouble();
  }

  void addData(String item) {
    data.add(item);
  }

  String get status => 'ID: $id, Counter: $counter, Data: ${data.length} items';
}

/// Error test model for testing error handling
@visible
class ErrorTestModel {
  String? nullableString;
  int nonNullableInt;
  bool flag;

  ErrorTestModel({
    this.nullableString,
    required this.nonNullableInt,
    required this.flag,
  });

  void setNullableString(String? value) {
    nullableString = value;
  }

  void setNonNullableInt(int value) {
    nonNullableInt = value;
  }

  void toggleFlag() {
    flag = !flag;
  }

  String get description =>
      'String: $nullableString, Int: $nonNullableInt, Flag: $flag';
}
