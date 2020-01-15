import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_weather_app/models/forecast_details.dart';
import 'package:flutter_weather_app/utils/helpers.dart';

class ForecastDailyByHour extends StatelessWidget {
  const ForecastDailyByHour({Key key, this.hourly}) : super(key: key);
  final Hourly hourly;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      child: Column(
        children: <Widget>[
          Text(
            formatHourToString(hourly.observationTime.hour),
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              letterSpacing: 0.5,
            ),
          ),
          SizedBox(height: 15),
          SvgPicture.asset(
            "assets/weatherIcons/${hourly.conditionCode}.svg",
            height: 30,
            color: hourly.conditionDescription.contains("Sunny")
                ? Colors.yellowAccent
                : Colors.white,
          ),
          SizedBox(height: 15),
          Text(
            hourly.conditionDescription,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                letterSpacing: 0.8,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
