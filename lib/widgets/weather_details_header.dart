import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WeatherDetailsHeader extends StatelessWidget {
  const WeatherDetailsHeader(
      {Key key,
      @required this.temperature,
      @required this.condition,
      this.high,
      this.low})
      : super(key: key);
  final int temperature;
  final int high;
  final int low;
  final String condition;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        constraints: BoxConstraints(minHeight: 200),
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(temperature.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 100)),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: SvgPicture.asset(
                          "assets/celsius.svg",
                          height: 30,
                        ),
                      ),
                    ]),
                Text(condition,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.5))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Text("Today",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5)),
                SizedBox(
                  width: 20,
                ),
                Text("$high°/$low°",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.5))
              ],
            )
          ],
        ));
  }
}
