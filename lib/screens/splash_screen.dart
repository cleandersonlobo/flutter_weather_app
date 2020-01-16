import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_weather_app/main.dart';
import 'package:flutter_weather_app/screens/dashboad.dart';
import 'package:flutter_weather_app/utils/colors.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1)).then((_) {
      Navigator.pushReplacement(context,
          PageTransition(type: PageTransitionType.fade, child: Dashboard()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: ThemeColors.primaryColor,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                width: 250,
                height: 250,
                child: Image.asset("assets/splash_weather.png"),
              ),
              CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
            ],
          ),
        ));
  }
}
