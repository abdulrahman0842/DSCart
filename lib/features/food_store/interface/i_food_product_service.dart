import 'package:ds_cart/features/food_store/model/food_model.dart';

abstract class IFoodProductService {
  Future<Map<String,dynamic>> getProducts();
  Future<Map<String,dynamic>> getProductByCategory(String category);
  // Future<List<Food>> getFoodItemByName(String name);
  Future<List<Food>> getFoodItemsById(String id);
}
