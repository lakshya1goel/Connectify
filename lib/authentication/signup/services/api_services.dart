import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiUrl;

  ApiService(this.apiUrl);

  Future<Map<String, dynamic>> registerUser(String name, String email, String password) async {
    final Map<String, String> headers = {'Content-Type': 'application/json'};
    final Map<String, String> body = {'name' : name, 'email': email, 'password': password};

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        return responseData;
      } else {
        print(response.body);
        throw Exception('Failed to login: ${response.body}');
      }
    } catch (error) {
      return {'success': false, 'error': 'Error: $error'};
    }
  }

  Future<Map<String, dynamic>> selectAvatar(String email, String userId, String url) async {
    final Map<String, String> headers = {'Content-Type': 'application/json'};
    final Map<String, String> body = {'email' : email, 'userId': userId, 'profileImageUrl': url};

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        return responseData;
      } else {
        print(response.body);
        throw Exception('Failed: ${response.body}');
      }
    } catch (error) {
      return {'success': false, 'error': 'Error: $error'};
    }
  }

  Future<Map<String, dynamic>> verifyOtp(String email, String otp) async {
    final Map<String, String> headers = {'Content-Type': 'application/json'};
    final Map<String, String> body = {'email' : email, 'otp' : otp};

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        return responseData;
      } else {
        print(response.body);
        throw Exception('Failed: ${response.body}');
      }
    } catch (error) {
      return {'success': false, 'error': 'Error: $error'};
    }
  }


  Future<Map<String, dynamic>> uploadImage(String email, String userId, File? imageFile) async {
    var request = http.MultipartRequest('POST', Uri.parse(apiUrl))
      ..fields['email'] = email
      ..fields['userId'] = userId
      ..files.add(await http.MultipartFile.fromPath('file', imageFile!.path));

    try {
      var response = await request.send();

      if (response.statusCode == 200) {
        print('Image uploaded successfully');

        String responseBody = await response.stream.bytesToString();
        Map<String, dynamic> decodedResponse = json.decode(responseBody);

        return decodedResponse;
      } else {
        print('Failed to upload image. Status code: ${response.statusCode}');
        return {'success': false, 'error': 'Error'};
      }
    } catch (error) {
      print('Error uploading image: $error');
      return {'success': false, 'error': 'Error: $error'};
    }
  }

}
