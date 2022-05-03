import 'api_product.dart';

class ApiCart {
  final int id;
  final int userId;
  final items = <ApiProduct>[];

  ApiCart.fromApi(Map<String, dynamic> map)
      : id = map['id'],
        userId = map['user_id'] {
    List<dynamic> list = map['items'];
    for (final dynamic item in list) {
      items.add(ApiProduct.fromApi(item));
    }
  }
}
