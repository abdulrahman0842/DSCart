import 'dart:convert';
import 'dart:developer';
import 'package:ds_cart/core/interface/i_auth_service.dart';
import 'package:ds_cart/service/local_storage/user_storage.dart';
import 'package:http/http.dart' as http;
import '../core/api_constants.dart';

class AuthService implements IAuthService {
  @override
  Future<Map<String, dynamic>> register(String name, String email, String phone,
      String password, String address) async {
    final body = {
      "name": name,
      "email": email,
      "mobile": phone,
      "password": password,
      "address": address
    };
    try {
      final response = await http.post(Uri.parse(ApiConstants.registerUrl),
          body: jsonEncode(body),
          headers: {"Content-Type": "application/json"});
      log(response.body.toString());
      if (response.statusCode == 200) {
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
    final body = {"email": email, "otp": otp};
    try {
      final response = await http.post(Uri.parse(ApiConstants.verifyOtpUrl),
          body: jsonEncode(body),
          headers: {"content-type": "application/json"});

      if (response.statusCode == 200) {
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
    final body = {"field": email, "password": password};
    try {
      final response = await http.post(Uri.parse(ApiConstants.loginrUrl),
          body: jsonEncode(body),
          headers: {
            "Content-Type": "application/json",
          });

      log(response.body);
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
