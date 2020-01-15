import 'package:flutter/material.dart';
import 'package:flutter_weather_app/utils/colors.dart';

class Loading extends StatelessWidget {
  const Loading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: ThemeColors.primaryColor,
        child: Center(
            child: new CircularProgressIndicator(
          backgroundColor: Colors.white,
        )));
  }
}
