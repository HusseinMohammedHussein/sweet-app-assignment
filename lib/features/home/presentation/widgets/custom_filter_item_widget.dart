import 'package:flutter/material.dart';
import 'package:sweetsstore/core/utils/utils_exports.dart';

class CustomFilterItemWidget extends StatelessWidget {
  const CustomFilterItemWidget(
      {super.key,
      required this.selectedIndex,
      required this.currentIndex,
      required this.categoryName});

  final int selectedIndex;
  final int currentIndex;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    List<String> productsItems = ['جميع ', 'تورت', 'جاتوه'];
    return Container(
      alignment: AlignmentDirectional.center,
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
      margin: const EdgeInsetsDirectional.only(end: 10),
      decoration: BoxDecoration(
          border: Border.all(
              color: selectedIndex == currentIndex
                  ? AppColors.primaryColor
                  : Colors.transparent),
          borderRadius: BorderRadius.circular(20),
          color: AppColors.secondaryColor),
      child: Text(
        currentIndex == 0
            ? '${productsItems[currentIndex]} ${categoryName ?? ''}'
            : productsItems[currentIndex],
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: selectedIndex == currentIndex
                ? AppColors.primaryColor
                : AppColors.textColor),
      ),
    );
  }
}
