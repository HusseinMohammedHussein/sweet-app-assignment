import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:sweetsstore/features/home/data/models/product_model.dart';
import 'package:sweetsstore/features/home/data/repositories/home_repository_impl.dart';
import 'package:sweetsstore/features/home/presentation/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.homeRepositoryImpl}) : super(HomeInit());

  final HomeRepositoryImpl homeRepositoryImpl;

  int pageNum = 1;
  String? category;
  List<ProductData> products = [];
  bool hasMoreItems = true;

  Future<void> getProducts(
      {String? categoryParam,
      String? sortByCriteria,
      String? sortByArrangement}) async {
    category = categoryParam;
    pageNum = 1;
    hasMoreItems = true;
    emit(HomeLoadingState());
    log('request_categoryName:: $category');
    final response = await homeRepositoryImpl.getProducts(
        category: category,
        page: '1',
        sortByArrangement: sortByArrangement,
        sortByCriteria: sortByCriteria);
    response
        .fold((left) => emit(HomesErrorState(errorMessage: left.errorMessage)),
            (right) {
      products = right.products!;
      emit(HomeSuccessState(data: right.products!));
    });
  }

  Future<void> loadMoreProducts(
      {String? sortByCriteria, String? sortByArrangement}) async {
    emit(MoreItemsLoadingState());
    log('current_categoryName:: ${products.first.categoryName}');
    pageNum++;
    log('page_number:: $pageNum');
    final response = await homeRepositoryImpl.getProducts(
        category: category,
        page: '$pageNum',
        sortByArrangement: sortByArrangement,
        sortByCriteria: sortByCriteria);
    response
        .fold((left) => emit(MoreItemsErrorState(errorMessage: left.errorMessage)),
            (right) {
      if (right.products!.isNotEmpty) {
        hasMoreItems = true;
        products.addAll(right.products!);
      } else {
        hasMoreItems = false;
        log('Has-More-Items: $hasMoreItems');
      }
      emit(MoreItemsSuccessState());
    });
  }
}
