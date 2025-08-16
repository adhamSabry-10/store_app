import 'package:store_app/Helper/api.dart';
import 'package:store_app/Models/product_model.dart';

class AllProductsService {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data =
        await Api().get(Url: 'https://fakestoreapi.com/products');

    List<ProductModel> ProductsList = [];
    for (int i = 0; i < data.length; i++) {
      ProductsList.add(
        ProductModel.fromJson(data[i]),
      );
    }
    return ProductsList;
  }
}
