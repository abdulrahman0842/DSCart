
import 'package:ds_cart/features/food_store/interface/i_food_product_service.dart';

import '../model/food_model.dart';
import '../../../core/const_data.dart';

class MockFoodProductService implements IFoodProductService {
  @override
  Future<List<Food>> getAllFoodItems() async {
    await Future.delayed(Duration(seconds: 3));
    final FoodModel foodModel = FoodModel.fromJson(allFoodSampleData);
    
    return foodModel.foods ?? [];
  }

  @override
    Future<List<Food>> getFoodItemsByCategory(String category)async{
      await Future.delayed(Duration(seconds: 3));
    final FoodModel foodModel = FoodModel.fromJson(allFoodSampleData);
    
    return foodModel.foods ?? [];
    }
  

  @override
  Future<List<Food>> getFoodItemsById(String id)async{
    await Future.delayed(Duration(seconds: 3));
    final FoodModel foodModel = FoodModel.fromJson(allFoodSampleData);
    
    return foodModel.foods ?? [];
  }
}
