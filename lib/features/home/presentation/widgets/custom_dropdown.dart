import 'dart:core';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sweetsstore/core/utils/utils_exports.dart';
import 'package:sweetsstore/features/home/home_feature_export.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({super.key});

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  Map<String, String> items = {
    'assorted-bakeries': 'مخبوزات متنوعة',
    'oriental-sweets': 'حلويات شرقية'
  };
  String selectedItem = '';

  @override
  void initState() {
    super.initState();
    selectedItem = items.keys.first;
    context.read<HomeCubit>().getProducts(categoryParam: selectedItem);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: DropdownButton<String>(
        elevation: 16,
        underline: Container(),
        isExpanded: true,
        icon: RotatedBox(
            quarterTurns: context.fallbackLocale?.languageCode == 'en' ? 3 : 1,
            child: const Icon(
              Icons.arrow_back_ios_new,
            )),
        iconSize: 20,
        style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 21,
            color: AppColors.textColor),
        value: selectedItem,
        onChanged: (newValue) {
          setState(() {
            if (newValue != selectedItem) {
              context.read<HomeCubit>().products.clear();
              selectedItem = newValue!;
              context.read<HomeCubit>().getProducts(categoryParam: newValue);
            }
            log("get_item_selected:: $newValue");
          });
        },
        items: items.entries.map((key) {
          return DropdownMenuItem<String>(
            value: key.key,
            child: Text(
              key.value,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 21,
                  color: AppColors.textColor),
            ),
          );
        }).toList(),
      ),
    );
  }
}
