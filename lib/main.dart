import 'package:flutter/material.dart';
import 'package:flutterarchitecturesample/data_layer/session.dart';
import 'package:flutterarchitecturesample/service_locator.dart';
import 'package:flutterarchitecturesample/ui_layer/app.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  // WidgetsFlutterBinding is needed when awaiting in main()
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPreferences.getInstance().then((SharedPreferences prefs) {
    serviceLocator.registerSingleton(prefs);
  });

  serviceLocator.registerSingleton(Session());

  runApp(App());
}
