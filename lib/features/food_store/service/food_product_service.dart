import 'dart:convert';
import 'dart:developer';
import 'package:ds_cart/features/food_store/interface/i_food_product_service.dart';
import 'package:ds_cart/features/food_store/model/food_model.dart';
import 'package:http/http.dart' as http;
import '../../../core/api_constants.dart';

class FoodProductService implements IFoodProductService {
  @override
  Future<Map<String, dynamic>> getProducts() async {
    final body = {"search": "food", "page": 1, "limit": 25};

    try {
      final response = await http.post(Uri.parse(ApiConstants.getProducts),
          body: jsonEncode(body),
          headers: {"Content-Type": "application/json"});

      final decodedJson = jsonDecode(response.body);
      return decodedJson;
    } catch (e) {
      throw Exception("Failed to Load Data! $e");
    }
  }

  @override
  Future<Map<String, dynamic>> getProductByCategory(String category) async {
    final body = {"search": category, "page": 1, "limit": 25};

    try {
      final response = await http.post(Uri.parse(ApiConstants.getProducts),
          body: jsonEncode(body),
          headers: {"Content-Type": "application/json"});
      final decodedJson = jsonDecode(response.body);
      return decodedJson;
    } catch (e) {
      throw Exception("Failed: $e");
    }
  }

  @override
  Future<List<Food>> getFoodItemsById(String id) async {
    log("getFoodItemsById() Called.");
    try {
      final response =
          await http.get(Uri.parse("${ApiConstants.getFoodItemsById}/$id"));
      if (response.statusCode == 200) {
        log("getFoodItemsById() response: ${response.body}");
        final data = jsonDecode(response.body);
        final FoodModel foodModel = FoodModel.fromJson(data);
        return foodModel.foods ?? [];
      }
      return [];
    } catch (e) {
      log('Exception at getFoodItemsById() : ${e.toString()}');
      return [];
    }
  }
}
