import 'dart:convert';

import 'package:bezier_chart/bezier_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_app/models/forecast_details.dart';
import 'package:flutter_weather_app/utils/colors.dart';
import 'package:flutter_weather_app/widgets/forecast_by_houry.dart';
import 'package:flutter_weather_app/widgets/forecast_daily.dart';
import 'package:flutter_weather_app/widgets/loading.dart';
import 'package:flutter_weather_app/widgets/temperature_daily_line_chart.dart';
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
  final _controllerListDaily = ScrollController();
  GlobalKey<BezierChartState> _keyChatState = GlobalKey();
  GlobalKey<BezierChartState> _keyChatStateDaily = GlobalKey();
  @override
  void initState() {
    super.initState();
    _controllerList.addListener(_scrollListener);
    _controllerListDaily.addListener(_scrollListenerDaily);
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
        .jumpToX(_controllerList.offset + (_controllerList.offset * 0.041));
  }

  _scrollListenerDaily() {
    _keyChatStateDaily.currentState.jumpToX(_controllerListDaily.offset);
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
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.only(left: 15, top: 20, bottom: 40),
            child: Text(
                "${forecastDetails.forecasts.daily.length} - day forecast",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5)),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
              constraints: BoxConstraints(maxHeight: 130),
              child: ListView.builder(
                  controller: _controllerListDaily,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(
                    left: 15,
                    right: 20,
                  ),
                  itemCount: forecastDetails.forecasts.daily.length,
                  itemBuilder: (context, index) {
                    return ForecastDaily(
                      daily: forecastDetails.forecasts.daily[index],
                    );
                  })),
        ),
        SliverToBoxAdapter(
          child: Container(
            constraints: BoxConstraints(minHeight: 10, maxHeight: 130),
            child: TemperatureLineChartDaily(
                daily: forecastDetails.forecasts.daily,
                keyChartState: _keyChatStateDaily),
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

  @override
  void dispose() {
    _controllerList.dispose();
    _controllerListDaily.dispose();
    super.dispose();
  }
}
