class AuthenticationService {
  Future<bool> authenticate(String username, String password) async {
    // Gantilah dengan logika autentikasi yang sesuai kebutuhan Anda
    // Misalnya, Anda dapat memeriksa dengan backend atau database
    if (username == 'user' && password == 'password') {
      return true; // Autentikasi berhasil
    } else {
      return false; // Autentikasi gagal
    }
  }
}
