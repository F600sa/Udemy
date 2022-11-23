import 'package:http/http.dart' as http;
import 'package:ushop_app/utils/my_string.dart';

import '../model/category_model.dart';
import '../model/product_models.dart';

class CategoryService {
  static Future<List<String>> getCategory() async {
    var response = await http.get(Uri.parse('$baseUrl/products/categories'));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return categoryModelsFromJson(jsonData);
    } else {
      return throw Exception("Failed to load product");
    }
  }
}

class AllCategoryService {
  // ignore: non_constant_identifier_names
  static Future<List<ProductModels>> getAllCategory(String CategoryName) async {
    var response =
        await http.get(Uri.parse('$baseUrl/products/category/$CategoryName'));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return productModelsFromJson(jsonData);
    } else {
      return throw Exception("Failed to load product");
    }
  }
}
