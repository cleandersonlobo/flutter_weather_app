import 'package:bezier_chart/bezier_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_app/models/forecast_details.dart';
import 'package:flutter_weather_app/utils/colors.dart';

class TemperatureLineChartDaily extends StatelessWidget {
  final List<Daily> daily;
  final GlobalKey<BezierChartState> keyChartState;
  TemperatureLineChartDaily({Key key, this.daily, this.keyChartState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(
          left: 15,
          right: 15,
        ),
        child: BezierChart(
          key: keyChartState,
          bezierChartScale: BezierChartScale.CUSTOM,
          bubbleLabelValueBuilder: (val) {
            var i = (val / 5).round();
            return "${daily[i].conditionDescription}\n";
          },
          headerValueBuilder: (val) {
            var i = (val / 5).round();
            var temp = daily[i].temperature.high;
            return "$temp°C";
          },
          footerValueBuilder: (val) {
            var i = (val / 5).round();
            var temp = daily[i].temperature.low;
            return "$temp°C";
          },
          xAxisCustomValues:
              Iterable<double>.generate(daily.length, (i) => i * 5.0).toList(),
          series: [
            BezierLine(
              lineColor: ThemeColors.orange,
              lineStrokeWidth: 2,
              data: createListHigh(daily),
            ),
            BezierLine(
              lineColor: Colors.purple[100],
              lineStrokeWidth: 2,
              data: createListLow(daily),
            ),
          ],
          config: BezierChartConfig(
              verticalIndicatorStrokeWidth: 0,
              pinchZoom: false,
              contentWidth: 82.0 * daily.length,
              footerHeight: 50,
              displayDataPointWhenNoValue: false,
              verticalIndicatorFixedPosition: false,
              showVerticalIndicator: false,
              physics: NeverScrollableScrollPhysics(),
              snap: false,
              xAxisTextStyle:
                  TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
        ),
      ),
    );
  }

  List<DataPoint<double>> createListHigh(List<Daily> data) {
    List<DataPoint<double>> tempData = new List<DataPoint<double>>();
    tempData.add(DataPoint<double>(
        value: data[0].temperature.high.floorToDouble(), xAxis: 20));
    for (var i = 1; i < data.length; i++) {
      tempData.add(DataPoint<double>(
          value: data[i].temperature.high.floorToDouble(), xAxis: i * 5.0));
    }
    return tempData;
  }

  List<DataPoint<double>> createListLow(List<Daily> data) {
    List<DataPoint<double>> tempData = new List<DataPoint<double>>();
    tempData.add(DataPoint<double>(
        value: data[0].temperature.low.floorToDouble(), xAxis: 20));
    for (var i = 1; i < data.length; i++) {
      tempData.add(DataPoint<double>(
          value: data[i].temperature.low.floorToDouble(), xAxis: i * 5.0));
    }
    return tempData;
  }
}
