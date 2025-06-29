import 'package:ds_cart/features/food_store/interface/i_food_product_service.dart';

import '../model/food_model.dart';

class MockFoodProductService implements IFoodProductService {
  @override
  Future<List<Food>> getAllFoodItems() async {
    final mockJson = {
      "products": [
        {
          "_id": "685aeb765c633b0bc6fa335a1",
          "name": "cake",
          "category": "food",
          "price": 300,
          "imageURL": "foodImages/1750788982252_pizza.jpg",
          "__v": 0
        },
        {
          "_id": "685aeb765c633b0bc6fa335a2",
          "name": "chocolate",
          "category": "bakery",
          "price": 500,
          "imageURL": "foodImages/1750788982252_pizza.jpg",
          "__v": 0
        }
      ]
    };

    await Future.delayed(Duration(seconds: 3));
    final FoodModel foodModel = FoodModel.fromJson(mockJson);
    return foodModel.foods??[];
  }
}
