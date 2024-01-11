import 'package:connectify/authentication/login/models/login_user_model.dart';
import 'package:connectify/authentication/signup/models/signup_model.dart';
import 'package:connectify/authentication/forgotPass/services/api_services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<SignUpModel?> verifyOTP(String email, String otp) async {
  final String baseUrl = dotenv.get('BaseUrl');
  final String apiEndpoint = '$baseUrl/api/v1/auth/verify-registration';
  final ApiService apiService = ApiService(apiEndpoint);

  try {
    final Map<String, dynamic> responseData = await apiService.verifyOtp(
        email, otp
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
