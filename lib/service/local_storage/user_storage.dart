import 'package:shared_preferences/shared_preferences.dart';

class UserStorage {
  Future<void> storeUserData(String name, String address) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString("UserName", name);
    pref.setString("UserAddress", address);
  }

  Future<void> storeToken(String token) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString("token", token);
  }

  Future<String?> getUserAddress() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString("UserAddress");
  }

  Future<void> updateUserAddress(String address) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString("UserAddress", address);
  }
}
