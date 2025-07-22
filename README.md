# MiniScript Code Generator

A powerful Dart code generation library for seamlessly integrating Dart objects with MiniScript. This package provides decorators and automated code generation to make Dart classes accessible from MiniScript with minimal boilerplate.

## Features

- **Decorator-based**: Use simple `@visible` and `@hide` annotations to control which properties and methods are exposed to MiniScript
- **Build runner integration**: Automatic wrapper generation using `build_runner` for seamless development workflow
- **Automatic code generation**: Generates wrapper classes that handle conversion between Dart and MiniScript types
- **Type-safe conversions**: Handles all common Dart types (String, int, double, bool, List, Map) automatically
- **Caching system**: Efficiently manages object instances to prevent duplicates and handle circular references
- **Property access**: Full support for getting and setting properties from MiniScript
- **Method calls**: Expose Dart methods as callable functions in MiniScript
- **Memory management**: Smart caching with cleanup capabilities

## Getting Started

### Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  miniscript: ^1.6.2-6
  source_gen: ^1.4.0
  build: ^2.4.0

dev_dependencies:
  build_runner: ^2.4.0
  analyzer: ^6.0.0
```

### Basic Usage with Build Runner (Recommended)

1. **Annotate your classes** with `@visible` and optionally `@hide` for specific properties:

```dart
import 'package:miniscriptgen/miniscriptgen.dart';

part 'player.g.dart';

@visible
class Player {
  String name;
  int health;
  int score;
  List<String> inventory;

  @hide
  String secretData; // This won't be accessible from MiniScript

  Player(this.name, this.health, this.score)
    : inventory = [], secretData = 'hidden';

  void takeDamage(int damage) {
    health -= damage;
    if (health < 0) health = 0;
  }

  void heal(int amount) {
    health += amount;
    if (health > 100) health = 100;
  }
}
```

2. **Generate wrapper classes** using build_runner:

```bash
# Generate wrappers automatically
dart run build_runner build

# Or use watch mode for continuous generation
dart run build_runner watch
```

3. **Use the generated wrappers in your code**:

```dart
import 'package:miniscript/miniscript_interpreter.dart';
import 'package:miniscriptgen/miniscriptgen.dart';

// Import your model
import 'player.dart';

void main() {
  // Register generated wrappers
  registerPlayerWrapper();

  // Create your objects
  var player = Player('Hero', 100, 0);

  // Create wrapper instance
  var playerWrapper = createPlayerWrapper(player);

  // Create MiniScript interpreter
  var interpreter = Interpreter();
  interpreter.standardOutput = (text, addLineBreak) => print('MiniScript: $text');

  // Add wrapped objects to MiniScript global scope
  interpreter.globals['player'] = playerWrapper;

  // Run MiniScript code that uses your objects
  interpreter.execute('''
    print "Player: " + player.name
    print "Health: " + player.health
    print "Score: " + player.score

    // Modify properties
    player.health = player.health - 10
    player.score = player.score + 50

    print "After battle:"
    print "Health: " + player.health
    print "Score: " + player.score
  ''');
}
```

## Build Runner Integration

The MiniScript Generator includes full build_runner integration for automatic wrapper generation with comprehensive testing and cleanup.

### Setup

1. **Configure build.yaml** (optional, default configuration works for most cases):

```yaml
targets:
  $default:
    builders:
      miniscriptgen|miniscript_wrapper_generator:
        enabled: true
        generate_for:
          - lib/**
          - example/**
          - test/**
        options:
          output_directory: "lib/generated"
          generate_setup_function: true
```

2. **Add part declarations** to files containing `@visible` classes:

```dart
part 'your_file.g.dart';
```

### Build Commands

```bash
# One-time build
dart run build_runner build

# Watch mode (rebuilds on file changes)
dart run build_runner watch

# Clean generated files
dart run build_runner clean

# Build with conflict resolution
dart run build_runner build --delete-conflicting-outputs
```

### Enhanced Build Scripts

Use the provided helper scripts for better control:

```bash
# Build with enhanced output
dart scripts/build.dart build

# Watch mode with better logging
dart scripts/build.dart watch

# Complete cleanup (removes ALL generated files)
dart scripts/build.dart clean

# Clean and rebuild
dart scripts/build.dart rebuild
```

### Generated Code

For each `@visible` class, the generator creates:

- **Wrapper Class**: `YourClassWrapper extends BaseWrapper<YourClass>`
- **Factory Function**: `YourClassWrapper createYourClassWrapper(YourClass object)`
- **Registration Function**: `void registerYourClassWrapper()`

### Example Generated Output

```dart
/// Generated wrapper for Player
class PlayerWrapper extends BaseWrapper<Player> {
  PlayerWrapper(Player dartObject) : super(dartObject);

  @override
  List<String> getPropertyNames() {
    return ["name", "health", "score", "inventory", "takeDamage", "heal"];
  }

  @override
  Value? getProperty(String propertyName) {
    switch (propertyName) {
      case "name":
        return dartToMiniScript(dartValue.name);
      case "health":
        return dartToMiniScript(dartValue.health);
      case "takeDamage":
        return _createTakeDamageMethod();
      // ... other properties
    }
  }

  @override
  bool setProperty(String propertyName, Value? value) {
    switch (propertyName) {
      case "name":
        var dartValue = miniScriptToDart(value);
        if (dartValue is String || dartValue == null) {
          this.dartValue.name = dartValue;
          return true;
        }
        return false;
      // ... other setters
    }
  }

  // Method wrappers...
}
```

## Core Components

### Annotations

- `@visible`: Mark a class to be accessible from MiniScript. All public properties and methods will be exposed unless marked with `@hide`.
- `@hide`: Mark specific properties or methods to be hidden from MiniScript, even if the class is `@visible`.

### BaseWrapper

The base class for all generated wrappers. It extends `ValMap` and provides:
- Property access through `getProperty()` and `setProperty()`
- Automatic type conversion between Dart and MiniScript values
- Integration with the MiniScript engine through `evalOverride` and `assignOverride`

### MiniScriptCache

A singleton cache system that:
- Manages wrapper factory registrations
- Handles object-to-wrapper conversions
- Prevents duplicate object wrapping
- Provides global `dartToMiniScript()` and `miniScriptToDart()` functions

### Code Generation

The `SimpleMiniScriptGenerator` creates:
- Wrapper classes that extend `BaseWrapper`
- Property getter/setter implementations
- Method binding code
- Registration functions for the cache

## Type Conversions

The system automatically handles conversion between Dart and MiniScript types:

| Dart Type | MiniScript Type | Notes |
|-----------|-----------------|-------|
| `String` | `ValString` | Direct conversion |
| `int` | `ValNumber` | Converted to double |
| `double` | `ValNumber` | Direct conversion |
| `bool` | `ValNumber` | `true` = 1.0, `false` = 0.0 |
| `List<Value?>` | `ValList` | Recursive conversion of elements |
| `Map<Value?, Value?>` | `ValMap` | Recursive conversion of values |
| `null` | `ValNull` | Null values |
| Custom Objects | `BaseWrapper<T>` | Uses registered wrappers |

## Advanced Features

### Method Calls

Methods are exposed as callable objects in MiniScript:

```dart
// In MiniScript
player.takeDamage(25)  // Calls the Dart method
player.heal(10)        // Calls the Dart method
```

### Property Access

Properties can be read and written from MiniScript:

```dart
// In MiniScript
name = player.name       // Get property
player.name = "NewName"  // Set property
health = player.health   // Get property
player.health = 50       // Set property
```

### Error Handling

The system gracefully handles:
- Type conversion errors
- Property access to non-existent properties
- Method calls with wrong parameters
- Null values and edge cases

### Memory Management

The cache system provides:
- Automatic cleanup of unused objects
- Prevention of memory leaks
- Statistics and monitoring
- Manual cache clearing when needed

## Testing and Validation

The MiniScript Generator includes a comprehensive test suite to ensure reliability and proper functionality.

### Running Tests

```bash
dart run build_runner build --ignore-conflicting-outputs

dart test
```

### Test Structure

The test suite includes:

- **Basic Wrapper Tests**: Property access, method calls, type validation
- **Build Runner Tests**: Code generation, file management, build process
- **Cleanup Tests**: File cleanup, environment reset, dependency tracking
- **Type Conversion Tests**: Dart ↔ MiniScript type conversion validation
- **Error Handling Tests**: Edge cases, invalid inputs, error recovery
- **Performance Tests**: Wrapper creation speed, memory usage, cache efficiency

### Test Files

```
test/
├── comprehensive_test.dart      # Main test suite
├── conversion_test.dart         # Type conversion tests
├── generated_wrapper_test.dart  # Generated wrapper tests
├── models.dart                  # Models for tests
├── test_model.dart              # Basic test model
├── wrapper_demo.dart            # Wrapper demonstration

example/
├── simple_test.dart           # Basic usage examples
├── demo.dart                  # Demo
├── debug_test.dart            # Debug utilities
└── models/                    # Test model classes
```

## Examples

See the `example/` directory for comprehensive examples:

- `models/`: Sample classes with `@visible` annotations
- `demo.dart`: Complete demonstration of generated wrappers
- `example_usage.dart`: Usage examples and integration patterns
- `simple_test.dart`: Basic testing examples
- Build runner integration examples with real generated code

## API Reference

### Core Functions

```dart
// Convert Dart object to MiniScript value
Value? dartToMiniScript(dynamic dartValue)

// Convert MiniScript value to Dart object
dynamic miniScriptToDart(Value? value)

// Setup cache with all wrappers
void setupMiniScriptCache()
```

### MiniScriptCache

```dart
// Register a wrapper factory
void registerWrapper<T>(WrapperFactory<T> factory)

// Check if wrapper exists
bool hasWrapper<T>()

// Get cache statistics
Map<String, dynamic> getCacheStats()

// Clear cache
void clearCache()
```

### Code Generation

```dart
// Create class descriptor
ClassDescriptor createClassDescriptor(String name, {
  List<PropertyDescriptor> properties = const [],
  List<PropertyDescriptor> methods = const [],
})

// Generate wrapper code
String generateWrapperForClassDescriptor(ClassDescriptor classDesc)
```

## Best Practices

1. **Use annotations consistently**: Always mark classes with `@visible` and use `@hide` for sensitive data
2. **Use build_runner**: Leverage automatic code generation instead of manual wrapper creation
3. **Handle type conversions**: Be aware of type conversion rules, especially for numbers and booleans
4. **Manage cache lifecycle**: Clear the cache periodically in long-running applications
5. **Test thoroughly**: Use the comprehensive test suite to verify functionality
6. **Error handling**: Implement proper error handling for MiniScript execution
7. **Watch mode**: Use `dart run build_runner watch` during development for automatic rebuilds
8. **Clean environment**: Use `dart scripts/build.dart clean` for complete cleanup
9. **Validate setup**: Run `dart scripts/test.dart validate` before major changes
10. **Monitor performance**: Use the performance tests to track wrapper efficiency

## Limitations

- Method calls with complex parameter types need manual implementation
- No support for generic types in wrapper generation
- Build runner integration requires part files
- Generated code depends on the analyzer package version
- Test environment requires proper cleanup between runs
- Performance testing may vary based on system resources

## Contributing

Contributions are welcome! Please:
1. Fork the repository
2. Create a feature branch
3. Add tests for new functionality using the test framework
4. Run `dart run build_runner build && dart test` to validate changes
5. Ensure all tests pass with `dart test`
6. Use `dart run build_runner clean` before committing
7. Submit a pull request with test results

## License

This project is licensed under the MIT License - see the LICENSE file for details.
