import 'dart:convert';
import 'package:ds_cart/core/interface/i_auth_service.dart';
import 'package:ds_cart/service/local_storage/user_storage.dart';
import 'package:http/http.dart' as http;
import '../core/api_constants.dart';

class AuthService implements IAuthService {
  @override
  Future<Map<String, dynamic>> register(String name, String email, String phone,
      String password, String address) async {
    try {
      final response =
          await http.post(Uri.parse(ApiConstants.registerUrl), body: {
        "name": name,
        "email": email,
        "phone": phone,
        "password": password,
        "addess": address
      }, headers: {
        "Content-Type": "application/json",
      });

      if (response.statusCode == 201) {
        final decodedJson = jsonDecode(response.body);
        return decodedJson;
      } else {
        throw Exception("Error: ${response.body}");
      }
    } catch (e) {
      throw Exception("Failed to register: $e");
    }
  }

  @override
  Future<Map<String, dynamic>> verifyOtp(String email, String otp) async {
    try {
      final response = await http.post(Uri.parse(ApiConstants.verifyOtpUrl),
          body: {"email": email, "otp": otp},
          headers: {"content-type": "application/json"});

      if (response.statusCode == 201) {
        final decodedJson = jsonDecode(response.body);
        return decodedJson;
      } else {
        throw Exception("Error: ${response.body}");
      }
    } catch (e) {
      throw Exception("Failed to Verify OTP: $e");
    }
  }

  @override
  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response =
          await http.post(Uri.parse(ApiConstants.loginrUrl), body: {
        "email": email,
        "password": password
      }, headers: {
        "Content-Type": "application/json",
      });

      if (response.statusCode == 200) {
        final decodedJson = jsonDecode(response.body);
        return decodedJson;
      } else {
        throw Exception("Error: ${response.body}");
      }
    } catch (e) {
      throw Exception("Failed to Login: $e");
    }
  }

  static Future<bool> isLoggedIn() async {
    final token = await UserStorage.getToken();
    return token != null && token.isNotEmpty;
  }

  static Future<bool> logout() async {
    return await UserStorage.clearPreferences();
  }
}
