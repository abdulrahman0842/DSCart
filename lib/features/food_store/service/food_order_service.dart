import 'dart:convert';

import 'package:ds_cart/features/food_store/interface/i_food_order_service.dart';
import 'package:http/http.dart' as http;

import '../../../core/api_constants.dart';

class FoodOrderService extends IFoodOrderService {
  @override
  Future<String> placeOrder(List<String> itemsId, double totalAmount,
      double deliveryCharge, String address) async {
    String orderResponse = "";
    try {
      final order = {
        "products": itemsId,
        "rate": totalAmount,
        "address": address,
        "deliveryCharge": deliveryCharge
      };
      final response = await http.post(Uri.parse(ApiConstants.placeOrder),
          body: jsonEncode(order),
          headers: {
            "Content-Type": "application/json",
          });
     
        final data = jsonDecode(response.body);
        orderResponse = data["message"];
    
      return orderResponse;
    } catch (e) {
      return e.toString();
    }
  }
}
