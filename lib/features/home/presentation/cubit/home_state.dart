import 'package:sweetsstore/features/home/data/models/product_model.dart';

sealed class HomeState {}

final class HomeInit extends HomeState {}

// Home Items State
final class HomeLoadingState extends HomeState {}

final class HomeSuccessState extends HomeState {
  List<ProductData> data;

  HomeSuccessState({required this.data});
}

final class HomesErrorState extends HomeState {
  String? errorMessage;

  HomesErrorState({this.errorMessage});
}

// Loading More State
final class MoreItemsLoadingState extends HomeState {}

final class MoreItemsSuccessState extends HomeState {}

final class MoreItemsErrorState extends HomeState {
  String? errorMessage;

  MoreItemsErrorState({this.errorMessage});
}
