import 'package:flutter/material.dart';
import 'package:practice_ui_27/res/widget/text_custom.dart';
import 'package:practice_ui_27/utils/utils.dart';

class AppBarClient extends StatefulWidget {
  const AppBarClient({super.key});

  @override
  State<AppBarClient> createState() => _AppBarClientState();
}

class _AppBarClientState extends State<AppBarClient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(180.0),
          child: AppBar(
              backgroundColor: Colors.transparent,
              flexibleSpace: Stack(
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
              elevation: 0.0,
              title: Image.asset("assets/images/logo.png"),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
                Stack(children: [
                  IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: Container(
                      height: 16,
                      width: 16,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                      child: Center(
                        child: TextCustom(
                            textTile: "20",
                            color: Colors.white,
                            fontSized: 10,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ]),
              ],
              leadingWidth: 100,
              leading: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ],
              )),
        ),
        body: SingleChildScrollView());
  }
}
