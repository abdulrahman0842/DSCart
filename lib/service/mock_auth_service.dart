import 'package:ds_cart/core/interface/i_auth_service.dart';

class MockAuthService implements IAuthService {
  @override
  Future<String?> register(String name, String email, String password) async {
    await Future.delayed(Duration(seconds: 3));
    return "SampleRegisteredToken";
  }

  @override
  Future<String?> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 3));
    return "SampleLoginToken";
  }
}
