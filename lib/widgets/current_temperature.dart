import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_weather_app/models/forecast.dart';
import 'package:flutter_weather_app/utils/colors.dart';
import 'package:flutter_weather_app/widgets/line_temperature.dart';

class CurrentTemperature extends StatelessWidget {
  const CurrentTemperature(
      {Key key,
      @required this.temperature,
      @required this.condition,
      @required this.forecasts})
      : super(key: key);
  final int temperature;
  final String condition;
  final List<Forecasts> forecasts;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: ThemeColors.primaryColor,
        padding: EdgeInsets.only(right: 20, left: 20),
        child: Wrap(children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(width: 25),
                  Column(children: <Widget>[
                    Text(temperature.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 80)),
                    Text(condition,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 20))
                  ]),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: SvgPicture.asset(
                      "assets/celsius.svg",
                      height: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  LineTemperature(
                    forecast: forecasts[0],
                    day: 0,
                  ),
                  LineTemperature(forecast: forecasts[1], day: 1),
                  LineTemperature(forecast: forecasts[2], day: 2),
                ],
              ),
            ],
          ),
        ]));
  }
}
