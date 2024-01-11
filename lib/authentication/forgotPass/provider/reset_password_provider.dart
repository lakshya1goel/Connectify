import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import '../../../utils/routes/app_route_constants.dart';
import '../../signup/controllers/validations.dart';

class ResetPasswordProvider extends ChangeNotifier {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;

  String _password = '';
  String _confirm = '';
  String _passwordError = '';
  String _confirmError = '';

  String get password => _password;
  String get confirm => _confirm;
  String get passwordError => _passwordError;
  String get confirmError => _confirmError;

  void setPassword(String value) {
    _password = value;
    _passwordError = Validator.isValidPassword(value) ?? '';
    notifyListeners();
  }

  void setConfirmPassword(String value) {
    _confirm = value;
    _confirmError = Validator.isValidConfirm(value, _password) ?? '';
    notifyListeners();
  }

  void validateReset(String? apiErrorMessage, BuildContext context) {
    _passwordError = '';
    _confirmError = '';

    if (Validator.isValidPassword(_password) != null) {
      _passwordError = Validator.isValidPassword(_password)!;
    }

    if (Validator.isValidConfirm(_confirm, _password) != null) {
      _confirmError = Validator.isValidConfirm(_confirm, _password)!;
    }

    if (apiErrorMessage != null && apiErrorMessage.isNotEmpty) {
      _passwordError = apiErrorMessage;
      _confirmError = apiErrorMessage;
    } else {
      _passwordError = '';
      _confirmError = '';
      context.goNamed(MyAppRouteConstants.LoginRouteName);
    }

    notifyListeners();
  }
}