import 'package:flutter/material.dart';

class Arc extends StatelessWidget {
  final Widget child;

  Arc({this.child});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ArcClipper(),
      child: child,
    );
  }
}

class ArcClipper extends CustomClipper<Path> {
  ArcClipper();
  final double offset = 100;
  @override
  Path getClip(Size size) {
    Path path = Path();
    createArc(size, path);
    path.close();
    return path;
  }

  createArc(Size size, Path path) {
    path.lineTo(0.0, size.height - offset);
    path.quadraticBezierTo(
        size.width / 2, size.height - 50, size.width, size.height - offset);
    path.lineTo(size.width, 0.0);
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
