// @dart=2.9
import 'package:flutter/material.dart';
import 'package:hatch_box/side_screens/intro.dart';
import 'package:hatch_box/auth_screens/login.dart';
import 'package:hatch_box/side_screens/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart'
    show ArCoreController;

// ignore_for_file: prefer_const_constructors

Future main() async {
  WidgetsFlutterBinding.ensureInitialized ();
  print('ARCORE IS AVAILABLE?');
  print(await ArCoreController.checkArCoreAvailability());

  print('\nAR SERVICES INSTALLED?');
  print(await ArCoreController.checkIsArCoreInstalled());
  await Firebase.initializeApp();
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Splash(),
      ),
    );
  }
}


