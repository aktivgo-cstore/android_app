import '../../domain/model/product.dart';
import '../api/model/api_product.dart';

class ProductMapper {
  static Product fromApi(ApiProduct apiProduct) {
    return Product(
      id: apiProduct.id,
      title: apiProduct.title,
      description: apiProduct.description,
      price: apiProduct.price,
      image: apiProduct.image,
    );
  }
}
