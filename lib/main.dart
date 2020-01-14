import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_weather_app/models/forecast.dart';
import 'package:flutter_weather_app/screens/dashboad.dart';
import 'package:flutter_weather_app/utils/colors.dart';
import 'package:flutter_weather_app/utils/createColor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          backgroundColor: ThemeColors.primaryColor,
          canvasColor: ThemeColors.primaryColor,
          primarySwatch: createMaterialColor(ThemeColors.primaryColor),
          secondaryHeaderColor:
              createMaterialColor(ThemeColors.secondaryColor)),
      home: new FutureBuilder(
          future:
              DefaultAssetBundle.of(context).loadString('assets/paris.json'),
          builder: (context, snapshot) {
            Weather forecast =
                Weather.fromJson(jsonDecode(snapshot.data.toString()));
            print(forecast.toString());
            return forecast != null
                ? Dashboard(forecast: forecast)
                : Container(
                    color: ThemeColors.primaryColor,
                    child: Center(
                        child: new CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    )));
          }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
