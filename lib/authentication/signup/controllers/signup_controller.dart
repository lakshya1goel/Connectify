import 'package:connectify/authentication/signup/models/signup_model.dart';
import 'package:connectify/authentication/signup/services/api_services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<SignUpModel?> performRegisteration(String name, String email, String pass) async {
  final String baseUrl = dotenv.get('BaseUrl');
  final String apiEndpoint = '$baseUrl/api/v1/auth/register';
  final ApiService apiService = ApiService(apiEndpoint);

  try {
    final Map<String, dynamic> responseData = await apiService.registerUser(
        name, email, pass
    );

    final SignUpModel registerUserModel = SignUpModel.fromJson(responseData);

    if (registerUserModel.success!) {
      print('signup successful!');
      print('msg: ${registerUserModel.msg}');
      return registerUserModel;
    } else {
      print('signup failed with error: Something went wrong.');
      return null;
    }
  } catch (error) {
    print('signup failed with error: $error');
    return null;
  }
}
