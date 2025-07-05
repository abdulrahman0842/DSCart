import 'dart:developer';

import 'package:ds_cart/core/interface/i_auth_service.dart';
import 'package:flutter/material.dart';

import '../view/home_screen.dart';

class AuthProvider with ChangeNotifier {
  final IAuthService _authService;
  AuthProvider(this._authService);

  bool isLoading = false;

  Future<void> register(
      BuildContext context, String name, String email, String password,String address) async {
    try {
      isLoading = true;
      notifyListeners();

      final token = await _authService.register(name, email, password,address);

      isLoading = false;
      notifyListeners();

      if (token != null) {
        //Local Storage Methods

        log(token);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => HomeScreen()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Failed to Register Try Again")));
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Something went wrong!")));
    }
  }


  Future<void> login(
      BuildContext context, String email, String password) async {
    try {
      isLoading = true;
      notifyListeners();

      final token = await _authService.login(email, password);

      isLoading = false;
      notifyListeners();

      if (token != null) {
        //Local Storage Methods

        log(token);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => HomeScreen()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Failed to Login Try Again")));
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Something went wrong!")));
    }
  }
}
