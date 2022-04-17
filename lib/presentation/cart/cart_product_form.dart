import 'package:flutter/material.dart';

import 'cart_product_tile.dart';

class CartProductForm extends StatelessWidget {
  List<CartProductTile> productTiles;

  CartProductForm({required this.productTiles, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return productTiles[index];
      },
      itemCount: productTiles.length,
    );
  }
}
