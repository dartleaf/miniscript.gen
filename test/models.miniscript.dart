// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// MiniScriptWrapperGenerator
// **************************************************************************

// Generated MiniScript wrappers
// This file is auto-generated. Do not edit manually.

import "package:miniscript/miniscript_types/value.dart";
import "package:miniscript/miniscript_types/value_map.dart";
import "package:miniscript/miniscript_types/value_string.dart";
import "package:miniscript/miniscript_types/value_null.dart";

import "package:miniscriptgen/src/base_wrapper.dart";
import "package:miniscriptgen/src/cache.dart";

import "models.dart";

/// Generated wrapper for TestModel
class TestModelWrapper extends BaseWrapper<TestModel> {
  TestModelWrapper(TestModel dartObject) : super(dartObject);

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
        return dartToMiniScript(dartValue.isValid);
      case "name":
        return dartToMiniScript(dartValue.name);
      case "value":
        return dartToMiniScript(dartValue.value);
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
          var dartValue = miniScriptToDart(value);
          if (dartValue is String || dartValue == null) {
            this.dartValue.name = dartValue;
            return true;
          }
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "value":
        try {
          var dartValue = miniScriptToDart(value);
          if (dartValue is num || dartValue == null) {
            this.dartValue.value = dartValue?.toInt();
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
    var methodMap = ValMap();
    methodMap.userData = this;
    methodMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "call") {
        valuePointer.value = _setValueCallMethod();
        return true;
      }
      return false;
    };
    return methodMap;
  }

  /// Callable method implementation for setValue
  Value _setValueCallMethod() {
    var callableMap = ValMap();
    callableMap.userData = this;
    callableMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "invoke") {
        // TODO: Handle method parameters
        valuePointer.value = ValString("Method setValue called");
        return true;
      }
      return false;
    };
    return callableMap;
  }

  /// Creates a MiniScript callable method for getName
  Value _createGetNameMethod() {
    var methodMap = ValMap();
    methodMap.userData = this;
    methodMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "call") {
        valuePointer.value = _getNameCallMethod();
        return true;
      }
      return false;
    };
    return methodMap;
  }

  /// Callable method implementation for getName
  Value _getNameCallMethod() {
    var callableMap = ValMap();
    callableMap.userData = this;
    callableMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "invoke") {
        var result = dartValue.getName();
        valuePointer.value = dartToMiniScript(result);
        return true;
      }
      return false;
    };
    return callableMap;
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
  TestConfigWrapper(TestConfig dartObject) : super(dartObject);

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
        return dartToMiniScript(dartValue.environment);
      case "debugMode":
        return dartToMiniScript(dartValue.debugMode);
      case "features":
        return dartToMiniScript(dartValue.features);
      case "settings":
        return dartToMiniScript(dartValue.settings);
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
          var dartValue = miniScriptToDart(value);
          if (dartValue is String || dartValue == null) {
            this.dartValue.environment = dartValue;
            return true;
          }
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "debugMode":
        try {
          var dartValue = miniScriptToDart(value);
          if (dartValue is bool || dartValue == null) {
            this.dartValue.debugMode = dartValue;
            return true;
          }
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "features":
        try {
          var dartValue = miniScriptToDart(value);
          if (dartValue is List<String> || dartValue == null) {
            this.dartValue.features = dartValue;
            return true;
          }
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "settings":
        try {
          var dartValue = miniScriptToDart(value);
          if (dartValue is Map<String, dynamic> || dartValue == null) {
            this.dartValue.settings = dartValue;
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

  /// Creates a MiniScript callable method for enableFeature
  Value _createEnableFeatureMethod() {
    var methodMap = ValMap();
    methodMap.userData = this;
    methodMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "call") {
        valuePointer.value = _enableFeatureCallMethod();
        return true;
      }
      return false;
    };
    return methodMap;
  }

  /// Callable method implementation for enableFeature
  Value _enableFeatureCallMethod() {
    var callableMap = ValMap();
    callableMap.userData = this;
    callableMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "invoke") {
        // TODO: Handle method parameters
        valuePointer.value = ValString("Method enableFeature called");
        return true;
      }
      return false;
    };
    return callableMap;
  }

  /// Creates a MiniScript callable method for setSetting
  Value _createSetSettingMethod() {
    var methodMap = ValMap();
    methodMap.userData = this;
    methodMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "call") {
        valuePointer.value = _setSettingCallMethod();
        return true;
      }
      return false;
    };
    return methodMap;
  }

  /// Callable method implementation for setSetting
  Value _setSettingCallMethod() {
    var callableMap = ValMap();
    callableMap.userData = this;
    callableMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "invoke") {
        // TODO: Handle method parameters
        valuePointer.value = ValString("Method setSetting called");
        return true;
      }
      return false;
    };
    return callableMap;
  }

  /// Creates a MiniScript callable method for getSetting
  Value _createGetSettingMethod() {
    var methodMap = ValMap();
    methodMap.userData = this;
    methodMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "call") {
        valuePointer.value = _getSettingCallMethod();
        return true;
      }
      return false;
    };
    return methodMap;
  }

  /// Callable method implementation for getSetting
  Value _getSettingCallMethod() {
    var callableMap = ValMap();
    callableMap.userData = this;
    callableMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "invoke") {
        // TODO: Handle method parameters
        valuePointer.value = ValString("Method getSetting called");
        return true;
      }
      return false;
    };
    return callableMap;
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
  TestResultWrapper(TestResult dartObject) : super(dartObject);

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
        return dartToMiniScript(dartValue.isSuccess);
      case "testName":
        return dartToMiniScript(dartValue.testName);
      case "passed":
        return dartToMiniScript(dartValue.passed);
      case "errorMessage":
        return dartToMiniScript(dartValue.errorMessage);
      case "duration":
        return dartToMiniScript(dartValue.duration);
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
          var dartValue = miniScriptToDart(value);
          if (dartValue is String || dartValue == null) {
            this.dartValue.testName = dartValue;
            return true;
          }
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "passed":
        try {
          var dartValue = miniScriptToDart(value);
          if (dartValue is bool || dartValue == null) {
            this.dartValue.passed = dartValue;
            return true;
          }
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "errorMessage":
        try {
          var dartValue = miniScriptToDart(value);
          if (dartValue is String || dartValue == null) {
            this.dartValue.errorMessage = dartValue;
            return true;
          }
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "duration":
        try {
          var dartValue = miniScriptToDart(value);
          if (dartValue is num || dartValue == null) {
            this.dartValue.duration = dartValue?.toInt();
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
    var methodMap = ValMap();
    methodMap.userData = this;
    methodMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "call") {
        valuePointer.value = _markPassedCallMethod();
        return true;
      }
      return false;
    };
    return methodMap;
  }

  /// Callable method implementation for markPassed
  Value _markPassedCallMethod() {
    var callableMap = ValMap();
    callableMap.userData = this;
    callableMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "invoke") {
        dartValue.markPassed();
        valuePointer.value = ValNull.instance;
        return true;
      }
      return false;
    };
    return callableMap;
  }

  /// Creates a MiniScript callable method for markFailed
  Value _createMarkFailedMethod() {
    var methodMap = ValMap();
    methodMap.userData = this;
    methodMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "call") {
        valuePointer.value = _markFailedCallMethod();
        return true;
      }
      return false;
    };
    return methodMap;
  }

  /// Callable method implementation for markFailed
  Value _markFailedCallMethod() {
    var callableMap = ValMap();
    callableMap.userData = this;
    callableMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "invoke") {
        // TODO: Handle method parameters
        valuePointer.value = ValString("Method markFailed called");
        return true;
      }
      return false;
    };
    return callableMap;
  }

  /// Creates a MiniScript callable method for toJson
  Value _createToJsonMethod() {
    var methodMap = ValMap();
    methodMap.userData = this;
    methodMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "call") {
        valuePointer.value = _toJsonCallMethod();
        return true;
      }
      return false;
    };
    return methodMap;
  }

  /// Callable method implementation for toJson
  Value _toJsonCallMethod() {
    var callableMap = ValMap();
    callableMap.userData = this;
    callableMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "invoke") {
        var result = dartValue.toJson();
        valuePointer.value = dartToMiniScript(result);
        return true;
      }
      return false;
    };
    return callableMap;
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
  ComplexTestModelWrapper(ComplexTestModel dartObject) : super(dartObject);

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
        return dartToMiniScript(dartValue.listLength);
      case "mapSize":
        return dartToMiniScript(dartValue.mapSize);
      case "name":
        return dartToMiniScript(dartValue.name);
      case "intValue":
        return dartToMiniScript(dartValue.intValue);
      case "doubleValue":
        return dartToMiniScript(dartValue.doubleValue);
      case "boolValue":
        return dartToMiniScript(dartValue.boolValue);
      case "stringList":
        return dartToMiniScript(dartValue.stringList);
      case "stringIntMap":
        return dartToMiniScript(dartValue.stringIntMap);
      case "intList":
        return dartToMiniScript(dartValue.intList);
      case "dynamicMap":
        return dartToMiniScript(dartValue.dynamicMap);
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
          var dartValue = miniScriptToDart(value);
          if (dartValue is String || dartValue == null) {
            this.dartValue.name = dartValue;
            return true;
          }
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "intValue":
        try {
          var dartValue = miniScriptToDart(value);
          if (dartValue is num || dartValue == null) {
            this.dartValue.intValue = dartValue?.toInt();
            return true;
          }
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "doubleValue":
        try {
          var dartValue = miniScriptToDart(value);
          if (dartValue is num || dartValue == null) {
            this.dartValue.doubleValue = dartValue?.toDouble();
            return true;
          }
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "boolValue":
        try {
          var dartValue = miniScriptToDart(value);
          if (dartValue is bool || dartValue == null) {
            this.dartValue.boolValue = dartValue;
            return true;
          }
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "stringList":
        try {
          var dartValue = miniScriptToDart(value);
          if (dartValue is List<String> || dartValue == null) {
            this.dartValue.stringList = dartValue;
            return true;
          }
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "stringIntMap":
        try {
          var dartValue = miniScriptToDart(value);
          if (dartValue is Map<String, int> || dartValue == null) {
            this.dartValue.stringIntMap = dartValue;
            return true;
          }
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "intList":
        try {
          var dartValue = miniScriptToDart(value);
          if (dartValue is List<int> || dartValue == null) {
            this.dartValue.intList = dartValue;
            return true;
          }
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "dynamicMap":
        try {
          var dartValue = miniScriptToDart(value);
          if (dartValue is Map<String, dynamic> || dartValue == null) {
            this.dartValue.dynamicMap = dartValue;
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

  /// Creates a MiniScript callable method for updateValues
  Value _createUpdateValuesMethod() {
    var methodMap = ValMap();
    methodMap.userData = this;
    methodMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "call") {
        valuePointer.value = _updateValuesCallMethod();
        return true;
      }
      return false;
    };
    return methodMap;
  }

  /// Callable method implementation for updateValues
  Value _updateValuesCallMethod() {
    var callableMap = ValMap();
    callableMap.userData = this;
    callableMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "invoke") {
        // TODO: Handle method parameters
        valuePointer.value = ValString("Method updateValues called");
        return true;
      }
      return false;
    };
    return callableMap;
  }

  /// Creates a MiniScript callable method for addToList
  Value _createAddToListMethod() {
    var methodMap = ValMap();
    methodMap.userData = this;
    methodMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "call") {
        valuePointer.value = _addToListCallMethod();
        return true;
      }
      return false;
    };
    return methodMap;
  }

  /// Callable method implementation for addToList
  Value _addToListCallMethod() {
    var callableMap = ValMap();
    callableMap.userData = this;
    callableMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "invoke") {
        // TODO: Handle method parameters
        valuePointer.value = ValString("Method addToList called");
        return true;
      }
      return false;
    };
    return callableMap;
  }

  /// Creates a MiniScript callable method for removeFromList
  Value _createRemoveFromListMethod() {
    var methodMap = ValMap();
    methodMap.userData = this;
    methodMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "call") {
        valuePointer.value = _removeFromListCallMethod();
        return true;
      }
      return false;
    };
    return methodMap;
  }

  /// Callable method implementation for removeFromList
  Value _removeFromListCallMethod() {
    var callableMap = ValMap();
    callableMap.userData = this;
    callableMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "invoke") {
        // TODO: Handle method parameters
        valuePointer.value = ValString("Method removeFromList called");
        return true;
      }
      return false;
    };
    return callableMap;
  }

  /// Creates a MiniScript callable method for setMapValue
  Value _createSetMapValueMethod() {
    var methodMap = ValMap();
    methodMap.userData = this;
    methodMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "call") {
        valuePointer.value = _setMapValueCallMethod();
        return true;
      }
      return false;
    };
    return methodMap;
  }

  /// Callable method implementation for setMapValue
  Value _setMapValueCallMethod() {
    var callableMap = ValMap();
    callableMap.userData = this;
    callableMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "invoke") {
        // TODO: Handle method parameters
        valuePointer.value = ValString("Method setMapValue called");
        return true;
      }
      return false;
    };
    return callableMap;
  }

  /// Creates a MiniScript callable method for getMapValue
  Value _createGetMapValueMethod() {
    var methodMap = ValMap();
    methodMap.userData = this;
    methodMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "call") {
        valuePointer.value = _getMapValueCallMethod();
        return true;
      }
      return false;
    };
    return methodMap;
  }

  /// Callable method implementation for getMapValue
  Value _getMapValueCallMethod() {
    var callableMap = ValMap();
    callableMap.userData = this;
    callableMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "invoke") {
        // TODO: Handle method parameters
        valuePointer.value = ValString("Method getMapValue called");
        return true;
      }
      return false;
    };
    return callableMap;
  }

  /// Creates a MiniScript callable method for clearAll
  Value _createClearAllMethod() {
    var methodMap = ValMap();
    methodMap.userData = this;
    methodMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "call") {
        valuePointer.value = _clearAllCallMethod();
        return true;
      }
      return false;
    };
    return methodMap;
  }

  /// Callable method implementation for clearAll
  Value _clearAllCallMethod() {
    var callableMap = ValMap();
    callableMap.userData = this;
    callableMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "invoke") {
        dartValue.clearAll();
        valuePointer.value = ValNull.instance;
        return true;
      }
      return false;
    };
    return callableMap;
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
  PerformanceTestModelWrapper(PerformanceTestModel dartObject)
      : super(dartObject);

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
        return dartToMiniScript(dartValue.status);
      case "id":
        return dartToMiniScript(dartValue.id);
      case "counter":
        return dartToMiniScript(dartValue.counter);
      case "timestamp":
        return dartToMiniScript(dartValue.timestamp);
      case "data":
        return dartToMiniScript(dartValue.data);
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
          var dartValue = miniScriptToDart(value);
          if (dartValue is String || dartValue == null) {
            this.dartValue.id = dartValue;
            return true;
          }
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "counter":
        try {
          var dartValue = miniScriptToDart(value);
          if (dartValue is num || dartValue == null) {
            this.dartValue.counter = dartValue?.toInt();
            return true;
          }
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "timestamp":
        try {
          var dartValue = miniScriptToDart(value);
          if (dartValue is num || dartValue == null) {
            this.dartValue.timestamp = dartValue?.toDouble();
            return true;
          }
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "data":
        try {
          var dartValue = miniScriptToDart(value);
          if (dartValue is List<String> || dartValue == null) {
            this.dartValue.data = dartValue;
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

  /// Creates a MiniScript callable method for increment
  Value _createIncrementMethod() {
    var methodMap = ValMap();
    methodMap.userData = this;
    methodMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "call") {
        valuePointer.value = _incrementCallMethod();
        return true;
      }
      return false;
    };
    return methodMap;
  }

  /// Callable method implementation for increment
  Value _incrementCallMethod() {
    var callableMap = ValMap();
    callableMap.userData = this;
    callableMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "invoke") {
        dartValue.increment();
        valuePointer.value = ValNull.instance;
        return true;
      }
      return false;
    };
    return callableMap;
  }

  /// Creates a MiniScript callable method for updateTimestamp
  Value _createUpdateTimestampMethod() {
    var methodMap = ValMap();
    methodMap.userData = this;
    methodMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "call") {
        valuePointer.value = _updateTimestampCallMethod();
        return true;
      }
      return false;
    };
    return methodMap;
  }

  /// Callable method implementation for updateTimestamp
  Value _updateTimestampCallMethod() {
    var callableMap = ValMap();
    callableMap.userData = this;
    callableMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "invoke") {
        dartValue.updateTimestamp();
        valuePointer.value = ValNull.instance;
        return true;
      }
      return false;
    };
    return callableMap;
  }

  /// Creates a MiniScript callable method for addData
  Value _createAddDataMethod() {
    var methodMap = ValMap();
    methodMap.userData = this;
    methodMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "call") {
        valuePointer.value = _addDataCallMethod();
        return true;
      }
      return false;
    };
    return methodMap;
  }

  /// Callable method implementation for addData
  Value _addDataCallMethod() {
    var callableMap = ValMap();
    callableMap.userData = this;
    callableMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "invoke") {
        // TODO: Handle method parameters
        valuePointer.value = ValString("Method addData called");
        return true;
      }
      return false;
    };
    return callableMap;
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
  ErrorTestModelWrapper(ErrorTestModel dartObject) : super(dartObject);

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
        return dartToMiniScript(dartValue.description);
      case "nullableString":
        return dartToMiniScript(dartValue.nullableString);
      case "nonNullableInt":
        return dartToMiniScript(dartValue.nonNullableInt);
      case "flag":
        return dartToMiniScript(dartValue.flag);
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
          var dartValue = miniScriptToDart(value);
          if (dartValue is String || dartValue == null) {
            this.dartValue.nullableString = dartValue;
            return true;
          }
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "nonNullableInt":
        try {
          var dartValue = miniScriptToDart(value);
          if (dartValue is num || dartValue == null) {
            this.dartValue.nonNullableInt = dartValue?.toInt();
            return true;
          }
        } catch (e) {
          // Type conversion failed
        }
        return false;
      case "flag":
        try {
          var dartValue = miniScriptToDart(value);
          if (dartValue is bool || dartValue == null) {
            this.dartValue.flag = dartValue;
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

  /// Creates a MiniScript callable method for setNullableString
  Value _createSetNullableStringMethod() {
    var methodMap = ValMap();
    methodMap.userData = this;
    methodMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "call") {
        valuePointer.value = _setNullableStringCallMethod();
        return true;
      }
      return false;
    };
    return methodMap;
  }

  /// Callable method implementation for setNullableString
  Value _setNullableStringCallMethod() {
    var callableMap = ValMap();
    callableMap.userData = this;
    callableMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "invoke") {
        // TODO: Handle method parameters
        valuePointer.value = ValString("Method setNullableString called");
        return true;
      }
      return false;
    };
    return callableMap;
  }

  /// Creates a MiniScript callable method for setNonNullableInt
  Value _createSetNonNullableIntMethod() {
    var methodMap = ValMap();
    methodMap.userData = this;
    methodMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "call") {
        valuePointer.value = _setNonNullableIntCallMethod();
        return true;
      }
      return false;
    };
    return methodMap;
  }

  /// Callable method implementation for setNonNullableInt
  Value _setNonNullableIntCallMethod() {
    var callableMap = ValMap();
    callableMap.userData = this;
    callableMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "invoke") {
        // TODO: Handle method parameters
        valuePointer.value = ValString("Method setNonNullableInt called");
        return true;
      }
      return false;
    };
    return callableMap;
  }

  /// Creates a MiniScript callable method for toggleFlag
  Value _createToggleFlagMethod() {
    var methodMap = ValMap();
    methodMap.userData = this;
    methodMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "call") {
        valuePointer.value = _toggleFlagCallMethod();
        return true;
      }
      return false;
    };
    return methodMap;
  }

  /// Callable method implementation for toggleFlag
  Value _toggleFlagCallMethod() {
    var callableMap = ValMap();
    callableMap.userData = this;
    callableMap.evalOverride = (key, valuePointer) {
      if (key is ValString && key.value == "invoke") {
        dartValue.toggleFlag();
        valuePointer.value = ValNull.instance;
        return true;
      }
      return false;
    };
    return callableMap;
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
