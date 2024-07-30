import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            // clipper: BottomClipper(),
            clipper: BottomClipperTest(),
            child: Container(
              color: Colors.deepPurple,
              height: 200.0,
            ),
          )
        ],
      ),
    );
  }
}

//贝塞尔曲线
class BottomClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 50);
    var firstControlPoint = Offset(size.width/2, size.height);
    var firstEndPoint = Offset(size.width, size.height - 50);
    path.quadraticBezierTo(
        firstControlPoint.dx,
        firstControlPoint.dy,
        firstEndPoint.dx,
        firstEndPoint.dy);
    path.lineTo(size.width, size.height-50);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    throw false;
  }
}

//波浪型贝塞尔曲线
class BottomClipperTest extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 40);
    var firstControlPoint = Offset(size.width/4, size.height);
    var firstEndPoint = Offset(size.width/2.25, size.height - 30);

    path.quadraticBezierTo(
        firstControlPoint.dx,
        firstControlPoint.dy,
        firstEndPoint.dx,
        firstEndPoint.dy);

    var secondControlPoint = Offset(size.width/4*3, size.height-90);
    var secondEndPoint = Offset(size.width, size.height-60);

    path.quadraticBezierTo(
        secondControlPoint.dx,
        secondControlPoint.dy,
        secondEndPoint.dx,
        secondEndPoint.dy);

    path.lineTo(size.width, size.height-60);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    throw false;
  }
}
