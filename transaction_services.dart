import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:handy/app/data/models/cart_model.dart';
import 'package:handy/app/data/models/history_model.dart';
import 'package:http/http.dart' as http;
import 'package:handy/app/shared/values.dart';

class TransactionServices {
  Future checkout(List<CartModel> carts, double totalPrice) async {
    final String token = getDataFromStorage('token');

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    var body = jsonEncode({
      'address': 'Morada do cliente',
      'items': carts
          .map((cart) => {
                'id': cart.product!.id,
                'quantity': cart.quantity.value,
              })
          .toList(),
      'status': "A aguardar confirmação do vendedor",
      'total_price': totalPrice,
      'shipping_price': 0,
    });

    var response = await http.post(Uri.parse('$baseUrl/checkout'),
        headers: headers, body: body);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<HistoryModel>> histories() async {
    final token = getDataFromStorage('token');

    try {
      var response =
          await http.get(Uri.parse('$baseUrl/transactions'), headers: {
        'Content-Type': 'application/json',
        'Authorization': token,
      });

      if (response.statusCode == 200) {
        List data = jsonDecode(response.body)['data']['data'];
        List<HistoryModel> history = [];

        for (var item in data) {
          history.add(HistoryModel.fromJson(item));
        }
        return history;
      } else {
        throw Exception('Erro');
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
