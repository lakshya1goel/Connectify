import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/login_user_model.dart';
import '../services/api_service.dart';
import '../services/storage.dart';
final SecureStorage secureStorage = SecureStorage();
Future<LoginUserModel?> performLogin(String email, String pass) async {
  final String baseUrl = dotenv.get('BaseUrl');
  final String apiEndpoint = '$baseUrl/api/v1/auth/login';
  final ApiService apiService = ApiService(apiEndpoint);

  try {
    final Map<String, dynamic> responseData = await apiService.loginUser(
      email, pass
    );

    final LoginUserModel loginUserModel = LoginUserModel.fromJson(responseData);

    if (loginUserModel.success!) {
      print('Login successful!');
      print('Access Token: ${loginUserModel.accessToken}');
      print('Refresh Token: ${loginUserModel.refreshToken}');
      print('User ID: ${loginUserModel.userId}');
      print('Email: ${loginUserModel.email}');
      print('Profile Image URL: ${loginUserModel.profileImageUrl}');
      print('msg: ${loginUserModel.msg}');
      secureStorage.writeSecureData('accessToken', loginUserModel.accessToken);
      secureStorage.writeSecureData('refreshToken', loginUserModel.refreshToken);
      return loginUserModel;
    } else {
      print('Login failed with error: Something went wrong.');
      return null;
    }
  } catch (error) {
    print('Login failed with error: $error');
    return null;
  }
}
