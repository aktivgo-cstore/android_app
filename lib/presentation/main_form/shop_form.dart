import 'package:flutter/material.dart';

import '../../configuration/colors.dart';
import '../../configuration/shared_prefs_constants.dart';
import '../../domain/model/product.dart';
import '../../internal/repository_module.dart';
import '../../internal/shared_prefs_module.dart';
import 'product_tile.dart';

class ShopForm extends StatelessWidget {
  const ShopForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: RepositoryModule.productRepository().getProducts(
        token: SharedPrefsModule.sharedPrefs()
            .getString(SharedPrefsConstants.token)!,
      ),
      builder: (context, AsyncSnapshot<List<Product>> snapshot) {
        if (snapshot.hasData) {
          var products = snapshot.data!;

          var productTiles = <ProductTile>[];
          for (final product in products) {
            productTiles.add(
              ProductTile(product: product),
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
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(
                color: AppColors.helloColor,
              ),
            ],
          );
        }
      },
    );
  }
}
