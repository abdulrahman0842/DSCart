import 'package:shared_preferences/shared_preferences.dart';

class UserStorage {
  static Future<void> storeUserData(String name, String address) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString("UserName", name);
    pref.setString("UserAddress", address);
  }

 static  Future<void> storeToken(String token) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString("token", token);
  }

  static Future<String?> getToken()async{
    final pref = await SharedPreferences.getInstance();
    return pref.getString("token");
  }

  static Future<String?> getUserAddress() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString("UserAddress");
  }

  static Future<void> updateUserAddress(String address) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString("UserAddress", address);
  }

  static Future<bool> clearPreferences()async{
    final pref = await SharedPreferences.getInstance();
    return await pref.clear();
  }

  
}
