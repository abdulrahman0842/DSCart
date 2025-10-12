import 'package:ds_cart/features/food_store/interface/i_food_product_service.dart';

import '../model/food_model.dart';
import '../../../core/const_data.dart';
import 'dart:developer';

class MockFoodProductService implements IFoodProductService {
  @override
  Future<Map<String, dynamic>> getProducts() async {
    await Future.delayed(Duration(seconds: 2));
    return {
      "status": "success",
      "data": allFoodSampleData,
      "message": "Products found"
    };
  }

  @override
  Future<Map<String, dynamic>> getProductByCategory(String category) async {
    await Future.delayed(Duration(seconds: 2));
    return {
      "status": "success",
      "data": allFoodSampleData,
      "message": "Products found"
    };
  }

  @override
  Future<List<Food>> getFoodItemsById(String id) async {
    await Future.delayed(Duration(seconds: 3));
    log("getFoodItemsById() Called.");
    final FoodModel foodModel = FoodModel.fromJson(allFoodSampleData);

    return foodModel.foods ?? [];
  }
}
