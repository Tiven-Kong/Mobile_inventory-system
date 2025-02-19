import 'package:dio/dio.dart';

class ApiProvider {
  final Dio dio = Dio(BaseOptions(
    baseUrl: "https://ims-api.bananacentercambodia.com/api",
    contentType: 'application/json',
    responseType: ResponseType.json,
    validateStatus: (status) {
      return status != null && status < 500; // Accept only valid status codes
    },
  ));

  Future<Response?> login({
    required String email,
    required String password,
  }) async {
    try {
      Response response = await dio.post(
        '/login',
        data: {'email': email, 'password': password},
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        }),
      );

      print("Status Code: ${response.statusCode}");
      print("Response Data: ${response.data}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("✅ Login Successful!");
        return response;
      } else {
        print("❌ Login Failed: ${response.data}");
      }
    } catch (e) {
      print("❌ Error during login: $e");
    }
    return null; // Return null if login fails
  }

  Future<bool> validateToken(String token) async {
    try {
      Response response = await dio.get(
        '/validate-token',
        options: Options(headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        }),
      );

      if (response.statusCode == 200) {
        print("✅ Token is valid!");
        return true;
      } else {
        print("❌ Invalid token: ${response.statusCode}");
      }
    } catch (e) {
      print("❌ Error validating token: $e");
    }
    return false;
  }
}
