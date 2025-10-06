import 'package:ds_cart/core/interface/i_auth_service.dart';

class MockAuthService implements IAuthService {
  @override
  Future<Map<String, dynamic>> register(String name, String email, String phone,
      String password, String address) async {
    await Future.delayed(Duration(seconds: 2));
    try {
      int statusCode = 201;
      if (statusCode == 201) {
        return {
          "status": "success",
          "data": {
            "email": "malfoy@hogwardz.com",
            "name": "malfoy",
            "mobile": "12345"
          },
          "message": "User Registered successfully"
        };
      } else {
        throw Exception("Error: Status Not 201");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  @override
  Future<Map<String, dynamic>> verifyOtp(String email, String otp) async {
    await Future.delayed(Duration(seconds: 2));
    try {
      int statusCode = 201;
      if (statusCode == 201) {
        return {
          "status": "success",
          "data": "eyJhbGciOiJIUzI1NiIsInR5",
          "message": "Email varified"
        };
      } else {
        throw Exception("Error: Status Not 201");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  @override
  Future<String?> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 3));
    if (email == "admin@gmail.com" && password == "123456") {
      return "SampleLoginToken";
    } else {
      return null;
    }
  }
}
