import 'dart:async';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:glob/glob.dart';
import 'package:args/args.dart';

import 'steps/home.dart';

Future<void> main(List<String> arguments) {  
  //by default run all features unless specified by arguments.
  var features = [Glob("features/**.feature")];
  if(arguments != null && arguments.length > 0) {
    var parser = ArgParser();
    parser.addOption('feature');
    var results = parser.parse(arguments);
    features = [Glob("features/" + results["feature"])];
  }
  
  final config = FlutterTestConfiguration()
    ..features = features
    ..reporters = [
      ProgressReporter(),
      TestRunSummaryReporter(),
      JsonReporter(path: './report.json')
    ] // you can include the "StdoutReporter()" without the message level parameter for verbose log information
    ..hooks = []
    ..stepDefinitions = [
      UserIsOnHomePage(),
      UserFindsIncrementButton()
    ]
//    ..customStepParameterDefinitions = [ColourParameter()]
    ..restartAppBetweenScenarios = true
    ..targetAppPath = "test_driver/app.dart"
    ..tagExpression = "@testable" // uncomment to see an example of running scenarios based on tag expressions
    ..exitAfterTestRun = false; // set to false if debugging to exit cleanly
  return GherkinRunner().execute(config);
}
