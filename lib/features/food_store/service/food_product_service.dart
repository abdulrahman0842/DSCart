import 'dart:convert';
import 'dart:developer';
import 'package:ds_cart/features/food_store/interface/i_food_product_service.dart';
import 'package:ds_cart/features/food_store/model/food_model.dart';
import 'package:http/http.dart' as http;
import '../../../core/api_constants.dart';

class FoodProductService implements IFoodProductService {
  @override
  Future<List<Food>> getAllFoodItems() async {
    log("getAllFoodItems() Called.");
    try {
      final response = await http.get(Uri.parse(ApiConstants.getAllFoodItems));
      if (response.statusCode == 200) {
        log("getAllFoodItems() response: ${response.body}");
        final data = jsonDecode(response.body);
        final FoodModel foodModel = FoodModel.fromJson(data);
        return foodModel.foods ?? [];
      }
      return [];
    } catch (e) {
      log('Exception at getAllFoodItems() : ${e.toString()}');
      return [];
    }
  }

  @override
  Future<List<Food>> getFoodItemsByCategory(String category) async {
    log("getFoodItemsByCategory() Called.");
    try {
      final response = await http
          .get(Uri.parse("${ApiConstants.getFoodItemsByCategory}/$category"));
      if (response.statusCode == 200) {
        log("getFoodItemsByCategory() response: ${response.body}");
        final data = jsonDecode(response.body);
        final FoodModel foodModel = FoodModel.fromJson(data);
        return foodModel.foods ?? [];
      }
      return [];
    } catch (e) {
      log('Exception at getFoodItemsByCategory() : ${e.toString()}');
      return [];
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
