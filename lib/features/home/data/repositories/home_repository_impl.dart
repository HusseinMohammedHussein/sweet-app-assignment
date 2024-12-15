import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:sweetsstore/core/error/exception.dart';
import 'package:sweetsstore/core/error/failure.dart';
import 'package:sweetsstore/core/network/dio_consumer.dart';
import 'package:sweetsstore/core/utils/app_strings.dart';
import 'package:sweetsstore/core/utils/network_info.dart';
import 'package:sweetsstore/features/home/data/models/product_model.dart';
import 'package:sweetsstore/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final DioConsumer dioConsumer;
  final NetworkInfoImpl networkInfo;

  HomeRepositoryImpl({required this.networkInfo, required this.dioConsumer});

  @override
  Future<Either<Failure, ProductsModel>> getProducts(
      {String? category,
      String? page,
      String? sortByCriteria,
      String? sortByArrangement}) async {
    final isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        Map<String, dynamic> queries = {
          'category': category,
          'page': page,
          'sort[criteria]': sortByCriteria,
          'sort[arrangement]': sortByArrangement,
        };
        final response = await dioConsumer.get(
            '${AppStrings.products}/${AppStrings.filter}',
            queryParameters: queries);
        log('products_response: $response');
        return Right(ProductsModel.fromJson(response));
      } on ServerException catch (exp) {
        log('ServerException: ${exp.errorModel.errorMessage.toString()}');
        return Left(ServerFailure(exp.toString()));
      }
    } else {
      log(AppStrings.errorNoInternetConnection);
      return const Left(ServerFailure(AppStrings.errorNoInternetConnection));
    }
  }
}
