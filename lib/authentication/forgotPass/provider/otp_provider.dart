import 'package:connectify/utils/routes/app_route_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResetOtpProvider extends ChangeNotifier {
  String _otp = '';
  String _error = '';

  String get otp => _otp;
  String get error => _error;

  void setOtp(String value, String err) {
    _otp = value;
    _error = err;
    notifyListeners();
  }

  void validateAndSubmitOtp(String? apiErrorMessage, BuildContext context, String email) {
    _error = '';
    if (_otp.isEmpty) {
      _error = 'OTP cannot be empty';
    }
    if (apiErrorMessage != null && apiErrorMessage.isNotEmpty) {
      _error = apiErrorMessage;
    } else {
      _error = '';
      context.goNamed(MyAppRouteConstants.ResetPasswordRouteName, pathParameters: {'email' : email});
    }

    notifyListeners();
  }
}
