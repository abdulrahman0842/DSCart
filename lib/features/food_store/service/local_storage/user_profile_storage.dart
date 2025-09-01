import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class UserProfileStorage {
  Future<void> storeUserProfile(
      String name, String email, String? address) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    var userData = {"name": name, "email": email, "address": address};
    var encodedData = jsonEncode(userData);
    await sharedPreferences.setString("UserData", encodedData);
  }
  

  Future<Map<String, dynamic>?> getUserProfile() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    var userData = sharedPreferences.getString("UserData");
    if (userData != null) {
      Map<String, dynamic> decodedData = jsonDecode(userData);
      return decodedData;
    }else{
      return null;
    }
    
  }
}
