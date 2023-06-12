import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:handy/app/data/models/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:handy/app/shared/values.dart';

class ProductServices {
  Future<List<ProductModel>> getProducts() async {
    try {
      var response = await http.get(
        Uri.parse('https://api.npoint.io/20475583497e6586a401'),
        headers: headerContent,
      );

      if (response.statusCode == 200) {
        List data = jsonDecode(response.body)['data']['data'];
        List<ProductModel> products = [];

        for (var item in data) {
          products.add(ProductModel.fromJson(item));
        }
        return products;
      } else {
        throw Exception('Erro ao obter produtos');
      }
    } catch (e) {
      rethrow;
    }
  }

  getDataFromStorage(String key) {
    final box = GetStorage();
    return box.read(key);
  }
}
