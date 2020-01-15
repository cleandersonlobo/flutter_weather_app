import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_weather_app/models/forecast.dart';
import 'package:flutter_weather_app/utils/colors.dart';

const codeDays = {0: "Today", 1: "Tomorrow"};

class LineTemperature extends StatelessWidget {
  const LineTemperature({Key key, this.forecast, this.day}) : super(key: key);

  final Forecasts forecast;
  final day;

  @override
  Widget build(BuildContext context) {
    String todayText =
        day != null ? codeDays[day] ?? forecast.day : forecast.day;
    Color firstColor =
        day != null && day == 0 ? ThemeColors.yellow : Colors.white;
    return Container(
        margin: EdgeInsets.only(bottom: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            SvgPicture.asset(
              "assets/weatherIcons/${forecast.code.toString()}.svg",
              height: 30,
              color: firstColor,
            ),
            SizedBox(width: 10),
            Expanded(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(
                  "$todayText - ${forecast.text}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    letterSpacing: 0.5,
                  ),
                ),
                Text(
                  "${forecast.high}°/${forecast.low}°",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ))
          ],
        ));
  }
}
