import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../configuration/app_routes.dart';
import '../../configuration/colors.dart';
import '../../configuration/providers.dart';
import '../../configuration/shared_prefs_constants.dart';
import '../../configuration/text_constants.dart';
import '../../configuration/text_styles.dart';
import '../../domain/model/cart.dart';
import '../../internal/repository_module.dart';
import '../../internal/shared_prefs_module.dart';
import 'cart_product_form.dart';
import 'cart_product_tile.dart';
import 'top_cart.dart';

class CartWidget extends ConsumerWidget {
  const CartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(AppProviders.updateCartProvider.state).state;
    return FutureBuilder(
      future: RepositoryModule.cartRepository().getCart(
        userId: SharedPrefsModule.sharedPrefs().getInt(
          SharedPrefsConstants.id,
        )!,
        token: SharedPrefsModule.sharedPrefs().getString(
          SharedPrefsConstants.token,
        )!,
      ),
      builder: (context, AsyncSnapshot<Cart> snapshot) {
        if (snapshot.hasData) {
          var products = snapshot.data!;

          var sum = 0;
          var productTiles = <CartProductTile>[];
          for (final product in products.items) {
            sum += product.price;
            productTiles.add(
              CartProductTile(
                product: product,
              ),
            );
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
                      onPressed: () async {
                        for (final product in products.items) {
                          await RepositoryModule.cartRepository().deleteProduct(
                            userId: SharedPrefsModule.sharedPrefs()
                                .getInt(SharedPrefsConstants.id)!,
                            productId: product.id,
                            token: SharedPrefsModule.sharedPrefs()
                                .getString(SharedPrefsConstants.token)!,
                          );
                        }

                        var updateCart = ref
                            .watch(AppProviders.updateCartProvider.state)
                            .state;

                        ref.read(AppProviders.updateCartProvider.state).state =
                            !updateCart;

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
        } else {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 44),
                  child: TopCart(),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(
                        color: AppColors.helloColor,
                      ),
                    ],
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
                        TextConstants.rub + '0',
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
                      onPressed: () {},
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
      },
    );
  }
}
