import 'package:test/test.dart';
import 'package:miniscriptgen/miniscriptgen.dart';

// Import test models
import 'models.dart';

// Import generated wrappers
import 'models.miniscript.dart';

/// Comprehensive test suite for MiniScript Generator
/// This file demonstrates the new test format with proper cleanup and validation
void main() {
  group('MiniScript Generator Comprehensive Test Suite', () {
    setUpAll(() {
      // Global setup for all tests
      registerTestModelWrapper();
    });

    group('Basic Wrapper Tests', () {
      late TestModel model;
      late TestModelWrapper wrapper;

      setUp(() {
        model = TestModel('TestName', 42);
        wrapper = createTestModelWrapper(model);
      });

      test('wrapper creation and registration', () {
        expect(wrapper, isNotNull);
      });

      test('property access', () {
        expect(wrapper.getProperty('name')?.toString(), equals('TestName'));
        expect(wrapper.getProperty('value')?.toString(), equals('42'));
      });

      test('property modification', () {
        final nameSet = wrapper.setProperty('name', ValString('NewName'));
        final valueSet = wrapper.setProperty('value', ValNumber(100));

        expect(nameSet, isTrue);
        expect(valueSet, isTrue);
        expect(model.name, equals('NewName'));
        expect(model.value, equals(100));
      });

      test('method access', () {
        final setValueMethod = wrapper.getProperty('setValue');
        final getNameMethod = wrapper.getProperty('getName');

        expect(setValueMethod, isNotNull);
        expect(getNameMethod, isNotNull);
      });
    });

    group('Type Conversion Tests', () {
      test('dartToMiniScript conversions', () {
        expect(dartToMiniScript('test'), isA<ValString>());
        expect(dartToMiniScript(42), isA<ValNumber>());
        expect(dartToMiniScript(3.14), isA<ValNumber>());
        expect(dartToMiniScript(true), isA<ValNumber>());
        expect(dartToMiniScript(null), isA<ValNull>());
        expect(dartToMiniScript(['a', 'b']), isA<ValList>());
        expect(dartToMiniScript({'key': 'value'}), isA<ValMap>());
      });

      test('miniScriptToDart conversions', () {
        expect(miniScriptToDart(ValString('test')), equals('test'));
        expect(miniScriptToDart(ValNumber(42)), equals(42.0));
        expect(miniScriptToDart(ValNumber(1)), equals(1.0));
        expect(miniScriptToDart(ValNull.instance), isNull);
      });
    });

    group('Error Handling Tests', () {
      late TestModel model;
      late TestModelWrapper wrapper;

      setUp(() {
        model = TestModel('Test', 0);
        wrapper = createTestModelWrapper(model);
      });

      test('invalid property access', () {
        final invalidGet = wrapper.getProperty('nonExistent');
        expect(
          invalidGet,
          isNull,
          reason: 'Invalid property should return null',
        );
      });

      test('invalid property set', () {
        final invalidSet = wrapper.setProperty(
          'nonExistent',
          ValString('test'),
        );
        expect(
          invalidSet,
          isFalse,
          reason: 'Invalid property set should return false',
        );
      });

      test('type mismatch', () {
        final wrongType = wrapper.setProperty(
          'value',
          ValString('not a number'),
        );
        expect(wrongType, isFalse, reason: 'Wrong type should be rejected');
      });

      test('null values', () {
        final nullSet = wrapper.setProperty('name', ValNull.instance);
        expect(
          nullSet,
          isTrue,
          reason: 'Null values should be accepted for nullable properties',
        );
      });
    });

    group('Performance Tests', () {
      test('wrapper creation performance', () {
        final stopwatch = Stopwatch()..start();

        final models = <TestModel>[];
        final wrappers = <TestModelWrapper>[];

        for (int i = 0; i < 1000; i++) {
          final model = TestModel('Test$i', i);
          final wrapper = createTestModelWrapper(model);
          models.add(model);
          wrappers.add(wrapper);
        }

        stopwatch.stop();
        final creationTime = stopwatch.elapsedMilliseconds;

        expect(wrappers.length, equals(1000));
        expect(
          creationTime,
          lessThan(5000),
        ); // Should complete within 5 seconds

        print('Created 1000 wrappers in ${creationTime}ms');
      });

      test('property access performance', () {
        final models = <TestModel>[];
        final wrappers = <TestModelWrapper>[];

        for (int i = 0; i < 1000; i++) {
          final model = TestModel('Test$i', i);
          final wrapper = createTestModelWrapper(model);
          models.add(model);
          wrappers.add(wrapper);
        }

        final stopwatch = Stopwatch()..start();

        for (final wrapper in wrappers) {
          wrapper.getProperty('name');
          wrapper.getProperty('value');
        }

        stopwatch.stop();
        final accessTime = stopwatch.elapsedMilliseconds;

        expect(accessTime, lessThan(5000)); // Should complete within 5 seconds

        print('Accessed 2000 properties in ${accessTime}ms');

        // Test memory cleanup
        models.clear();
        wrappers.clear();
      });

      test('cache statistics', () {
        final cacheStats = MiniScriptCache.instance.getCacheStats();
        expect(cacheStats, isNotNull);
        print('Cache stats: $cacheStats');
      });
    });
  });
}

/// Helper functions for creating test instances
class TestHelper {
  static TestModel createBasicModel() => TestModel('TestName', 42);
  static TestConfig createConfig() => TestConfig();
  static TestResult createResult(String name, bool passed, int duration) =>
      TestResult(testName: name, passed: passed, duration: duration);
  static ComplexTestModel createComplexModel() => ComplexTestModel(
    name: 'Complex Test',
    intValue: 42,
    doubleValue: 3.14,
    boolValue: true,
    stringList: ['item1', 'item2'],
    stringIntMap: {'key1': 1, 'key2': 2},
    intList: [10, 20, 30],
    dynamicMap: {'config': 'value'},
  );
}
