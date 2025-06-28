import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../core/api_constants.dart';

class AuthService {
  Future<String?> registerUser(
      String name, String email, String password) async {
    try {
      final response =
          await http.post(Uri.parse(ApiConstants.registerUrl), body: {
        "name": name,
        "email": email,
        "password": password
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

  Future<String?> loginUser(String email, String password) async {
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
}
