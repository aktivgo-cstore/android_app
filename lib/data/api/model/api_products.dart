import 'api_product.dart';

class ApiProducts {
  final items = <ApiProduct>[];

  ApiProducts.fromApi(List<dynamic> list) {
    for (final dynamic item in list) {
      Map<String, dynamic> map = item;
      var apiProduct = ApiProduct.fromApi(map);
      items.add(apiProduct);
    }
  }
}
