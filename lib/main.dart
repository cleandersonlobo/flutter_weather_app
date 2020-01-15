import 'package:flutter/material.dart';
import 'package:flutter_weather_app/screens/dashboad.dart';
import 'package:flutter_weather_app/screens/weather_details.dart';
import 'package:flutter_weather_app/utils/colors.dart';
import 'package:flutter_weather_app/utils/createColor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Dashboard(),
      },
      theme: ThemeData(
          backgroundColor: ThemeColors.primaryColor,
          canvasColor: ThemeColors.primaryColor,
          primarySwatch: createMaterialColor(ThemeColors.primaryColor),
          secondaryHeaderColor:
              createMaterialColor(ThemeColors.secondaryColor)),
    );
  }
}
