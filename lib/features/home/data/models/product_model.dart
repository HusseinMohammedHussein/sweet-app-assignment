import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductsModel {
  List<ProductData>? products;

  ProductsModel({this.products});

  factory ProductsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsModelFromJson(json);
}

@JsonSerializable()
class ProductData {
  int? id;
  String? name;
  @JsonKey(name: 'ar_name')
  String? nameAR;
  @JsonKey(name: 'category_slug')
  String? categorySlug;
  @JsonKey(name: 'category_name')
  String? categoryName;
  @JsonKey(name: 'category_name_ar')
  String? categoryNameAR;
  String? price;
  @JsonKey(name: 'main_img')
  ImageData? mainIMG;

  ProductData(
      {this.id,
      this.name,
      this.nameAR,
      this.categorySlug,
      this.categoryName,
      this.categoryNameAR,
      this.price,
      this.mainIMG});

  factory ProductData.fromJson(Map<String, dynamic> json) =>
      _$ProductDataFromJson(json);
}

@JsonSerializable()
class ImageData {
  String? src;

  ImageData({this.src});

  factory ImageData.fromJson(Map<String, dynamic> json) =>
      _$ImageDataFromJson(json);
}
