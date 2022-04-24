import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/api_products.dart';

class ProductService {
  static const _BASE_URL = 'https://fd3f-92-255-218-125.eu.ngrok.io';

  Future<ApiProducts> getProducts({required String token}) async {
    var url = Uri.parse(_BASE_URL + '/products');
    final response = await http.get(
      url,
      headers: {'Content-Type': 'application/json', 'token': token},
    );
    return ApiProducts.fromApi(json.decode(utf8.decode(response.bodyBytes)));
  }
}
