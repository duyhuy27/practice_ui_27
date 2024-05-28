import 'package:flutter/material.dart';
import 'package:practice_ui_27/res/widget/text_custom.dart';
import 'package:practice_ui_27/utils/color.dart';

class TitleCategory extends StatefulWidget {
  final String image;
  final String title;
  final bool isShowIcon;
  const TitleCategory(
      {super.key, required this.image, required this.title, required this.isShowIcon});

  @override
  State<TitleCategory> createState() => _TitleCategoryState();
}

class _TitleCategoryState extends State<TitleCategory> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            widget.isShowIcon
                ? Image.asset(
                    // "assets/icon/hot_deals.png",
                    widget.image,
                    height: 16,
                    width: 16,
                  )
                : Container(),
            SizedBox(
              width: 10,
            ),
            TextCustom(
                textTile: widget.title,
                color: textColor,
                fontSized: 16,
                fontWeight: FontWeight.w500)
          ],
        ),
        TextCustom(
            textTile: "See All", color: primaryColor, fontSized: 10, fontWeight: FontWeight.w400)
      ],
    );
  }
}
