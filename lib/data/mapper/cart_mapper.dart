import '../../domain/model/cart.dart';
import '../../domain/model/product.dart';
import '../api/model/api_cart.dart';
import 'product_mapper.dart';

class CartMapper {
  static Cart fromApi(ApiCart apiCart) {
    var items = <Product>{};
    for (final apiProduct in apiCart.items) {
      items.add(ProductMapper.fromApi(apiProduct));
    }
    return Cart(items: items);
  }
}
