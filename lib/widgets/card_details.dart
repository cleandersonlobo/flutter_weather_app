import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardDetails extends StatelessWidget {
  const CardDetails(
      {Key key,
      @required this.description,
      @required this.icon,
      @required this.title,
      this.iconColor})
      : super(key: key);
  final String description;
  final String title;
  final String icon;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      constraints: BoxConstraints(minWidth: 100),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              "assets/icons/$icon.svg",
              height: 35,
              color: iconColor,
            ),
            SizedBox(height: 15),
            Text(title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                )),
            SizedBox(height: 15),
            Text(
              description,
              style: TextStyle(color: Colors.grey, fontSize: 13),
            )
          ],
        ),
      ),
    ));
  }
}
