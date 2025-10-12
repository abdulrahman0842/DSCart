class ApiConstants {
  static const String baseUrl = "https://lucky-marion-unsupernaturally.ngrok-free.dev/api";

  // Auth EndPoints
  static const String registerUrl = "$baseUrl/user/register";
  static const String loginrUrl = "$baseUrl/user/login";
  static const String verifyOtpUrl = "$baseUrl/user/verify-otp";

  // Product EndPoints Food
  static const String getProducts = "$baseUrl/get-products";
  // static const String getFoodItemsByCategory = "$baseUrl/product/category";
  static const String getFoodItemsById = "$baseUrl/product/id";

  // Order EndPoints Food
  static const String placeOrder = "$baseUrl/order/create";
}
