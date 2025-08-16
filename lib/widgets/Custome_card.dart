import 'package:flutter/material.dart';
import 'package:store_app/Models/product_model.dart';
import 'package:store_app/screens/update_product.dart';

class CustomeCard extends StatelessWidget {
  const CustomeCard({super.key, required this.Product});
  final ProductModel Product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.popAndPushNamed(
          context,
          UpdateProductPage.id,
          arguments: Product,
        );
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(.2),
                  blurRadius: 40,
                  spreadRadius: 0,
                  offset: const Offset(10, 10),
                )
              ],
            ),
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 60),
                    Flexible(
                      child: Text(
                        Product.title.toString(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$' '${Product.price.toString()}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            top: -40,
            right: 16,
            child: Image.network(
              Product.image,
              height: 80,
              width: 80,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}