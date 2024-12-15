import 'package:flutter/material.dart';
import 'package:sweetsstore/core/routes/app_routes.dart';
import 'package:sweetsstore/core/utils/app_colors.dart';
import 'package:sweetsstore/features/home/home_feature_export.dart';
import 'package:sweetsstore/features/home/presentation/widgets/custom_appbar.dart';

class SweetsScreen extends StatefulWidget {
  const SweetsScreen({super.key});

  @override
  State<SweetsScreen> createState() => _SweetsScreenState();
}

class _SweetsScreenState extends State<SweetsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsetsDirectional.symmetric(horizontal: size.width * 0.03),
        child: Container(
          margin: EdgeInsetsDirectional.only(top: size.height * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // AppBar
              const CustomAppbar(),
              SizedBox(
                height: size.height * 0.02,
              ),
              const Divider(
                color: AppColors.secondaryColor,
              ),
              SizedBox(
                height: size.height * 0.05,
                width: size.width * 0.5,
                child: const CustomDropdown(),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              const CategoryProductList(),
            ],
          ),
        ),
      ),
    );
  }
}
