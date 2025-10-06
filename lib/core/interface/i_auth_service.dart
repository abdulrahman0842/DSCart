abstract class IAuthService {
  Future<Map<String,dynamic>> register(String name, String email,String phone, String password,String address);
  Future<String?> login(String email, String password);
  Future<Map<String,dynamic>> verifyOtp(String email,String otp);
  
}
