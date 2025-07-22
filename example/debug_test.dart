import 'package:miniscript/miniscript.dart';
import 'package:miniscriptgen/lib.dart';

import 'models/player.dart';
import 'models/player.miniscript.dart';

/// Debug test to check type conversion issues
void main() {
  print('=== Debug Type Conversion Test ===');
  print('');

  // Create test objects
  final player = Player('DebugPlayer', 100, 100, 0);
  final playerWrapper = createPlayerWrapper(player);

  print('Original player health: ${player.health}');
  print('Original player health type: ${player.health.runtimeType}');
  print('');

  // Test what miniScriptToDart returns for different values
  print('=== Testing miniScriptToDart conversion ===');

  final valNumber90 = ValNumber(90);
  final valString90 = ValString('90');
  final valStringHello = ValString('Hello');

  print(
    'ValNumber(90): ${valNumber90.value} (${valNumber90.value.runtimeType})',
  );
  print(
    'ValString("90"): ${valString90.value} (${valString90.value.runtimeType})',
  );
  print(
    'ValString("Hello"): ${valStringHello.value} (${valStringHello.value.runtimeType})',
  );
  print('');

  final dartFromNumber = ConversionUtils.valueToDart(valNumber90);
  final dartFromString90 = ConversionUtils.valueToDart(valString90);
  final dartFromStringHello = ConversionUtils.valueToDart(valStringHello);

  print(
    'valueToDart(ValNumber(90)): $dartFromNumber (${dartFromNumber.runtimeType})',
  );
  print(
    'valueToDart(ValString("90")): $dartFromString90 (${dartFromString90.runtimeType})',
  );
  print(
    'valueToDart(ValString("Hello")): $dartFromStringHello (${dartFromStringHello.runtimeType})',
  );
  print('');

  // Test type checks
  print('=== Testing type checks ===');
  print('dartFromNumber is int: ${dartFromNumber is int}');
  print('dartFromNumber is double: ${dartFromNumber is double}');
  print('dartFromString90 is int: ${dartFromString90 is int}');
  print('dartFromString90 is String: ${dartFromString90 is String}');
  print('');

  // Test actual property setting with debug
  print('=== Testing actual property setting ===');

  print('Setting health to ValNumber(90)...');
  final result1 = playerWrapper.setProperty('health', valNumber90);
  print('Result: $result1');
  print('Player health after: ${player.health}');
  print('');

  print('Setting health to ValString("85")...');
  final result2 = playerWrapper.setProperty('health', ValString('85'));
  print('Result: $result2');
  print('Player health after: ${player.health}');
  print('');

  print('Setting name to ValString("NewName")...');
  final result3 = playerWrapper.setProperty('name', ValString('NewName'));
  print('Result: $result3');
  print('Player name after: ${player.name}');
  print('');

  // Test dartToMiniScript conversion
  print('=== Testing dartToMiniScript conversion ===');
  final intValue = 42;
  final stringValue = 'test';
  final boolValue = true;
  final doubleValue = 3.14;

  final msInt = ConversionUtils.dartToValue(intValue);
  final msString = ConversionUtils.dartToValue(stringValue);
  final msBool = ConversionUtils.dartToValue(boolValue);
  final msDouble = ConversionUtils.dartToValue(doubleValue);

  print('dartToValue(42): $msInt (${msInt.runtimeType})');
  print('dartToValue("test"): $msString (${msString.runtimeType})');
  print('dartToValue(true): $msBool (${msBool.runtimeType})');
  print('dartToValue(3.14): $msDouble (${msDouble.runtimeType})');
  print('');

  // Test conversion round trip
  print('=== Testing round trip conversion ===');
  final roundTripInt = ConversionUtils.valueToDart(
    ConversionUtils.dartToValue(intValue),
  );
  final roundTripString = ConversionUtils.valueToDart(
    ConversionUtils.dartToValue(stringValue),
  );
  final roundTripBool = ConversionUtils.valueToDart(
    ConversionUtils.dartToValue(boolValue),
  );
  final roundTripDouble = ConversionUtils.valueToDart(
    ConversionUtils.dartToValue(doubleValue),
  );

  print('Round trip int: $roundTripInt (${roundTripInt.runtimeType})');
  print('Round trip string: $roundTripString (${roundTripString.runtimeType})');
  print('Round trip bool: $roundTripBool (${roundTripBool.runtimeType})');
  print('Round trip double: $roundTripDouble (${roundTripDouble.runtimeType})');
  print('');

  print('=== Debug Test Complete ===');
}
