import 'package:ds_cart/features/food_store/model/food_model.dart';

abstract class IFoodProductService {
  Future<List<Food>> getAllFoodItems();
}
