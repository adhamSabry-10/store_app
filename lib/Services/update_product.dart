import 'package:store_app/Helper/api.dart';
import 'package:store_app/Models/product_model.dart';

class UpdateProductServices {
  Future<ProductModel> updateproducts({
    required int id,
    required String title,
    required double price,
    required String description,
    required String image,
    required String category,

  })

  async {
    print('product id  = $id');
    Map<String, dynamic> data = await Api().put(
      url: 'https://fakestoreapi.com/products/$id',
      body: {
        'title': title,
        'price': price.toString(),
        'description': description,
        'image': image,
        'category': category,
      },
    );
    return ProductModel.fromJson(data);
  }
}