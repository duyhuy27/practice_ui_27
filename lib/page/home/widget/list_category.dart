import 'package:flutter/material.dart';
import 'package:practice_ui_27/data/models/categori_model.dart';
import 'package:practice_ui_27/res/widget/text_custom.dart';
import 'package:practice_ui_27/utils/color.dart';

class ListCategory extends StatefulWidget {
  final int totalPages;
  final PageController pageController;
  final int currentPage;
  final List<Category> categories;
  final int itemsPerPage;

  const ListCategory(
      {super.key,
      required this.totalPages,
      required this.pageController,
      required this.categories,
      required this.itemsPerPage,
      required this.currentPage});

  @override
  State<ListCategory> createState() => _ListCategoryState();
}

class _ListCategoryState extends State<ListCategory> {
  late int _curretPage;

  @override
  void initState() {
    super.initState();
    // Add code after super
    _curretPage = widget.currentPage;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: PageView.builder(
        controller: widget.pageController,
        itemCount: widget.totalPages,
        onPageChanged: (int page) {
          setState(() {
            _curretPage = page;
          });
        },
        itemBuilder: (context, pageIndex) {
          int startIndex = pageIndex * widget.itemsPerPage;
          int endIndex = (startIndex + widget.itemsPerPage > widget.categories.length)
              ? widget.categories.length
              : startIndex + widget.itemsPerPage;
          List<String> pageCategories =
              widget.categories.sublist(startIndex, endIndex).cast<String>();

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemCount: pageCategories.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: dividerColor,
                    ),
                    child: Center(
                      child: Image.asset(widget.categories[index].img),
                    ),
                  ),
                  TextCustom(
                      textTile: widget.categories[index].title,
                      color: textColor,
                      fontSized: 12,
                      fontWeight: FontWeight.w400)
                ],
              );
            },
          );
        },
      ),
    );
  }
}
