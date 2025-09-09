import 'dart:convert';
import 'dart:developer';
import 'package:ds_cart/core/interface/i_auth_service.dart';
import 'package:ds_cart/service/local_storage/user_storage.dart';
import 'package:http/http.dart' as http;
import '../core/api_constants.dart';

class AuthService implements IAuthService {
  @override
  Future<String?> register(
      String name, String email, String password, String address) async {
    try {
      final response =
          await http.post(Uri.parse(ApiConstants.registerUrl), body: {
        "name": name,
        "email": email,
        "password": password,
        "addess": address
      }, headers: {
        "Content-Type": "application/json",
      });

      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);
        return data["token"];
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  @override
  Future<String?> login(String email, String password) async {
    try {
      final response =
          await http.post(Uri.parse(ApiConstants.loginrUrl), body: {
        "email": email,
        "password": password
      }, headers: {
        "Content-Type": "application/json",
      });

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data["token"];
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<bool> isLoggedIn() async {
    final token = await UserStorage.getToken();
    return token != null && token.isNotEmpty;
  }

  static Future<bool> logout()async{
    return await UserStorage.clearPreferences();
  }
}
