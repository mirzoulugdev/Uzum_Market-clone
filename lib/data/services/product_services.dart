import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:uzum_market/data/models/product_model.dart';

Future<List?> getAllProducts(String category) async {
  Uri url = Uri.parse("https://fakestoreapi.com/products/category/$category");
  var response = await http.get(url);

  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    return jsonResponse.map((e) => Product.fromJson(e)).toList();
  }
  return null;
}
