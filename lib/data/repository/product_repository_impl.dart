import '../../domain/model/product.dart';
import '../../domain/repository/product_repository.dart';
import '../api/api_util.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ApiUtil apiUtil;

  ProductRepositoryImpl(this.apiUtil);

  @override
  Future<List<Product>> getProducts({required String token}) {
    return apiUtil.getProducts(token: token);
  }
}
