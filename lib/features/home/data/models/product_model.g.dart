// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
  image: json['image'] as String?,
  product_name: json['product_name'] as String?,
  product_price: (json['product_price'] as num?)?.toInt(),
);

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'image': instance.image,
      'product_name': instance.product_name,
      'product_price': instance.product_price,
    };
