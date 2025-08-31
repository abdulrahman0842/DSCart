import 'package:ds_cart/features/food_store/interface/i_food_product_service.dart';

import '../model/food_model.dart';
import '../../../core/const_data.dart';
import 'dart:developer';

class MockFoodProductService implements IFoodProductService {
  @override
  Future<List<Food>> getAllFoodItems() async {
    await Future.delayed(Duration(seconds: 3));
    log("getAllFoodItems() Called.");
    final FoodModel foodModel = FoodModel.fromJson(allFoodSampleData);

    return foodModel.foods ?? [];
  }

  @override
  Future<List<Food>> getFoodItemsByCategory(String category) async {
    await Future.delayed(Duration(seconds: 3));
    final FoodModel foodList = FoodModel.fromJson(allFoodSampleData);
    List<Food> foodItems = foodList.foods != null
        ? foodList.foods!.where((item) {
            return item.category.toLowerCase() == category.toLowerCase();
          }).toList()
        : [];
    return foodItems;
  }

  @override
  Future<List<Food>> getFoodItemsById(String id) async {
    await Future.delayed(Duration(seconds: 3));
    log("getFoodItemsById() Called.");
    final FoodModel foodModel = FoodModel.fromJson(allFoodSampleData);

    return foodModel.foods ?? [];
  }
}
