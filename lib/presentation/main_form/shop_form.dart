import 'package:flutter/material.dart';

import 'product_tile.dart';

class ShopForm extends StatelessWidget {
  const ShopForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var productTiles = <ProductTile>[];
    for (var i = 0; i < 100; ++i) {
      productTiles.add(
        ProductTile(
          title: 'Huawei D14',
          price: 42999,
          imagePath:
              'https://noutbuk-moscow.ru/i_pars/big_first/HUAWEI-MateBook-D-14quot.jpg',
        ),
      );
    }

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: productTiles.length,
      itemBuilder: (context, index) {
        return productTiles[index];
      },
    );
  }
}
