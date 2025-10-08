import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../model/user.dart';

class UserStorage {
  static const String _userKey = "User";
  static const String _token = "token";

  static Future<void> storeUserData(User user) async {
    final pref = await SharedPreferences.getInstance();
    final userJson = jsonEncode(user.toJson());
    pref.setString(_userKey, userJson);
  }

  static Future<User?> getUserData() async {
    final pref = await SharedPreferences.getInstance();
    final userJson = pref.getString(_userKey);
    if (userJson != null) {
      User user = User.fromJson(jsonDecode(userJson));
      return user;
    }
    return null;
  }

  static Future<void> updateUserAddress(String newAddresss) async {
    User? user = await getUserData();
    if (user == null) return;
    user.address = newAddresss;
    await storeUserData(user);
  }

  static Future<void> storeToken(String token) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString(_token, token);
  }

  static Future<String?> getToken() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(_token);
  }

  // static Future<String?> getUserAddress() async {
  //   final pref = await SharedPreferences.getInstance();
  //   final userJson = pref.getString("UserData");
  //   if (userJson != null) {
  //     final user = jsonDecode(userJson);
  //     return user["address"];
  //   } else {
  //     return null;
  //   }
  // }

  // static Future<void> updateUserAddress(String address) async {
  //   final pref = await SharedPreferences.getInstance();
  //   final userJson = pref.getString("UserData");
  //   if(userJson != null){
  //     User user  = User.fromJson(jsonDecode(userJson));
  //     User newUser = User(name: user.name, email: user.email, phone: user.phone, address: address);
  //   }
  //   await pref.setString("UserAddress", address);
  // }

  static Future<bool> clearPreferences() async {
    final pref = await SharedPreferences.getInstance();
    return await pref.clear();
  }
}
