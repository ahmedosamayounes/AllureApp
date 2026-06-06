// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  final String? image;
  final String? product_name;
  final int? product_price;
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? imageUrl;
  ProductModel({
    this.image,
    this.product_name,
    this.product_price,
    this.imageUrl,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
