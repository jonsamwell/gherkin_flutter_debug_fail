import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class UserIsOnHomePage extends ThenWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {
    final locator = find.byValueKey("homepage");
    await FlutterDriverUtils.waitForFlutter(world.driver);
    var isPresent = await FlutterDriverUtils.isPresent(locator, world.driver);
    expectMatch(isPresent, true);
  }

  @override
  RegExp get pattern => RegExp(r"user is on the home page");
}

class UserFindsIncrementButton extends ThenWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {
    final locator = find.byValueKey("welcome-key");
    await FlutterDriverUtils.waitForFlutter(world.driver);
    var isPresent = await FlutterDriverUtils.isPresent(locator, world.driver);
    expectMatch(isPresent, true);
  }

  @override
  RegExp get pattern => RegExp(r"user should find the increment button");
}
