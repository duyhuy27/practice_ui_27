import 'package:flutter/material.dart';
import 'package:practice_ui_27/utils/utils.dart';

class AppBarCustom extends StatefulWidget {
  const AppBarCustom({super.key});

  @override
  State<AppBarCustom> createState() => _AppBarCustomState();
}

class _AppBarCustomState extends State<AppBarCustom> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent, // Make AppBar transparent
      flexibleSpace: Container(
        child: Stack(
          children: <Widget>[
            // Bottom Layer
            Positioned(
              top: 10, // Slight vertical offset for the bottom layer
              child: ClipPath(
                clipper: AppBarCustomClipper(),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 180.0,
                  color: Colors.orange.shade50,
                ),
              ),
            ),
            // Top Layer
            ClipPath(
              clipper: AppBarCustomClipper(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 180.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFF8B61B),
                      Color(0xFFFC8607),
                      Color(0xFFFD8004),
                      Color(0xFFFE7A02),
                      Color(0xFFFF7500),
                    ],
                    stops: [0.1962, 0.791, 0.8634, 0.9357, 1.0],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      elevation: 0.0,
      title: Image.asset("assets/images/logo.png"),
    );
  }
}
