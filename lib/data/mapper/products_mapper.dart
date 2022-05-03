import '../../domain/model/product.dart';
import '../api/model/api_products.dart';
import 'product_mapper.dart';

class ProductsMapper {
  static List<Product> fromApi(ApiProducts apiProducts) {
    final products = <Product>[];
    for (final apiProduct in apiProducts.items) {
      products.add(ProductMapper.fromApi(apiProduct));
    }
    return products;
  }
}
