import 'dart:convert';

import 'package:bezier_chart/bezier_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_app/models/forecast_details.dart';
import 'package:flutter_weather_app/utils/colors.dart';
import 'package:flutter_weather_app/widgets/forecast_by_houry.dart';
import 'package:flutter_weather_app/widgets/loading.dart';
import 'package:flutter_weather_app/widgets/temperature_line_chart.dart';
import 'package:flutter_weather_app/widgets/weather_details_header.dart';

class WeatherDetails extends StatefulWidget {
  WeatherDetails({Key key}) : super(key: key);
  @override
  _WeatherDetailsState createState() => _WeatherDetailsState();
}

class _WeatherDetailsState extends State<WeatherDetails> {
  WeatherDetail forecastDetails;
  final _controllerList = ScrollController();
  GlobalKey<BezierChartState> _keyChatState = GlobalKey();
  @override
  void initState() {
    super.initState();
    _controllerList.addListener(_scrollListener);
    _loadJson();
  }

  @override
  Widget build(BuildContext context) {
    if (forecastDetails == null) {
      return Loading();
    }
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1, 0.9],
            colors: [
              ThemeColors.primaryColor,
              ThemeColors.lineGradientBottom,
            ],
          ),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            extendBodyBehindAppBar: true,
            resizeToAvoidBottomPadding: false,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text(
                forecastDetails.location.city,
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
            ),
            body: SafeArea(child: _scrollView())));
  }

  Future _loadJson() async {
    final snapshot = await DefaultAssetBundle.of(context)
        .loadString('assets/details_weather.json');
    WeatherDetail forecastJSON =
        WeatherDetail.fromJson(jsonDecode(snapshot.toString()));
    setState(() {
      forecastDetails = forecastJSON;
    });
  }

  _scrollListener() {
    _keyChatState.currentState
        .jumpToX(_controllerList.offset + (_controllerList.offset * 0.04));
  }

  _scrollView() {
    return CustomScrollView(
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
        SliverToBoxAdapter(
          child: Container(
              constraints: BoxConstraints(maxHeight: 130),
              child: ListView.builder(
                  controller: _controllerList,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(
                    left: 15,
                    right: 20,
                  ),
                  itemCount: forecastDetails.forecasts.hourly.length ?? 0,
                  itemBuilder: (context, index) {
                    return ForecastDailyByHour(
                      hourly: forecastDetails.forecasts.hourly[index],
                    );
                  })),
        ),
        SliverToBoxAdapter(
          child: Container(
            constraints: BoxConstraints(minHeight: 10, maxHeight: 100),
            child: TemperatureLineChart(
                hourly: forecastDetails.forecasts.hourly,
                keyChartState: _keyChatState),
          ),
        ),
      ],
    );
  }

  _body() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        WeatherDetailsHeader(
          temperature: forecastDetails.observation.temperature.now,
          condition: forecastDetails.observation.conditionDescription,
          high: forecastDetails.observation.temperature.high,
          low: forecastDetails.observation.temperature.low,
        ),
      ],
    );
  }
}
