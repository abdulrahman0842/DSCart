import 'dart:developer';

import 'package:flutter/material.dart';

import '../model/user.dart';
import '../service/local_storage/user_storage.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  User? get user => _user;

  Future<void> loadUserData() async {
    _user = await UserStorage.getUserData();
    log("${_user?.name} ${_user?.email} ${_user?.address}");
  }

  Future<void> updateAddress(String newAddress) async {
    _isLoading = true;
    notifyListeners();
    _user!.address = newAddress;
    await UserStorage.updateUserAddress(newAddress);

    _isLoading = false;
    notifyListeners();
  }

  // Future<String?> getAddress() async {
  //   _isLoading = true;
  //   notifyListeners();

  //   _address = await UserStorage.getUserAddress();
  //   if (_address != null) {
  //     _isLoading = false;
  //     notifyListeners();
  //     return UserStorage.getUserAddress();
  //   }
  //   _isLoading = false;
  //   notifyListeners();
  //   return null;
  // }
}
