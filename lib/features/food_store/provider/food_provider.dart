import 'dart:developer';

import 'package:ds_cart/features/food_store/interface/i_food_product_service.dart';
import 'package:ds_cart/features/food_store/model/food_model.dart';
import 'package:flutter/material.dart';

class FoodProvider with ChangeNotifier {
  final IFoodProductService _foodProductService;

  FoodProvider(this._foodProductService);

  List<Food> _foods = [];
  List<Food> get foods => _foods;
  List<Food> _filteredFoods = [];
  List<Food> get filteredFoods => _filteredFoods;
  String? _message;
  String? get message => _message;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // Fetch all food items
  Future<void> getProducts() async {
    _isLoading = true;
    _message = null;
    notifyListeners();

    final response = await _foodProductService.getProducts();
    log(response["message"]);

    if (response["status"] == "success") {
      final data = FoodModel.fromJson(response["data"]);
      _foods = data.foods ?? [];
      _isLoading = false;
      notifyListeners();
    } else {
      _message = response["message"];
      _isLoading = false;
      notifyListeners();
    }
  }

  // Fetch food items by category
  Future<void> getFoodByCategory(String category) async {
    _isLoading = true;
    _filteredFoods.clear();
    notifyListeners();

    final response = await _foodProductService.getProductByCategory(category);
    if (response["status"] == "success") {
      final data = FoodModel.fromJson(response["data"]);
      _filteredFoods = data.foods ?? [];
    } else {
      _message = response["message"];
    }
    _isLoading = false;
    notifyListeners();
  }

  void clearCategoryFoodList() {
    _filteredFoods.clear();
    notifyListeners();
  }

  // Fetch food items by id
  Future<void> getFoodById(String id) async {
    _filteredFoods.clear();
    _isLoading = true;
    notifyListeners();

    _filteredFoods = await _foodProductService.getFoodItemsById(id);
    _isLoading = false;
    notifyListeners();
  }
}
