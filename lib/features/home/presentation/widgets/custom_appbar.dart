import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sweetsstore/core/utils/utils_exports.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.all(15),
          child: RotatedBox(
            quarterTurns: isArLang ? 4 : 1,
            child: const Icon(
              Icons.arrow_back_ios,
            ),
          ),
        ),
        Container(
          padding:
              const EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 10),
          decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: Row(
            children: [
              const Icon(
                Icons.person,
                color: AppColors.whiteColor,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'login'.tr(),
                style: const TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        const Spacer(
          flex: 2,
        ),
        Container(
          alignment: AlignmentDirectional.center,
          width: 50,
          height: 50,
          padding: const EdgeInsetsDirectional.all(10),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: const Icon(
            Icons.search,
            size: 20.0,
          ),
        )
      ],
    );
  }
}
