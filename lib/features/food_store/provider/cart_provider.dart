import 'dart:developer';

import 'package:flutter/material.dart';

import '../model/food_model.dart';
import '../service/local_storage/cart_storage.dart';

class CartProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Food> _cartItems = [];
  List<Food> get cartItems => _cartItems;

  double _cartTotal = 0;
  double get cartTotal => _cartTotal;

  final _cartStorage = CartStorage();

  Future<void> addToCart(BuildContext context, Food foodItem) async {
    _isLoading = true;
    notifyListeners();
    try {
      await _cartStorage.addToCart(foodItem);
      _cartItems = _cartStorage.getCartItems();
      _isLoading = false;
      notifyListeners();

      _cartTotal += foodItem.price;
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("${foodItem.name} Added to Cart")));
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      log('Error in Adding to Cart: $e');
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Unable to Add item in Cart")));
    }
  }

  void removeFromCart(BuildContext context, String id, double price) {
    _isLoading = true;
    notifyListeners();

    try {
      _cartStorage.removeFromCart(id);
      _cartItems = _cartStorage.getCartItems();
      _isLoading = false;
      notifyListeners();

      _cartTotal -= price;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Removed from Cart")));
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      log("Error Fetching Cart Items: $e");
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Unable to Fetch Cart items!")));
    }
  }

  void getCartItems(BuildContext context) {
    _isLoading = true;
    notifyListeners();

    try {
      _cartItems = _cartStorage.getCartItems();
      calculateCartTotal();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      log("Error Fetching Cart Items: $e");
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Unable to Fetch Cart items!")));
    }
  }

  void emptyCart() {
    _cartStorage.emptyCart();
    notifyListeners();
  }

  void calculateCartTotal() {
    _cartTotal = 0;
    for (var item in _cartItems) {
      _cartTotal += item.price;
    }
  }

  bool isInCart(Food food) {
    return _cartItems.any((item) => item.id == food.id);
  }
}
