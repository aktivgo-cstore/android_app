import 'package:flutter/material.dart';

import '../../configuration/assets.dart';
import '../../configuration/colors.dart';
import '../../configuration/text_styles.dart';

class ProductTile extends StatefulWidget {
  String title, imagePath;
  int price;

  ProductTile({
    required this.title,
    required this.price,
    required this.imagePath,
    Key? key,
  }) : super(key: key);

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
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
                      child: Image.network(widget.imagePath),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 1,
                  right: 15,
                  child: IconButton(
                    onPressed: () {},
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
                widget.title,
                style: TextStyles.productTitleTextStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                '₽ ' + widget.price.toString(),
                style: TextStyles.productPriceTextStyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}
