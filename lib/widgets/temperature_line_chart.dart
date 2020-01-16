import 'package:bezier_chart/bezier_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_app/models/forecast_details.dart';
import 'package:flutter_weather_app/utils/colors.dart';

class TemperatureLineChart extends StatelessWidget {
  final List<Hourly> hourly;
  final GlobalKey<BezierChartState> keyChartState;
  TemperatureLineChart({Key key, this.hourly, this.keyChartState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: BezierChart(
          key: keyChartState,
          bezierChartScale: BezierChartScale.CUSTOM,
          bubbleLabelValueBuilder: (val) {
            var i = (val / 5).round();
            return "${hourly[i].conditionDescription}\n";
          },
          footerValueBuilder: (val) {
            var i = (val / 5).round();
            var temp = hourly[i].temperature.now;
            return "$temp°C";
          },
          xAxisCustomValues:
              Iterable<double>.generate(hourly.length, (i) => i * 5.0).toList(),
          series: [
            BezierLine(
              lineColor: ThemeColors.orange,
              lineStrokeWidth: 2,
              data: createList(hourly),
            ),
          ],
          config: BezierChartConfig(
              verticalIndicatorStrokeWidth: 0,
              pinchZoom: false,
              contentWidth: 80.0 * hourly.length,
              footerHeight: 60,
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

  List<DataPoint<double>> createList(List<Hourly> data) {
    List<DataPoint<double>> tempData = new List<DataPoint<double>>();
    tempData.add(DataPoint<double>(
        value: data[0].temperature.now.floorToDouble(), xAxis: 20));
    for (var i = 1; i < data.length; i++) {
      tempData.add(DataPoint<double>(
          value: data[i].temperature.now.floorToDouble(), xAxis: i * 5.0));
    }
    return tempData;
  }
}
