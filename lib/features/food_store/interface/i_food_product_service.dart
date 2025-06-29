import 'package:ds_cart/features/food_store/model/food_model.dart';

abstract class IFoodProductService {
  Future<List<Food>> getAllFoodItems();
  Future<List<Food>> getFoodItemsByCategory(String category);
  // Future<List<Food>> getFoodItemByName(String name);
  Future<List<Food>> getFoodItemsById(String id);
}
