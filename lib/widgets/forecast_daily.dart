import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_weather_app/models/forecast_details.dart';
import 'package:intl/intl.dart';

class ForecastDaily extends StatelessWidget {
  const ForecastDaily({Key key, this.daily}) : super(key: key);
  final Daily daily;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: Column(
        children: <Widget>[
          Text(
            DateFormat.E()
                .format(DateTime.parse(daily.observationTime.timestamp)),
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              letterSpacing: 0.5,
            ),
          ),
          SizedBox(height: 15),
          SvgPicture.asset(
            "assets/weatherIcons/${daily.conditionCode}.svg",
            height: 30,
            color: daily.conditionDescription.contains("Sunny")
                ? Colors.yellowAccent
                : Colors.white,
          ),
          SizedBox(height: 15),
          AutoSizeText(
            daily.conditionDescription,
            textAlign: TextAlign.center,
            maxLines: 2,
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
