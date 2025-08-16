import 'package:store_app/Helper/api.dart';
import 'package:store_app/Models/product_model.dart';

class AddProduct {
  Future<ProductModel> addproducts(
      {required String title,
      required String price,
      required String desc,
      required String image,
      required String category}) async {
    Map<String, dynamic> data =
        // ignore: missing_required_param
        await Api().post(url: 'https://fakestoreapi.com/products', body: {
      'title': title,
      'price': price,
      'description': desc,
      'image': image,
      'category': category
    });
    return ProductModel.fromJson(data);
  }
}
