import 'package:flutter/material.dart';

import 'cart_product_tile.dart';

class CartProductForm extends StatefulWidget {
  List<CartProductTile> productTiles;

  CartProductForm({required this.productTiles, Key? key}) : super(key: key);

  @override
  State<CartProductForm> createState() => _CartProductFormState();
}

class _CartProductFormState extends State<CartProductForm> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return widget.productTiles[index];
      },
      itemCount: widget.productTiles.length,
    );
  }
}
