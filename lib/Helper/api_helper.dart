import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Model/api_model.dart';

class api_helper {
  api_helper._();

  static api_helper api = api_helper._();

  Future<List<api_model>?> getdata() async {
    var ans = await http.get(
      Uri.parse("https://dummyjson.com/products?limit=1000"),
    );
    if (ans.statusCode == 200) {
      var body = ans.body;
      Map decodedata = jsonDecode(body);
      List products = decodedata['products'];
      List<api_model> data =
          products.map((e) => api_model.js(data: e)).toList();
      return data;
    } else {
      return null;
    }
  }
}
