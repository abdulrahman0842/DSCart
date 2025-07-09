import 'package:ds_cart/features/food_store/interface/i_food_order_service.dart';
import 'package:ds_cart/service/local_storage/auth_storage.dart';
import 'package:flutter/material.dart';
import '../model/food_model.dart';

class OrderProvider with ChangeNotifier {
  final IFoodOrderService _orderService;
  OrderProvider(this._orderService);

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String? _address;
  String? get address => _address;
  bool _isOrderPlaced = false;
  bool get isOrderPlaced => _isOrderPlaced;
  String _errorMessage = "";
  String get errorMessage => _errorMessage;

  final _authStorage = AuthStorage();

  Future<void> placeOrder(List<Food> allOrder, double totalAmount) async {
    _isLoading = true;
    _isOrderPlaced = false;
    notifyListeners();
    try {
      List<String> itemsId = allOrder.map((item) => item.id).toList();
      await _orderService.placeOrder(
          itemsId, totalAmount, 30, address ?? "UNknown");
      _isLoading = false;
      _isOrderPlaced = true;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      _isOrderPlaced = false;
      notifyListeners();
    }
  }

  Future<void> getUserAddress() async {
    _address = await _authStorage.getUserAddress();
    notifyListeners();
  }
}
