import 'package:flutter/material.dart';

import '../service/local_storage/user_storage.dart';

class UserProvider with ChangeNotifier {
  String _name = '';
  String? _address;
  bool _isLoading = false;

  String get name => _name;
  String? get address => _address;
  bool get isLoading => _isLoading;

  Future<void> getUserData() async {}

  Future<void> saveAddress(String address) async {
    _isLoading = true;
    notifyListeners();
    _address = address;
    await UserStorage.updateUserAddress(address);

    _isLoading = false;
    notifyListeners();
  }

  Future<String?> getAddress() async {
    _isLoading = true;
    notifyListeners();

    _address = await UserStorage.getUserAddress();
    if (_address != null) {
      _isLoading = false;
      notifyListeners();
      return UserStorage.getUserAddress();
    }
    _isLoading = false;
    notifyListeners();
    return null;
  }
}
