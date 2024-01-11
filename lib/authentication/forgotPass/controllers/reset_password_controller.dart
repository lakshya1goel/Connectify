import 'package:connectify/authentication/forgotPass/models/forgot_pass_model.dart';
import 'package:connectify/authentication/forgotPass/services/api_services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<ForgotPassModel?> performReset(String email, String pass) async {
  final String baseUrl = dotenv.get('BaseUrl');
  final String apiEndpoint = '$baseUrl/api/v1/auth/reset-password';
  final ApiService apiService = ApiService(apiEndpoint);

  try {
    final Map<String, dynamic> responseData = await apiService.resetPass(email, pass);

    final ForgotPassModel forgotPassModel = ForgotPassModel.fromJson(responseData);

    if (forgotPassModel.success!) {
      print('msg: ${forgotPassModel.msg}');
      return forgotPassModel;
    } else {
      print('Failed with error: Something went wrong.');
      return null;
    }
  } catch (error) {
    print('Failed with error: $error');
    return null;
  }
}
