import 'package:flutter/material.dart';

class NewCollectionRibbon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25,
      height: 25,
      child: Stack(
        children: [
          // This is the ribbon background
          Positioned(
            left: 2,
            top: 2,
            child: CustomPaint(
              size: Size(21, 20),
              painter: RibbonPainter(),
            ),
          ),
          // This is the text inside the ribbon
          Positioned(
            left: 4,
            top: 4,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'New',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 3.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Collection',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 3.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RibbonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(
        colors: [Colors.orange, Colors.red],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height - 5)
      ..lineTo(size.width / 2, size.height)
      ..lineTo(0, size.height - 5)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
