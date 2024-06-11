import 'package:flutter/material.dart';
import 'package:secondsouffleapp/ui/widgets/base_page.dart';
import 'package:secondsouffleapp/ui/widgets/product_item.dart';

class ProductsPage extends BasePage {
  const ProductsPage({super.key}) : super(selectedIndex: 1);

  @override
  // ignore: library_private_types_in_public_api
  _ProductsPageState createState() => _ProductsPageState();

  @override
  Widget buildPage(BuildContext context) {
    return const ProductsContent();
  }
}

class _ProductsPageState extends BasePageState<ProductsPage> {}

class ProductsContent extends StatefulWidget {
  const ProductsContent({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProductsContentState createState() => _ProductsContentState();
}

class _ProductsContentState extends State<ProductsContent> {
  List<int> quantities = List.filled(5, 1);

  void addQuantity(int index) {
    setState(() {
      quantities[index]++;
    });
  }

  void removeQuantity(int index) {
    setState(() {
      if (quantities[index] > 1) quantities[index]--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Produits')),
      body: ListView.builder(
        itemCount: 5, // Number of products
        itemBuilder: (context, index) {
          return ProductItem(
            name: 'Tissus',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            quantity: quantities[index],
            onAdd: () => addQuantity(index),
            onRemove: () => removeQuantity(index),
          );
        },
      ),
    );
  }
}
