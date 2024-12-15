import 'package:dartz/dartz.dart';
import 'package:sweetsstore/core/error/failure.dart';
import 'package:sweetsstore/features/home/data/models/product_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, ProductsModel>> getProducts({String? category, String? page, String? sortByCriteria, String? sortByArrangement});
}