import 'package:flutter/material.dart';

import '../../configuration/assets.dart';
import '../../configuration/colors.dart';
import '../../configuration/text_constants.dart';
import '../../configuration/text_styles.dart';

class CartProductTile extends StatefulWidget {
  String title, imagePath;
  int price;

  CartProductTile({
    required this.imagePath,
    required this.title,
    required this.price,
    Key? key,
  }) : super(key: key);

  @override
  State<CartProductTile> createState() => _CartProductTileState();
}

class _CartProductTileState extends State<CartProductTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                child: Image.network(widget.imagePath),
                height: 100,
                width: 100,
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyles.cartProductTileTitleTextStyle,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    TextConstants.rub + ' ' + widget.price.toString(),
                    style: TextStyles.cartProductTilePriceTextStyle,
                  ),
                ],
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: Assets.deleteImage,
          )
        ],
      ),
    );
  }
}
