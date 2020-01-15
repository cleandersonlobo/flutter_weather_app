import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_weather_app/models/forecast.dart';
import 'package:flutter_weather_app/utils/colors.dart';
import 'package:flutter_weather_app/widgets/arc.dart';
import 'package:flutter_weather_app/widgets/card_details.dart';
import 'package:flutter_weather_app/widgets/current_temperature.dart';

class Dashboard extends StatefulWidget {
  final Weather forecast;

  Dashboard({Key key, this.forecast}) : super(key: key);
  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: ThemeColors.primaryColor,
          elevation: 0,
          centerTitle: true,
          title: Text(
            widget.forecast.location.city,
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
              size: 30,
            ),
            tooltip: 'Add Location',
            onPressed: null,
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
                size: 30,
              ),
              tooltip: 'More Options',
              onPressed: null,
            ),
          ],
        ),
        body: SafeArea(child: _scrollView()));
  }

  _scrollView() {
    return CustomScrollView(
      shrinkWrap: true,
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate(
            <Widget>[
              IntrinsicHeight(
                child: _body(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _body() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
            child: CurrentTemperature(
          temperature: widget.forecast.currentObservation.condition.temperature,
          condition: widget.forecast.currentObservation.condition.text,
          forecasts: widget.forecast.forecasts,
        )),
        Arc(
          child: Container(
            height: 80,
            color: ThemeColors.primaryColor,
            margin: EdgeInsets.all(0),
          ),
        ),
        Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Wrap(
                  alignment: WrapAlignment.center,
                  direction: Axis.horizontal,
                  spacing: 20,
                  children: <Widget>[
                    CardDetails(
                      title:
                          "${widget.forecast.currentObservation.atmosphere["pressure"]} mb",
                      description: "Pressure",
                      icon: "pressure",
                      iconColor: Colors.red[700],
                    ),
                    CardDetails(
                        title:
                            "${widget.forecast.currentObservation.wind["speed"]}km/h",
                        description: "East",
                        icon: "speed",
                        iconColor: Colors.teal),
                    CardDetails(
                        title:
                            "${widget.forecast.currentObservation.atmosphere["humidity"]}",
                        description: "Humidity",
                        icon: "humidity",
                        iconColor: Colors.lightBlue),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  direction: Axis.horizontal,
                  spacing: 20,
                  children: <Widget>[
                    CardDetails(
                      title:
                          "${widget.forecast.currentObservation.atmosphere["visibility"]}",
                      description: "Visibility",
                      icon: "visibility",
                      iconColor: Colors.purpleAccent,
                    ),
                    CardDetails(
                      title:
                          "${widget.forecast.currentObservation.astronomy["sunset"]}",
                      description: "Sunset",
                      icon: "sunset",
                      iconColor: Colors.yellow[900],
                    ),
                    CardDetails(
                      title:
                          "${widget.forecast.currentObservation.astronomy["sunrise"]}",
                      description: "East",
                      icon: "sunrise",
                      iconColor: Colors.deepPurple,
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                RaisedButton(
                  color: ThemeColors.secondaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(50.0)),
                  padding:
                      EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 20),
                  child: Text(
                    "More Details",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  onPressed: () {},
                )
              ],
            )),
      ],
    );
  }
}
