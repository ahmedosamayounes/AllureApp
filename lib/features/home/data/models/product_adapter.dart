import 'package:flutter_application/features/home/data/models/product_model.dart';
import 'package:hive/hive.dart';

class ProductModelAdapter extends TypeAdapter<ProductModel> {
  @override
  final int typeId = 0; 

  @override
  ProductModel read(BinaryReader reader) {
    return ProductModel(
      image: reader.read() as String?,         
      product_name: reader.read() as String?, 
      product_price: reader.read() as int?,    
      imageUrl: reader.read() as String?,      
    );
  }

  @override
  void write(BinaryWriter writer, ProductModel obj) {
    writer.write(obj.image);
    writer.write(obj.product_name);
    writer.write(obj.product_price);
    writer.write(obj.imageUrl);
  }
}