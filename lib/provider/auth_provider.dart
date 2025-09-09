import 'dart:developer';
import 'package:ds_cart/core/interface/i_auth_service.dart';
import 'package:ds_cart/service/auth_service.dart';
import 'package:ds_cart/view/register_screen.dart';
import 'package:flutter/material.dart';
import '../view/home_screen.dart';
import '../service/local_storage/user_storage.dart';

class AuthProvider with ChangeNotifier {
  final IAuthService _authService;
  AuthProvider(this._authService);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> register(BuildContext context, String name, String email,
      String password, String address) async {
    try {
      _isLoading = true;
      notifyListeners();

      final token = await _authService.register(name, email, password, address);

      _isLoading = false;
      notifyListeners();

      if (token != null) {
        //Local Storage Methods
        UserStorage.storeToken(token);
        UserStorage.storeUserData(name, address);
        log(token);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => HomeScreen()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Failed to Register Try Again")));
      }
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Something went wrong!")));
    }
  }

  Future<void> login(
      BuildContext context, String email, String password) async {
    try {
      _isLoading = true;
      notifyListeners();

      final token = await _authService.login(email, password);

      _isLoading = false;
      notifyListeners();

      if (token != null) {
        //Local Storage Methods
        UserStorage.storeToken(token);
        log(token);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => HomeScreen()));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Failed to Login Try Again")));
      }
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Something went wrong!")));
    }
  }

  Future<void> logout(context) async {
    _isLoading = true;
    notifyListeners();

    bool status = await AuthService.logout();
    if (status) {
      _isLoading = false;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Logout Successful")));
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => RegisterScreen()),
          (Route<dynamic> route) => false);
    }
  }
}
