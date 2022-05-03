import '../model/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts({required String token});
}
