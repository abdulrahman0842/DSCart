abstract class IAuthService {
  Future<String?> register(String name, String email, String password);
  Future<String?> login(String email, String password);
}
