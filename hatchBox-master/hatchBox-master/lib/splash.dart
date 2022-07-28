// ignore_for_file: prefer_const_constructors
import 'dart:async';

import 'package:hatch_box/login.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:hatch_box/Home.dart';
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(
          seconds:5,
          navigateAfterSeconds: MyLogin(),
          title: Text("Level up your bio",style:TextStyle(
            fontSize: 18,fontWeight: FontWeight.w300,
            fontStyle: FontStyle.italic,
          ),),
          image: Image.asset('assets/hlogo.jpeg'),
          photoSize: 190.0,
          backgroundColor: Colors.white,
          loaderColor: Colors.blueGrey
      )
    );
  }
}
