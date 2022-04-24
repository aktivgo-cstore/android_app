import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../configuration/assets.dart';
import '../../configuration/colors.dart';
import '../../configuration/shared_prefs_constants.dart';
import '../../configuration/text_styles.dart';
import '../../domain/model/product.dart';
import '../../internal/repository_module.dart';
import '../../internal/shared_prefs_module.dart';

class ProductTile extends StatefulWidget {
  Product product;

  ProductTile({
    required this.product,
    Key? key,
  }) : super(key: key);

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  final defaultImage =
      'http://itsmyday.ru/wp-content/uploads/2016/02/12697058_10154634863806808_5985350271710149919_o.jpg';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 253,
      width: 157,
      child: Card(
        color: AppColors.backgroundColor,
        elevation: 0,
        margin: const EdgeInsets.symmetric(
          vertical: 7.5,
          horizontal: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: 140,
                    width: 157,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: widget.product.image.isEmpty
                          ? Image.network(defaultImage)
                          : (widget.product.image.endsWith(".svg")
                              ? SvgPicture.network(widget.product.image)
                              : Image.network(widget.product.image)),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 1,
                  right: 15,
                  child: IconButton(
                    onPressed: () {
                      RepositoryModule.cartRepository().addProduct(
                        userId: SharedPrefsModule.sharedPrefs()
                            .getInt(SharedPrefsConstants.id)!,
                        productId: widget.product.id,
                        token: SharedPrefsModule.sharedPrefs()
                            .getString(SharedPrefsConstants.token)!,
                      );
                    },
                    icon: Assets.cartButtonInProductImage,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                widget.product.title.length > 19
                    ? widget.product.title.substring(0, 16) + "..."
                    : widget.product.title,
                style: TextStyles.productTitleTextStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                '₽ ' + widget.product.price.toString(),
                style: TextStyles.productPriceTextStyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}
