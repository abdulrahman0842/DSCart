abstract class IFoodOrderService {
  Future<String> placeOrder(List<String> itemsId, double totalAmount,
      double deliveryCharge, String address);
}
