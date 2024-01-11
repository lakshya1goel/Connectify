import 'package:connectify/authentication/signup/models/signup_model.dart';
import 'package:connectify/authentication/signup/services/api_services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<SignUpModel?> uploadAvatar(String email, String userId, String url) async {
  final String baseUrl = dotenv.get('BaseUrl');
  final String apiEndpoint = '$baseUrl/api/v1/auth/selectAvatar';
  final ApiService apiService = ApiService(apiEndpoint);

  try {
    final Map<String, dynamic> responseData = await apiService.selectAvatar(
        email, userId, url
    );

    final SignUpModel registerUserModel = SignUpModel.fromJson(responseData);

    if (registerUserModel.success!) {
      print('successful!');
      print('msg: ${registerUserModel.msg}');
      return registerUserModel;
    } else {
      print('failed with error: Something went wrong.');
      return null;
    }
  } catch (error) {
    print('failed with error: $error');
    return null;
  }
}
