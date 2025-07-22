import 'package:test/test.dart';
import 'package:miniscript/miniscript.dart';

import 'package:miniscriptgen/lib.dart';

void main() {
  group('ConversionUtils Tests', () {
    test('dartToValue - primitive types', () {
      // Test null
      expect(ConversionUtils.dartToValue(null), isA<ValNull>());

      // Test string
      final stringValue = ConversionUtils.dartToValue('hello');
      expect(stringValue, isA<ValString>());
      expect((stringValue as ValString).value, equals('hello'));

      // Test number
      final numberValue = ConversionUtils.dartToValue(42);
      expect(numberValue, isA<ValNumber>());
      expect((numberValue as ValNumber).value, equals(42.0));

      // Test bool
      final boolValue = ConversionUtils.dartToValue(true);
      expect(boolValue, isA<ValNumber>());
      expect((boolValue as ValNumber).value, equals(1.0));

      final falseBoolValue = ConversionUtils.dartToValue(false);
      expect(falseBoolValue, isA<ValNumber>());
      expect((falseBoolValue as ValNumber).value, equals(0.0));
    });

    test('dartToValue - collections', () {
      // Test list
      final listValue = ConversionUtils.dartToValue([
        'a',
        'b',
        'c',
      ], force: true);
      expect(listValue, isA<ValList>());
      final valList = listValue as ValList;
      expect(valList.values.length, equals(3));
      expect((valList.values[0] as ValString).value, equals('a'));

      // Test map
      final mapValue = ConversionUtils.dartToValue({
        'key': 'value',
      }, force: true);
      expect(mapValue, isA<ValMap>());
      final valMap = mapValue as ValMap;
      expect(valMap.keys.length, equals(1));
    });

    test('valueToDart - primitive types', () {
      // Test null
      expect(ConversionUtils.valueToDart(ValNull.instance), isNull);

      // Test string
      expect(ConversionUtils.valueToDart(ValString('hello')), equals('hello'));

      // Test number
      expect(ConversionUtils.valueToDart(ValNumber(42.0)), equals(42.0));

      // Test list
      final valList = ValList([ValString('a'), ValString('b')]);

      final dartList = ConversionUtils.valueToDart(valList);

      expect(dartList, isA<List>());
      expect(ConversionUtils.valueToDart(dartList[0]), equals('a'));
      expect(ConversionUtils.valueToDart(dartList[1]), equals('b'));
    });

    test('round-trip conversions', () {
      // Test string round trip
      final originalString = 'test string';
      final valString = ConversionUtils.dartToValue(originalString);
      final backToDart = ConversionUtils.valueToDart(valString);
      expect(backToDart, equals(originalString));

      // Test number round trip
      final originalNumber = 123.45;
      final valNumber = ConversionUtils.dartToValue(originalNumber);
      final backToNumber = ConversionUtils.valueToDart(valNumber);
      expect(backToNumber, equals(originalNumber));

      // Test list round trip
      final originalList = ['a', 'b', 'c'];
      final valList = ConversionUtils.dartToValue(originalList, force: true);
      final backToList = ConversionUtils.valueToDart(valList);
      expect(backToList, equals(originalList));
    });

    test('convenience functions', () {
      // Test global convenience functions
      expect(ConversionUtils.dartToValue('hello'), isA<ValString>());
      expect(ConversionUtils.valueToDart(ValString('hello')), equals('hello'));
    });

    test('utility functions', () {
      // Test type names
      expect(ConversionUtils.getTypeName(ValString('test')), equals('string'));
      expect(ConversionUtils.getTypeName(ValNumber(42.0)), equals('number'));
      expect(ConversionUtils.getTypeName(ValList([])), equals('list'));
      expect(ConversionUtils.getTypeName(ValMap()), equals('map'));
      expect(ConversionUtils.getTypeName(ValNull.instance), equals('null'));
    });
  });
}
