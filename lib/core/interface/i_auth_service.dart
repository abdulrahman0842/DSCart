abstract class IAuthService {
  Future<String?> register(String name, String email, String password,String address);
  Future<String?> login(String email, String password);
}
