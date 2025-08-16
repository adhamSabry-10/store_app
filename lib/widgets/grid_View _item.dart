import 'package:flutter/material.dart';
import 'package:store_app/Models/product_model.dart';
import 'package:store_app/Services/get_all%20products_services.dart';
import 'package:store_app/widgets/Custome_card.dart';


class GridViewItem extends StatelessWidget {
  const GridViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 50),
      child: FutureBuilder<List<ProductModel>>(
        future: AllProductsService().getAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No products found'));
          }

          List<ProductModel> products = snapshot.data!;

          return GridView.builder(
            itemCount: products.length,
            clipBehavior: Clip.none,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.5,
              crossAxisSpacing: 10,
              mainAxisSpacing: 100,
            ),
            itemBuilder: (context, index) {
              return CustomeCard(Product: products[index]);
            },
          );
        },
      ),
    );
  }
}
