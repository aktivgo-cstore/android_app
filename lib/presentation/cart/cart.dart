import 'package:flutter/material.dart';

import '../../configuration/app_routes.dart';
import '../../configuration/text_constants.dart';
import '../../configuration/text_styles.dart';
import 'cart_product_form.dart';
import 'cart_product_tile.dart';
import 'top_cart.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var productTiles = <CartProductTile>[];
    for (var i = 0; i < 100; ++i) {
      productTiles.add(
        CartProductTile(
          title: 'Huawei D14',
          price: 42999,
          imagePath:
              'https://noutbuk-moscow.ru/i_pars/big_first/HUAWEI-MateBook-D-14quot.jpg',
        ),
      );
    }

    int sum = 0;
    for (int i = 0; i < productTiles.length; ++i) {
      sum += productTiles[i].count * productTiles[i].price;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 44),
            child: TopCart(),
          ),
          Expanded(
            child: CartProductForm(
              productTiles: productTiles,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 40, right: 40),
            height: 27,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  TextConstants.total,
                  style: TextStyles.cartTotalTextStyle,
                ),
                Text(
                  TextConstants.rub + ' ' + sum.toString(),
                  style: TextStyles.cartSumTextStyle,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            child: Container(
              margin: const EdgeInsets.only(bottom: 30),
              height: 60,
              width: 335,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(
                    context,
                    AppRoutes.shopScreen,
                  );
                },
                child: Text(
                  TextConstants.checkOut,
                  style: TextStyles.saveTextStyle,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
