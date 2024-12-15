import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sweetsstore/core/utils/utils_exports.dart';
import 'package:sweetsstore/features/home/home_feature_export.dart';

class CustomProductItemWidget extends StatelessWidget {
  const CustomProductItemWidget(
      {super.key, required this.product, required this.isHasMore});

  final ProductData product;
  final bool isHasMore;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.2,
                width: size.width * 0.4,
                child: Stack(
                  children: [
                    ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        child: FadeInImage.assetNetwork(
                            placeholder: AppAssets.imagesImagePlaceholder,
                            image: '${product.mainIMG?.src}')),
                    PositionedDirectional(
                        start: 10,
                        top: 10,
                        child: Container(
                          padding: const EdgeInsetsDirectional.all(5),
                          decoration: const BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: const Icon(
                            Icons.favorite_border,
                            size: 20,
                          ),
                        ))
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                padding: EdgeInsetsDirectional.only(top: size.height * 0.01),
                margin: const EdgeInsetsDirectional.only(start: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      '${isArLang ? product.nameAR : product.name}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      children: [
                        AutoSizeText(
                          '250',
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        AutoSizeText(
                          'جم',
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons.groups,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        AutoSizeText(
                          '7-8',
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        AutoSizeText(
                          'افراد',
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        )
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Row(
                      children: [
                        AutoSizeText(
                          '${product.price}',
                          style: const TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const AutoSizeText(
                          'EGP',
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          alignment: AlignmentDirectional.center,
                          padding: const EdgeInsetsDirectional.symmetric(
                              horizontal: 5, vertical: 2),
                          decoration: const BoxDecoration(
                              color: AppColors.lightGreenColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                applyTextScaling: true,
                                Icons.star,
                                color: AppColors.greenColor,
                                size: 12,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              RichText(
                                text: const TextSpan(
                                  text: '50',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.greenColor),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: ' نقطة',
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.greenColor),
                                    ),
                                  ],
                                ),
                                softWrap: true,
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ))
            ],
          ),
        ],
      ),
    );
  }
}
