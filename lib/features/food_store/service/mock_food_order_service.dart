import 'package:ds_cart/features/food_store/interface/i_food_order_service.dart';

class MockFoodOrderService extends IFoodOrderService {
  @override
  Future<String> placeOrder(List<String> itemsId, double totalAmount,
      double deliveryCharge, String address) async {
    await Future.delayed(Duration(seconds: 3));
    return "Order Created Successfully";
  }
}
