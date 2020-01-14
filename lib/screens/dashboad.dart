import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_weather_app/models/forecast.dart';
import 'package:flutter_weather_app/utils/colors.dart';
import 'package:flutter_weather_app/widgets/arc.dart';
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
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: null,
          backgroundColor: ThemeColors.primaryColor,
          elevation: 0,
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
        body: SafeArea(
          bottom: false,
          child: _scrollView(),
        ));
  }

  _scrollView() {
    return CustomScrollView(
      shrinkWrap: true,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(0),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                IntrinsicHeight(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          constraints: BoxConstraints.expand(),
                          color: Colors.white,
                          child: _body(), // Red
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
            child: Container(
          color: Colors.white,
          child: Center(
              child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Container(
                    child: CurrentTemperature(
                  temperature:
                      widget.forecast.currentObservation.condition.temperature,
                  condition: widget.forecast.currentObservation.condition.text,
                  forecasts: widget.forecast.forecasts,
                )),
              ),
              Arc(
                child: Container(
                  height: 120,
                  color: ThemeColors.primaryColor,
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[],
                  ),
                ),
              ),
            ],
          )),
        )),
      ],
    );
  }
}
