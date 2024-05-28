import 'package:flutter/material.dart';
import 'package:practice_ui_27/data/models/product_model.dart';
import 'package:practice_ui_27/res/widget/new_collection.dart';
import 'package:practice_ui_27/res/widget/text_custom.dart';
import 'package:practice_ui_27/utils/color.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class ItemProduct extends StatefulWidget {
  final List<Product> list;
  const ItemProduct({super.key, required this.list});

  @override
  State<ItemProduct> createState() => _ItemProductState();
}

class _ItemProductState extends State<ItemProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.list.length,
          itemBuilder: (context, index) {
            final productItem = widget.list[index];
            return Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(children: [
                    Container(
                      height: 105,
                      width: 150,
                      color: Colors.black,
                      child: Image.network(
                        widget.list[index].img,
                        fit: BoxFit.fill,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                    Positioned(
                      child: Container(
                        child: NewCollectionRibbon(),
                      ),
                      left: 20,
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextCustom(
                        textTile: widget.list[index].title,
                        color: textColor,
                        fontSized: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: SmoothStarRating(
                            allowHalfRating: false,
                            // onRatingChanged: (v) {
                            //   productItem.rate = v;
                            //   setState(() {});
                            // },
                            starCount: 5,
                            rating: widget.list[index].rate,
                            size: 12.0,
                            filledIconData: Icons.star,
                            halfFilledIconData: Icons.star_border,
                            color: primaryColor,
                            borderColor: primaryColor,
                            spacing: 0.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 10),
                        child: TextCustom(
                            textTile: widget.list[index].prices.toString(),
                            color: primaryColor,
                            fontSized: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}
