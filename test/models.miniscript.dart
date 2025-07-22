// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// MiniScriptWrapperGenerator
// **************************************************************************

// Generated MiniScript wrappers
// This file is auto-generated. Do not edit manually.

import "package:miniscript/miniscript_intrinsics/intrinsic.dart";
import "package:miniscript/miniscript_intrinsics/intrinsic_result.dart";
import "package:miniscript/miniscript_tac/context.dart";
import "package:miniscriptgen/miniscriptgen.dart";

import "models.dart";

/// Generated wrapper for TestModel
class TestModelWrapper extends BaseWrapper<TestModel> {
  TestModelWrapper(super.dartObject);

  @override
  List<String> getPropertyNames() {
    return [
      "isValid",
      "name",
      "value",
      "setValue",
      "getName",
    ];
  }

  @override
  Value? getProperty(String propertyName) {
    switch (propertyName) {
      case "isValid":
        return ConversionUtils.dartToValue(dartValue.isValid);
      case "name":
        final value = dartValue.name;
        if (value == null) {
          return ValNull.instance;
        }
        return ConversionUtils.dartToValue(value);
      case "value":
        return ConversionUtils.dartToValue(dartValue.value);
      case "setValue":
        return _createSetValueMethod();
      case "getName":
        return _createGetNameMethod();
      default:
        return null;
    }
  }

  @override
  bool setProperty(String propertyName, Value? value) {
    switch (propertyName) {
      case "name":
        try {
          var dartValue = ConversionUtils.valueToDart(value);
          if (dartValue == null || dartValue == ValNull.instance) {
            this.dartValue.name = null;
            return true;
          }
          this.dartValue.name =
              ConversionUtils.hardConvert<String>(dartValue) as String;
          return true;
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "value":
        try {
          var dartValue = ConversionUtils.valueToDart(value);
          if (dartValue is num) {
            this.dartValue.value = dartValue.toInt();
            return true;
          }
        } catch (e) {
          // Type conversion failed
        }
        return false;
      default:
        return false;
    }
  }

  /// Creates a MiniScript callable method for setValue
  Value _createSetValueMethod() {
    final fn = Intrinsic.create("_\$");
    fn.name = "setValue";
    fn.addParam("newValue");
    Value? f(Context context, [IntrinsicResult? partialResult]) {
      var newValue = ConversionUtils.valueToDart(context.getLocal("newValue"));
      if (newValue == null) {
        return ValString("Missing required argument: newValue");
      }
      if (newValue is num) newValue = newValue.toInt();
      dartValue.setValue(newValue);
      return ValNull.instance;
    }

    fn.code = (Context context, [IntrinsicResult? partialResult]) {
      return IntrinsicResult(f(context, partialResult));
    };
    return fn.valFunction;
  }

  /// Creates a MiniScript callable method for getName
  Value _createGetNameMethod() {
    final fn = Intrinsic.create("_\$");
    fn.name = "getName";
    Value? f(Context context, [IntrinsicResult? partialResult]) {
      var result = dartValue.getName();
      return ConversionUtils.dartToValue(result);
    }

    fn.code = (Context context, [IntrinsicResult? partialResult]) {
      return IntrinsicResult(f(context, partialResult));
    };
    return fn.valFunction;
  }
}

/// Factory function to create TestModelWrapper
TestModelWrapper createTestModelWrapper(TestModel dartObject) {
  return TestModelWrapper(dartObject);
}

/// Register TestModel wrapper with the cache
void registerTestModelWrapper() {
  MiniScriptCache.instance.registerWrapper<TestModel>(
    (testmodel) => TestModelWrapper(testmodel),
  );
}

/// Generated wrapper for TestConfig
class TestConfigWrapper extends BaseWrapper<TestConfig> {
  TestConfigWrapper(super.dartObject);

  @override
  List<String> getPropertyNames() {
    return [
      "environment",
      "debugMode",
      "features",
      "settings",
      "enableFeature",
      "setSetting",
      "getSetting",
    ];
  }

  @override
  Value? getProperty(String propertyName) {
    switch (propertyName) {
      case "environment":
        return ConversionUtils.dartToValue(dartValue.environment);
      case "debugMode":
        return ConversionUtils.dartToValue(dartValue.debugMode);
      case "features":
        return ConversionUtils.dartToValue(dartValue.features);
      case "settings":
        return ConversionUtils.dartToValue(dartValue.settings);
      case "enableFeature":
        return _createEnableFeatureMethod();
      case "setSetting":
        return _createSetSettingMethod();
      case "getSetting":
        return _createGetSettingMethod();
      default:
        return null;
    }
  }

  @override
  bool setProperty(String propertyName, Value? value) {
    switch (propertyName) {
      case "environment":
        try {
          var dartValue = ConversionUtils.valueToDart(value);
          this.dartValue.environment =
              ConversionUtils.hardConvert<String>(dartValue) as String;
          return true;
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "debugMode":
        try {
          var dartValue = ConversionUtils.valueToDart(value);
          this.dartValue.debugMode =
              ConversionUtils.hardConvert<bool>(dartValue) as bool;
          return true;
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "features":
        try {
          var dartValue = ConversionUtils.valueToDart(value);
          this.dartValue.features = (dartValue).cast<String>();
          return true;
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "settings":
        try {
          var dartValue = ConversionUtils.valueToDart(value);
          this.dartValue.settings = (dartValue).cast<String, dynamic>();
          return true;
        } catch (e) {
          // Type conversion failed
        }
        return false;
      default:
        return false;
    }
  }

  /// Creates a MiniScript callable method for enableFeature
  Value _createEnableFeatureMethod() {
    final fn = Intrinsic.create("_\$");
    fn.name = "enableFeature";
    fn.addParam("feature");
    Value? f(Context context, [IntrinsicResult? partialResult]) {
      var feature = ConversionUtils.valueToDart(context.getLocal("feature"));
      if (feature == null) {
        return ValString("Missing required argument: feature");
      }
      dartValue.enableFeature(feature);
      return ValNull.instance;
    }

    fn.code = (Context context, [IntrinsicResult? partialResult]) {
      return IntrinsicResult(f(context, partialResult));
    };
    return fn.valFunction;
  }

  /// Creates a MiniScript callable method for setSetting
  Value _createSetSettingMethod() {
    final fn = Intrinsic.create("_\$");
    fn.name = "setSetting";
    fn.addParam("key");
    fn.addParam("value");
    Value? f(Context context, [IntrinsicResult? partialResult]) {
      var key = ConversionUtils.valueToDart(context.getLocal("key"));
      if (key == null) {
        return ValString("Missing required argument: key");
      }
      var value = ConversionUtils.valueToDart(context.getLocal("value"));
      if (value == null) {
        return ValString("Missing required argument: value");
      }
      dartValue.setSetting(key, value);
      return ValNull.instance;
    }

    fn.code = (Context context, [IntrinsicResult? partialResult]) {
      return IntrinsicResult(f(context, partialResult));
    };
    return fn.valFunction;
  }

  /// Creates a MiniScript callable method for getSetting
  Value _createGetSettingMethod() {
    final fn = Intrinsic.create("_\$");
    fn.name = "getSetting";
    fn.addParam("key");
    Value? f(Context context, [IntrinsicResult? partialResult]) {
      var key = ConversionUtils.valueToDart(context.getLocal("key"));
      if (key == null) {
        return ValString("Missing required argument: key");
      }
      dartValue.getSetting(key);
      return ValNull.instance;
    }

    fn.code = (Context context, [IntrinsicResult? partialResult]) {
      return IntrinsicResult(f(context, partialResult));
    };
    return fn.valFunction;
  }
}

/// Factory function to create TestConfigWrapper
TestConfigWrapper createTestConfigWrapper(TestConfig dartObject) {
  return TestConfigWrapper(dartObject);
}

/// Register TestConfig wrapper with the cache
void registerTestConfigWrapper() {
  MiniScriptCache.instance.registerWrapper<TestConfig>(
    (testconfig) => TestConfigWrapper(testconfig),
  );
}

/// Generated wrapper for TestResult
class TestResultWrapper extends BaseWrapper<TestResult> {
  TestResultWrapper(super.dartObject);

  @override
  List<String> getPropertyNames() {
    return [
      "isSuccess",
      "testName",
      "passed",
      "errorMessage",
      "duration",
      "markPassed",
      "markFailed",
      "toJson",
    ];
  }

  @override
  Value? getProperty(String propertyName) {
    switch (propertyName) {
      case "isSuccess":
        return ConversionUtils.dartToValue(dartValue.isSuccess);
      case "testName":
        return ConversionUtils.dartToValue(dartValue.testName);
      case "passed":
        return ConversionUtils.dartToValue(dartValue.passed);
      case "errorMessage":
        final value = dartValue.errorMessage;
        if (value == null) {
          return ValNull.instance;
        }
        return ConversionUtils.dartToValue(value);
      case "duration":
        return ConversionUtils.dartToValue(dartValue.duration);
      case "markPassed":
        return _createMarkPassedMethod();
      case "markFailed":
        return _createMarkFailedMethod();
      case "toJson":
        return _createToJsonMethod();
      default:
        return null;
    }
  }

  @override
  bool setProperty(String propertyName, Value? value) {
    switch (propertyName) {
      case "testName":
        try {
          var dartValue = ConversionUtils.valueToDart(value);
          this.dartValue.testName =
              ConversionUtils.hardConvert<String>(dartValue) as String;
          return true;
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "passed":
        try {
          var dartValue = ConversionUtils.valueToDart(value);
          this.dartValue.passed =
              ConversionUtils.hardConvert<bool>(dartValue) as bool;
          return true;
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "errorMessage":
        try {
          var dartValue = ConversionUtils.valueToDart(value);
          if (dartValue == null || dartValue == ValNull.instance) {
            this.dartValue.errorMessage = null;
            return true;
          }
          this.dartValue.errorMessage =
              ConversionUtils.hardConvert<String>(dartValue) as String;
          return true;
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "duration":
        try {
          var dartValue = ConversionUtils.valueToDart(value);
          if (dartValue is num) {
            this.dartValue.duration = dartValue.toInt();
            return true;
          }
        } catch (e) {
          // Type conversion failed
        }
        return false;
      default:
        return false;
    }
  }

  /// Creates a MiniScript callable method for markPassed
  Value _createMarkPassedMethod() {
    final fn = Intrinsic.create("_\$");
    fn.name = "markPassed";
    Value? f(Context context, [IntrinsicResult? partialResult]) {
      dartValue.markPassed();
      return ValNull.instance;
    }

    fn.code = (Context context, [IntrinsicResult? partialResult]) {
      return IntrinsicResult(f(context, partialResult));
    };
    return fn.valFunction;
  }

  /// Creates a MiniScript callable method for markFailed
  Value _createMarkFailedMethod() {
    final fn = Intrinsic.create("_\$");
    fn.name = "markFailed";
    fn.addParam("error");
    Value? f(Context context, [IntrinsicResult? partialResult]) {
      var error = ConversionUtils.valueToDart(context.getLocal("error"));
      if (error == null) {
        return ValString("Missing required argument: error");
      }
      dartValue.markFailed(error);
      return ValNull.instance;
    }

    fn.code = (Context context, [IntrinsicResult? partialResult]) {
      return IntrinsicResult(f(context, partialResult));
    };
    return fn.valFunction;
  }

  /// Creates a MiniScript callable method for toJson
  Value _createToJsonMethod() {
    final fn = Intrinsic.create("_\$");
    fn.name = "toJson";
    Value? f(Context context, [IntrinsicResult? partialResult]) {
      var result = dartValue.toJson();
      return ConversionUtils.dartToValue(result);
    }

    fn.code = (Context context, [IntrinsicResult? partialResult]) {
      return IntrinsicResult(f(context, partialResult));
    };
    return fn.valFunction;
  }
}

/// Factory function to create TestResultWrapper
TestResultWrapper createTestResultWrapper(TestResult dartObject) {
  return TestResultWrapper(dartObject);
}

/// Register TestResult wrapper with the cache
void registerTestResultWrapper() {
  MiniScriptCache.instance.registerWrapper<TestResult>(
    (testresult) => TestResultWrapper(testresult),
  );
}

/// Generated wrapper for ComplexTestModel
class ComplexTestModelWrapper extends BaseWrapper<ComplexTestModel> {
  ComplexTestModelWrapper(super.dartObject);

  @override
  List<String> getPropertyNames() {
    return [
      "listLength",
      "mapSize",
      "name",
      "intValue",
      "doubleValue",
      "boolValue",
      "stringList",
      "stringIntMap",
      "intList",
      "dynamicMap",
      "updateValues",
      "addToList",
      "removeFromList",
      "setMapValue",
      "getMapValue",
      "clearAll",
    ];
  }

  @override
  Value? getProperty(String propertyName) {
    switch (propertyName) {
      case "listLength":
        return ConversionUtils.dartToValue(dartValue.listLength);
      case "mapSize":
        return ConversionUtils.dartToValue(dartValue.mapSize);
      case "name":
        return ConversionUtils.dartToValue(dartValue.name);
      case "intValue":
        return ConversionUtils.dartToValue(dartValue.intValue);
      case "doubleValue":
        return ConversionUtils.dartToValue(dartValue.doubleValue);
      case "boolValue":
        return ConversionUtils.dartToValue(dartValue.boolValue);
      case "stringList":
        return ConversionUtils.dartToValue(dartValue.stringList);
      case "stringIntMap":
        return ConversionUtils.dartToValue(dartValue.stringIntMap);
      case "intList":
        return ConversionUtils.dartToValue(dartValue.intList);
      case "dynamicMap":
        return ConversionUtils.dartToValue(dartValue.dynamicMap);
      case "updateValues":
        return _createUpdateValuesMethod();
      case "addToList":
        return _createAddToListMethod();
      case "removeFromList":
        return _createRemoveFromListMethod();
      case "setMapValue":
        return _createSetMapValueMethod();
      case "getMapValue":
        return _createGetMapValueMethod();
      case "clearAll":
        return _createClearAllMethod();
      default:
        return null;
    }
  }

  @override
  bool setProperty(String propertyName, Value? value) {
    switch (propertyName) {
      case "name":
        try {
          var dartValue = ConversionUtils.valueToDart(value);
          this.dartValue.name =
              ConversionUtils.hardConvert<String>(dartValue) as String;
          return true;
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "intValue":
        try {
          var dartValue = ConversionUtils.valueToDart(value);
          if (dartValue is num) {
            this.dartValue.intValue = dartValue.toInt();
            return true;
          }
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "doubleValue":
        try {
          var dartValue = ConversionUtils.valueToDart(value);
          if (dartValue is num) {
            this.dartValue.doubleValue = dartValue.toDouble();
            return true;
          }
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "boolValue":
        try {
          var dartValue = ConversionUtils.valueToDart(value);
          this.dartValue.boolValue =
              ConversionUtils.hardConvert<bool>(dartValue) as bool;
          return true;
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "stringList":
        try {
          var dartValue = ConversionUtils.valueToDart(value);
          this.dartValue.stringList = (dartValue).cast<String>();
          return true;
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "stringIntMap":
        try {
          var dartValue = ConversionUtils.valueToDart(value);
          this.dartValue.stringIntMap = (dartValue).cast<String, int>();
          return true;
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "intList":
        try {
          var dartValue = ConversionUtils.valueToDart(value);
          this.dartValue.intList = (dartValue).cast<int>();
          return true;
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "dynamicMap":
        try {
          var dartValue = ConversionUtils.valueToDart(value);
          this.dartValue.dynamicMap = (dartValue).cast<String, dynamic>();
          return true;
        } catch (e) {
          // Type conversion failed
        }
        return false;
      default:
        return false;
    }
  }

  /// Creates a MiniScript callable method for updateValues
  Value _createUpdateValuesMethod() {
    final fn = Intrinsic.create("_\$");
    fn.name = "updateValues";
    fn.addParam("newName");
    fn.addParam("newInt");
    fn.addParam("newDouble");
    Value? f(Context context, [IntrinsicResult? partialResult]) {
      var newName = ConversionUtils.valueToDart(context.getLocal("newName"));
      if (newName == null) {
        return ValString("Missing required argument: newName");
      }
      var newInt = ConversionUtils.valueToDart(context.getLocal("newInt"));
      if (newInt == null) {
        return ValString("Missing required argument: newInt");
      }
      if (newInt is num) newInt = newInt.toInt();
      var newDouble =
          ConversionUtils.valueToDart(context.getLocal("newDouble"));
      if (newDouble == null) {
        return ValString("Missing required argument: newDouble");
      }
      if (newDouble is num) newDouble = newDouble.toDouble();
      dartValue.updateValues(newName, newInt, newDouble);
      return ValNull.instance;
    }

    fn.code = (Context context, [IntrinsicResult? partialResult]) {
      return IntrinsicResult(f(context, partialResult));
    };
    return fn.valFunction;
  }

  /// Creates a MiniScript callable method for addToList
  Value _createAddToListMethod() {
    final fn = Intrinsic.create("_\$");
    fn.name = "addToList";
    fn.addParam("item");
    Value? f(Context context, [IntrinsicResult? partialResult]) {
      var item = ConversionUtils.valueToDart(context.getLocal("item"));
      if (item == null) {
        return ValString("Missing required argument: item");
      }
      dartValue.addToList(item);
      return ValNull.instance;
    }

    fn.code = (Context context, [IntrinsicResult? partialResult]) {
      return IntrinsicResult(f(context, partialResult));
    };
    return fn.valFunction;
  }

  /// Creates a MiniScript callable method for removeFromList
  Value _createRemoveFromListMethod() {
    final fn = Intrinsic.create("_\$");
    fn.name = "removeFromList";
    fn.addParam("item");
    Value? f(Context context, [IntrinsicResult? partialResult]) {
      var item = ConversionUtils.valueToDart(context.getLocal("item"));
      if (item == null) {
        return ValString("Missing required argument: item");
      }
      dartValue.removeFromList(item);
      return ValNull.instance;
    }

    fn.code = (Context context, [IntrinsicResult? partialResult]) {
      return IntrinsicResult(f(context, partialResult));
    };
    return fn.valFunction;
  }

  /// Creates a MiniScript callable method for setMapValue
  Value _createSetMapValueMethod() {
    final fn = Intrinsic.create("_\$");
    fn.name = "setMapValue";
    fn.addParam("key");
    fn.addParam("value");
    Value? f(Context context, [IntrinsicResult? partialResult]) {
      var key = ConversionUtils.valueToDart(context.getLocal("key"));
      if (key == null) {
        return ValString("Missing required argument: key");
      }
      var value = ConversionUtils.valueToDart(context.getLocal("value"));
      if (value == null) {
        return ValString("Missing required argument: value");
      }
      if (value is num) value = value.toInt();
      dartValue.setMapValue(key, value);
      return ValNull.instance;
    }

    fn.code = (Context context, [IntrinsicResult? partialResult]) {
      return IntrinsicResult(f(context, partialResult));
    };
    return fn.valFunction;
  }

  /// Creates a MiniScript callable method for getMapValue
  Value _createGetMapValueMethod() {
    final fn = Intrinsic.create("_\$");
    fn.name = "getMapValue";
    fn.addParam("key");
    Value? f(Context context, [IntrinsicResult? partialResult]) {
      var key = ConversionUtils.valueToDart(context.getLocal("key"));
      if (key == null) {
        return ValString("Missing required argument: key");
      }
      var result = dartValue.getMapValue(key);
      return ConversionUtils.dartToValue(result);
    }

    fn.code = (Context context, [IntrinsicResult? partialResult]) {
      return IntrinsicResult(f(context, partialResult));
    };
    return fn.valFunction;
  }

  /// Creates a MiniScript callable method for clearAll
  Value _createClearAllMethod() {
    final fn = Intrinsic.create("_\$");
    fn.name = "clearAll";
    Value? f(Context context, [IntrinsicResult? partialResult]) {
      dartValue.clearAll();
      return ValNull.instance;
    }

    fn.code = (Context context, [IntrinsicResult? partialResult]) {
      return IntrinsicResult(f(context, partialResult));
    };
    return fn.valFunction;
  }
}

/// Factory function to create ComplexTestModelWrapper
ComplexTestModelWrapper createComplexTestModelWrapper(
    ComplexTestModel dartObject) {
  return ComplexTestModelWrapper(dartObject);
}

/// Register ComplexTestModel wrapper with the cache
void registerComplexTestModelWrapper() {
  MiniScriptCache.instance.registerWrapper<ComplexTestModel>(
    (complextestmodel) => ComplexTestModelWrapper(complextestmodel),
  );
}

/// Generated wrapper for PerformanceTestModel
class PerformanceTestModelWrapper extends BaseWrapper<PerformanceTestModel> {
  PerformanceTestModelWrapper(super.dartObject);

  @override
  List<String> getPropertyNames() {
    return [
      "status",
      "id",
      "counter",
      "timestamp",
      "data",
      "increment",
      "updateTimestamp",
      "addData",
    ];
  }

  @override
  Value? getProperty(String propertyName) {
    switch (propertyName) {
      case "status":
        return ConversionUtils.dartToValue(dartValue.status);
      case "id":
        return ConversionUtils.dartToValue(dartValue.id);
      case "counter":
        return ConversionUtils.dartToValue(dartValue.counter);
      case "timestamp":
        return ConversionUtils.dartToValue(dartValue.timestamp);
      case "data":
        return ConversionUtils.dartToValue(dartValue.data);
      case "increment":
        return _createIncrementMethod();
      case "updateTimestamp":
        return _createUpdateTimestampMethod();
      case "addData":
        return _createAddDataMethod();
      default:
        return null;
    }
  }

  @override
  bool setProperty(String propertyName, Value? value) {
    switch (propertyName) {
      case "id":
        try {
          var dartValue = ConversionUtils.valueToDart(value);
          this.dartValue.id =
              ConversionUtils.hardConvert<String>(dartValue) as String;
          return true;
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "counter":
        try {
          var dartValue = ConversionUtils.valueToDart(value);
          if (dartValue is num) {
            this.dartValue.counter = dartValue.toInt();
            return true;
          }
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "timestamp":
        try {
          var dartValue = ConversionUtils.valueToDart(value);
          if (dartValue is num) {
            this.dartValue.timestamp = dartValue.toDouble();
            return true;
          }
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "data":
        try {
          var dartValue = ConversionUtils.valueToDart(value);
          this.dartValue.data = (dartValue).cast<String>();
          return true;
        } catch (e) {
          // Type conversion failed
        }
        return false;
      default:
        return false;
    }
  }

  /// Creates a MiniScript callable method for increment
  Value _createIncrementMethod() {
    final fn = Intrinsic.create("_\$");
    fn.name = "increment";
    Value? f(Context context, [IntrinsicResult? partialResult]) {
      dartValue.increment();
      return ValNull.instance;
    }

    fn.code = (Context context, [IntrinsicResult? partialResult]) {
      return IntrinsicResult(f(context, partialResult));
    };
    return fn.valFunction;
  }

  /// Creates a MiniScript callable method for updateTimestamp
  Value _createUpdateTimestampMethod() {
    final fn = Intrinsic.create("_\$");
    fn.name = "updateTimestamp";
    Value? f(Context context, [IntrinsicResult? partialResult]) {
      dartValue.updateTimestamp();
      return ValNull.instance;
    }

    fn.code = (Context context, [IntrinsicResult? partialResult]) {
      return IntrinsicResult(f(context, partialResult));
    };
    return fn.valFunction;
  }

  /// Creates a MiniScript callable method for addData
  Value _createAddDataMethod() {
    final fn = Intrinsic.create("_\$");
    fn.name = "addData";
    fn.addParam("item");
    Value? f(Context context, [IntrinsicResult? partialResult]) {
      var item = ConversionUtils.valueToDart(context.getLocal("item"));
      if (item == null) {
        return ValString("Missing required argument: item");
      }
      dartValue.addData(item);
      return ValNull.instance;
    }

    fn.code = (Context context, [IntrinsicResult? partialResult]) {
      return IntrinsicResult(f(context, partialResult));
    };
    return fn.valFunction;
  }
}

/// Factory function to create PerformanceTestModelWrapper
PerformanceTestModelWrapper createPerformanceTestModelWrapper(
    PerformanceTestModel dartObject) {
  return PerformanceTestModelWrapper(dartObject);
}

/// Register PerformanceTestModel wrapper with the cache
void registerPerformanceTestModelWrapper() {
  MiniScriptCache.instance.registerWrapper<PerformanceTestModel>(
    (performancetestmodel) => PerformanceTestModelWrapper(performancetestmodel),
  );
}

/// Generated wrapper for ErrorTestModel
class ErrorTestModelWrapper extends BaseWrapper<ErrorTestModel> {
  ErrorTestModelWrapper(super.dartObject);

  @override
  List<String> getPropertyNames() {
    return [
      "description",
      "nullableString",
      "nonNullableInt",
      "flag",
      "setNullableString",
      "setNonNullableInt",
      "toggleFlag",
    ];
  }

  @override
  Value? getProperty(String propertyName) {
    switch (propertyName) {
      case "description":
        return ConversionUtils.dartToValue(dartValue.description);
      case "nullableString":
        final value = dartValue.nullableString;
        if (value == null) {
          return ValNull.instance;
        }
        return ConversionUtils.dartToValue(value);
      case "nonNullableInt":
        return ConversionUtils.dartToValue(dartValue.nonNullableInt);
      case "flag":
        return ConversionUtils.dartToValue(dartValue.flag);
      case "setNullableString":
        return _createSetNullableStringMethod();
      case "setNonNullableInt":
        return _createSetNonNullableIntMethod();
      case "toggleFlag":
        return _createToggleFlagMethod();
      default:
        return null;
    }
  }

  @override
  bool setProperty(String propertyName, Value? value) {
    switch (propertyName) {
      case "nullableString":
        try {
          var dartValue = ConversionUtils.valueToDart(value);
          if (dartValue == null || dartValue == ValNull.instance) {
            this.dartValue.nullableString = null;
            return true;
          }
          this.dartValue.nullableString =
              ConversionUtils.hardConvert<String>(dartValue) as String;
          return true;
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "nonNullableInt":
        try {
          var dartValue = ConversionUtils.valueToDart(value);
          if (dartValue is num) {
            this.dartValue.nonNullableInt = dartValue.toInt();
            return true;
          }
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "flag":
        try {
          var dartValue = ConversionUtils.valueToDart(value);
          this.dartValue.flag =
              ConversionUtils.hardConvert<bool>(dartValue) as bool;
          return true;
        } catch (e) {
          // Type conversion failed
        }
        return false;
      default:
        return false;
    }
  }

  /// Creates a MiniScript callable method for setNullableString
  Value _createSetNullableStringMethod() {
    final fn = Intrinsic.create("_\$");
    fn.name = "setNullableString";
    fn.addParam("value", ValNull.instance);
    Value? f(Context context, [IntrinsicResult? partialResult]) {
      var value = ConversionUtils.valueToDart(context.getLocal("value"));
      dartValue.setNullableString(value);
      return ValNull.instance;
    }

    fn.code = (Context context, [IntrinsicResult? partialResult]) {
      return IntrinsicResult(f(context, partialResult));
    };
    return fn.valFunction;
  }

  /// Creates a MiniScript callable method for setNonNullableInt
  Value _createSetNonNullableIntMethod() {
    final fn = Intrinsic.create("_\$");
    fn.name = "setNonNullableInt";
    fn.addParam("value");
    Value? f(Context context, [IntrinsicResult? partialResult]) {
      var value = ConversionUtils.valueToDart(context.getLocal("value"));
      if (value == null) {
        return ValString("Missing required argument: value");
      }
      if (value is num) value = value.toInt();
      dartValue.setNonNullableInt(value);
      return ValNull.instance;
    }

    fn.code = (Context context, [IntrinsicResult? partialResult]) {
      return IntrinsicResult(f(context, partialResult));
    };
    return fn.valFunction;
  }

  /// Creates a MiniScript callable method for toggleFlag
  Value _createToggleFlagMethod() {
    final fn = Intrinsic.create("_\$");
    fn.name = "toggleFlag";
    Value? f(Context context, [IntrinsicResult? partialResult]) {
      dartValue.toggleFlag();
      return ValNull.instance;
    }

    fn.code = (Context context, [IntrinsicResult? partialResult]) {
      return IntrinsicResult(f(context, partialResult));
    };
    return fn.valFunction;
  }
}

/// Factory function to create ErrorTestModelWrapper
ErrorTestModelWrapper createErrorTestModelWrapper(ErrorTestModel dartObject) {
  return ErrorTestModelWrapper(dartObject);
}

/// Register ErrorTestModel wrapper with the cache
void registerErrorTestModelWrapper() {
  MiniScriptCache.instance.registerWrapper<ErrorTestModel>(
    (errortestmodel) => ErrorTestModelWrapper(errortestmodel),
  );
}
