import 'package:flutter/widgets.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:gherkin_debug_test/main.dart';

void main() {
  // This line enables the extension
  enableFlutterDriverExtension();

  // Call the `main()` function of your app or call `runApp` with any widget you
  // are interested in testing.
  runApp(new MyApp());
}


