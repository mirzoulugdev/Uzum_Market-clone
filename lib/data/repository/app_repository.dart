import 'package:uzum_market/data/services/product_services.dart';

class AppRepository {
  static Future<List?> getProductByCategoryFromApi(String category) async =>
      await getAllProducts(category);
}
