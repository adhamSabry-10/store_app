import 'package:flutter/material.dart';
import 'package:store_app/Models/product_model.dart';
import 'package:store_app/Services/update_product.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage({super.key});
  static String id = 'update product';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, desc, image, price;
  bool isLoading = false;

  late TextEditingController nameController;
  late TextEditingController descController;
  late TextEditingController priceController;
  late TextEditingController imageController;

  late ProductModel product;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    product = ModalRoute.of(context)!.settings.arguments as ProductModel;

    nameController = TextEditingController(text: product.title);
    descController = TextEditingController(text: product.description);
    priceController = TextEditingController(text: product.price.toString());
    imageController = TextEditingController(text: product.image);
  }

  @override
  void dispose() {
    nameController.dispose();
    descController.dispose();
    priceController.dispose();
    imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Update Product',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 100),
                CustomTextField(
                  controller: nameController,
                  onChanged: (data) => productName = data,
                  hintText: 'Product Name',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: descController,
                  onChanged: (data) => desc = data,
                  hintText: 'Description',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: priceController,
                  inputType: TextInputType.number,
                  onChanged: (data) => price = data,
                  hintText: 'Price',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: imageController,
                  onChanged: (data) => image = data,
                  hintText: 'Image URL',
                ),
                const SizedBox(height: 50),
                CustomeButton(
                  text: 'Update',
                  onTap: () async {
                    await updateProduct();
                    print('Success');
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct() async {
    setState(() {
      isLoading = true;
    });

    try {
      await UpdateProductServices().updateproducts(
        id: product.id,
        title: productName ?? product.title,
        price: price != null ? double.parse(price!) : product.price,
        description: desc ?? product.description,
        image: image ?? product.image,
        category: product.category,

      );

    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Product updated successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }

    setState(() {
      isLoading = false;
    });
  }
}
