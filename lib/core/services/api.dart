import 'dart:convert';

import 'package:e_commerce/core/models/product.dart';
import 'package:e_commerce/helpers/constants.dart';
import 'package:http/http.dart' as http;

class API {
  static const endpoint = URL.ProductList;

  var client = http.Client();

  Future<List<Product>> getProducts() async {
    var products = <Product>[];
    var response = await client.get(endpoint + 'products.json');

    var data = json.decode(response.body) as List<dynamic>;

    for (var product in data) {
      products.add(Product.fromJson(product));
    }

    return products;
  }
}
