import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import '../../../utils/routes/app_route_constants.dart';
import '../controllers/validations.dart';

class ForgotPassProvider extends ChangeNotifier {
  String _email = '';
  String _emailError = '';

  String get email => _email;
  String get emailError => _emailError;

  void setEmail(String value) {
    _email = value;
    _emailError = Validator.isValidEmail(value) ?? '';
    notifyListeners();
  }

  void validateEmail(String? apiErrorMessage, BuildContext context) {
    _emailError = '';

    if (_email.isEmpty) {
      _emailError = 'Email cannot be empty';
    } else if (Validator.isValidEmail(_email) != null) {
      _emailError = Validator.isValidEmail(_email)!;
    }

    if (apiErrorMessage != null && apiErrorMessage.isNotEmpty) {
      _emailError = apiErrorMessage;
    } else {
      _emailError = '';
      GoRouter.of(context).pushNamed(MyAppRouteConstants.OTPVerificationRouteName, pathParameters: {'email' : _email});
    }

    notifyListeners();
  }
}
