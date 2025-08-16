import 'package:flutter/material.dart';
import 'package:store_app/widgets/grid_View%20_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ))
        ],
        title: const Center(
            child: Text(
          'New Trend',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        )),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: const GridViewItem()

    );
  }
}
