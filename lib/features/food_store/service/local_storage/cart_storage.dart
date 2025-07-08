import 'package:hive/hive.dart';

import '../../model/food_model.dart';

class CartStorage {
  Future<void> addToCart(Food foodItem) async {
    Box<Food> cartBox = Hive.box<Food>("foodCartBox");
    if (cartBox.values.contains(foodItem)) {
      return;
    }
    await cartBox.add(foodItem);
  }

  List<Food> getCartItems() {
    Box<Food> cartBox = Hive.box<Food>("foodCartBox");
    List<Food> cartItems = cartBox.values.toList();
    return cartItems;
  }

  void removeFromCart(String id) {
    Box<Food> cartBox = Hive.box<Food>("foodCartBox");
    final cartItems = cartBox.values.toList();
    int itemIndex = cartItems.indexWhere((item) => item.id == id);
    cartBox.deleteAt(itemIndex);
  }

  void emptyCart() {
    Box<Food> cartBox = Hive.box("foodCartBox");
    cartBox.clear();
  }
}
