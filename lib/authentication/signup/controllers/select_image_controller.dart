import 'dart:io';

import 'package:connectify/authentication/signup/models/signup_model.dart';
import 'package:connectify/authentication/signup/services/api_services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// Future<void> uploadProfieImage(String email, String userId, File image) async {
//   final String baseUrl = dotenv.get('BaseUrl');
//   final String apiEndpoint = '$baseUrl/api/v1/auth/uploadImage';
//   final ApiService apiService = ApiService(apiEndpoint);
//
//   try {
//      await apiService.uploadImage(
//       email,
//       userId,
//       image,
//     );
//     // if () {
//     //   print('Successful!');
//     // } else {
//     //   print('Failed with error: Something went wrong.');
//     // }
//   } catch (error) {
//     print('Failed with error: $error');
//   }
// }

Future<SignUpModel?> uploadProfieImage(String email, String userId, File? image) async {
  final String baseUrl = dotenv.get('BaseUrl');
  final String apiEndpoint = '$baseUrl/api/v1/auth/uploadImage';
  final ApiService apiService = ApiService(apiEndpoint);

  try {
    final Map<String, dynamic> responseData = await apiService.uploadImage(
        email, userId, image
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
