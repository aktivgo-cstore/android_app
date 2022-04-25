import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../configuration/assets.dart';
import '../../configuration/providers.dart';
import '../../configuration/shared_prefs_constants.dart';
import '../../configuration/text_constants.dart';
import '../../configuration/text_styles.dart';
import '../../domain/model/product.dart';
import '../../internal/repository_module.dart';
import '../../internal/shared_prefs_module.dart';

class CartProductTile extends ConsumerWidget {
  Product product;

  CartProductTile({
    required this.product,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const defaultImage =
        'http://itsmyday.ru/wp-content/uploads/2016/02/12697058_10154634863806808_5985350271710149919_o.jpg';

    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                child: product.image.isEmpty
                    ? Image.network(defaultImage)
                    : (product.image.endsWith(".svg")
                        ? SvgPicture.network(product.image)
                        : Image.network(product.image)),
                height: 100,
                width: 100,
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title.length > 22
                        ? product.title.substring(0, 22) + '...'
                        : product.title,
                    style: TextStyles.cartProductTileTitleTextStyle,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    TextConstants.rub + ' ' + product.price.toString(),
                    style: TextStyles.cartProductTilePriceTextStyle,
                  ),
                ],
              ),
            ],
          ),
          IconButton(
            onPressed: () async {
              await RepositoryModule.cartRepository().deleteProduct(
                userId: SharedPrefsModule.sharedPrefs()
                    .getInt(SharedPrefsConstants.id)!,
                productId: product.id,
                token: SharedPrefsModule.sharedPrefs()
                    .getString(SharedPrefsConstants.token)!,
              );

              var updateCart =
                  ref.watch(AppProviders.updateCartProvider.state).state;

              ref.read(AppProviders.updateCartProvider.state).state =
                  !updateCart;
            },
            icon: Assets.deleteImage,
          )
        ],
      ),
    );
  }
}
