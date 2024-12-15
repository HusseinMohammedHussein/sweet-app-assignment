// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsModel _$ProductsModelFromJson(Map<String, dynamic> json) =>
    ProductsModel(
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => ProductData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductsModelToJson(ProductsModel instance) =>
    <String, dynamic>{
      'products': instance.products,
    };

ProductData _$ProductDataFromJson(Map<String, dynamic> json) => ProductData(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      nameAR: json['ar_name'] as String?,
      categorySlug: json['category_slug'] as String?,
      categoryName: json['category_name'] as String?,
      categoryNameAR: json['category_name_ar'] as String?,
      price: json['price'] as String?,
      mainIMG: json['main_img'] == null
          ? null
          : ImageData.fromJson(json['main_img'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductDataToJson(ProductData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'ar_name': instance.nameAR,
      'category_slug': instance.categorySlug,
      'category_name': instance.categoryName,
      'category_name_ar': instance.categoryNameAR,
      'price': instance.price,
      'main_img': instance.mainIMG,
    };

ImageData _$ImageDataFromJson(Map<String, dynamic> json) => ImageData(
      src: json['src'] as String?,
    );

Map<String, dynamic> _$ImageDataToJson(ImageData instance) => <String, dynamic>{
      'src': instance.src,
    };
