import 'package:ds_cart/core/interface/i_auth_service.dart';
import 'package:ds_cart/service/auth_service.dart';
import 'package:ds_cart/utils/flush_bar.dart';
import 'package:flutter/material.dart';
import '../model/user.dart';
import '../view/home_screen.dart';
import '../service/local_storage/user_storage.dart';
import '../view/login_screen.dart';
import '../view/otp_screen.dart';

class AuthProvider with ChangeNotifier {
  final IAuthService _authService;
  AuthProvider(this._authService);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  User? _user;
  User? get user => _user;

  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  Future<void> register(BuildContext context, String name, String email,
      String mobile, String password, String address) async {
    try {
      _isLoading = true;
      notifyListeners();
      _user = null;
      _errorMessage = null;

      final response =
          await _authService.register(name, email, mobile, password, address);
      if (response["status"] == "success") {
        _user =
            User(name: name, email: email, mobile: mobile, address: address);
        if (context.mounted) {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => OtpScreen()));
          FlushBar.success("OTP Send Successfully", context);
        }
      } else {
        _errorMessage =
            "${response['status'].toString().toUpperCase()}:${response['message']}";
      }
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error:$e")));
    }
  }

  Future<void> verifyOtp(BuildContext context, String email, String otp) async {
    try {
      _isLoading = true;
      notifyListeners();

      final response = await _authService.verifyOtp(email, otp);
      if (response["status"] == "success") {
        if (response["data"] != null ||
            response["data"].toString().isNotEmpty) {
          _isLoading = false;
          _isLoggedIn = true;
          notifyListeners();
          final token = response["data"];
          //Local Storage Methods
          UserStorage.storeToken(token);
          UserStorage.storeUserData(_user!);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => HomeScreen()));
        } else {
          _isLoading = false;
          notifyListeners();
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Failed to Register Try Again")));
        }
      } else {
        _isLoading = false;
        notifyListeners();
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Failed to Verify OTP Try Again")));
      }
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  Future<void> login(
      BuildContext context, String email, String password) async {
    try {
      _isLoading = true;
      notifyListeners();

      final response = await _authService.login(email, password);

      _isLoading = false;
      notifyListeners();

      if (response["status"] != "success") {
        _isLoading = false;
        notifyListeners();
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Failed: ${response["message"]}")));
        return;
      }

      if (response["data"] == null ||
          (response["data"]["token"] == null ||
              response["data"]["token"].isEmpty)) {
        _isLoading = false;
        notifyListeners();
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Something went wrong. Try Again")));
        return;
      }

      _isLoading = false;
      notifyListeners();

      final token = response["data"]["token"];
      _user = User.fromJson(response["data"]);
      UserStorage.storeToken(token);
      UserStorage.storeUserData(_user!);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => HomeScreen()));
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  Future<void> logout(context) async {
    _isLoading = true;
    notifyListeners();

    bool status = await AuthService.logout();
    if (status) {
      _isLoading = false;
      _isLoggedIn = false;
      _user = null;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Logout Successful")));
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
          (Route<dynamic> route) => false);
    }
  }

  Future<bool> chechAuthStatus() async {
    _isLoggedIn = await AuthService.isLoggedIn();
    notifyListeners();
    return _isLoggedIn;
  }
}
