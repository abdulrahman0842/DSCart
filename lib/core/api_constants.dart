class ApiConstants {
  static const String baseUrl = "http://localhost:3000/api";

  // Auth EndPoints
  static const String registerUrl = "$baseUrl/user/register";
  static const String loginrUrl = "$baseUrl/user/login";

  // Product EndPoints Food
  static const String getAllFoodItems = "$baseUrl/product";
  static const String getFoodItemsByCategory = "$baseUrl/product/category";
  static const String getFoodItemsById = "$baseUrl/product/id";

  // Order EndPoints Food
  static const String placeOrder = "$baseUrl/order/create";
}
