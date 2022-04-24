import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/api_cart.dart';
import '../request/cart_body.dart';

class CartService {
  static const _BASE_URL = 'https://255f-92-255-218-125.eu.ngrok.io';

  Future<ApiCart> getCart({required int userId, required String token}) async {
    var url = Uri.parse(_BASE_URL + '/carts/' + userId.toString());
    final response = await http.get(
      url,
      headers: {'Content-Type': 'application/json', 'token': token},
    );
    return ApiCart.fromApi(json.decode(utf8.decode(response.bodyBytes)));
  }

  Future<void> addProduct({
    required int userId,
    required CartBody cartBody,
    required String token,
  }) async {
    var url = Uri.parse(_BASE_URL + '/carts/' + userId.toString());
    await http.post(
      url,
      body: json.encode(cartBody.toApi()),
      headers: {'Content-Type': 'application/json', 'token': token},
    );
  }

  Future<void> deleteProduct({
    required int userId,
    required CartBody cartBody,
    required String token,
  }) async {
    var url = Uri.parse(_BASE_URL + '/carts/' + userId.toString() + '/delete');
    await http.post(
      url,
      body: json.encode(cartBody.toApi()),
      headers: {'Content-Type': 'application/json', 'token': token},
    );
  }
}
