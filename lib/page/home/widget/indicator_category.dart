import 'package:flutter/material.dart';
import 'package:practice_ui_27/utils/color.dart';

class IndicatorCategory extends StatelessWidget {
  final int totalPages;
  final int currentPage;
  const IndicatorCategory({super.key, required this.totalPages, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalPages, (index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentPage == index ? primaryColor : Colors.orange.shade50,
          ),
        );
      }),
    );
  }
}
