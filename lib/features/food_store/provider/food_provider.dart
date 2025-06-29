import 'package:ds_cart/features/food_store/interface/i_food_product_service.dart';
import 'package:ds_cart/features/food_store/model/food_model.dart';
import 'package:flutter/material.dart';

class FoodProvider with ChangeNotifier {
  final IFoodProductService _foodProductService;

  FoodProvider(this._foodProductService);

  List<Food> foods = [];
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getAllFoods() async {
    _isLoading = true;
    notifyListeners();

    foods = await _foodProductService.getAllFoodItems();

    _isLoading = false;
    notifyListeners();
  }
}
