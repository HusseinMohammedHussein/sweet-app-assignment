import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sweetsstore/core/utils/utils_exports.dart';
import 'package:sweetsstore/features/home/home_feature_export.dart';

class CategoryProductList extends StatefulWidget {
  const CategoryProductList(
      {super.key,
      this.category,
      this.page,
      this.sortByArrangement,
      this.sortByCriteria});

  final String? category;
  final String? page;
  final String? sortByArrangement;
  final String? sortByCriteria;

  @override
  State<CategoryProductList> createState() => _CategoryProductListState();
}

class _CategoryProductListState extends State<CategoryProductList> {
  final _scrollController = ScrollController();
  List<String> productsItems = ['جميع ', 'تورت', 'جاتوه'];
  int selectedIndex = 0;
  bool isLoading = true;
  bool isMoreLoading = false;
  bool isHasMore = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    if (currentScroll >= maxScroll) {
      if (isHasMore) {
        isMoreLoading = true;
        context.read<HomeCubit>().loadMoreProducts();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    log('isHasMOre:: $isHasMore');
    return Column(
      children: [
        buildFilterList(),
        const SizedBox(
          height: 20,
        ),
        BlocConsumer<HomeCubit, HomeState>(
            listener: (ctx, state) {
              if (state is HomeSuccessState) {
                setState(() {
                  isLoading = false;
                });
              }
              if (state is HomeLoadingState) {
                setState(() {
                  isLoading = true;
                });
              }
              if (state is MoreItemsLoadingState) {
                setState(() {
                  isMoreLoading = true;
                });
              }
              if (state is MoreItemsSuccessState) {
                setState(() {
                  isMoreLoading = false;
                  isHasMore = context.read<HomeCubit>().hasMoreItems;
                });
              }
            },
            builder: (ctx, state) => buildProductsList()),
      ],
    );
  }

  Widget buildFilterList() {
    final products = context.read<HomeCubit>().products;
    return SizedBox(
      height: size.height * 0.04,
      width: size.width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: productsItems.length,
          itemBuilder: (ctx, index) => GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Skeletonizer(
                    containersColor: AppColors.whiteColor,
                    enabled: isLoading,
                    child: CustomFilterItemWidget(
                      currentIndex: index,
                      selectedIndex: selectedIndex,
                      categoryName: products.isNotEmpty
                          ? products[0].categoryNameAR!
                          : '',
                    ),),
              )),
    );
  }

  Widget buildProductsList() {
    return SizedBox(
        height: size.height * 0.7,
        width: size.width,
        child: !isLoading
            ? ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.vertical,
                padding: EdgeInsetsDirectional.zero,
                itemCount: context.read<HomeCubit>().products.length,
                itemBuilder: (ctx, index) {
                  final product = context.read<HomeCubit>().products[index];
                  return Skeletonizer(
                    containersColor: AppColors.whiteColor,
                    enabled: isLoading || isMoreLoading,
                    child: Column(
                      children: [
                        CustomProductItemWidget(
                            product: product, isHasMore: isHasMore),
                        context.read<HomeCubit>().products.length - 1 == index
                            ? isHasMore == false
                                ? Container(
                                    alignment: AlignmentDirectional.center,
                                    width: size.width,
                                    height: 20,
                                    child: const Text(
                                      'No more',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                    ),
                                  )
                                : const Offstage()
                            : const Offstage()
                      ],
                    ),
                  );
                })
            : const Center(
                child: CircularProgressIndicator(
                  color: AppColors.secondaryColor,
                ),
              ));
  }
}
