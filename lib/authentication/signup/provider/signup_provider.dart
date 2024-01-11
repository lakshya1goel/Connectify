import 'package:connectify/authentication/signup/controllers/validations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import '../../../utils/routes/app_route_constants.dart';

class SignupProvider extends ChangeNotifier {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;

  String _name = '';
  String _email = '';
  String _password = '';
  String _confirm = '';
  String _nameError = '';
  String _emailError = '';
  String _passwordError = '';
  String _confirmError = '';

  String get name => _name;
  String get email => _email;
  String get password => _password;
  String get confirm => _confirm;
  String get nameError => _nameError;
  String get emailError => _emailError;
  String get passwordError => _passwordError;
  String get confirmError => _confirmError;

  void setName(String value) {
    _name = value;
    _nameError = Validator.isValidName(value) ?? '';
    notifyListeners();
  }

  void setEmail(String value) {
    _email = value;
    _emailError = Validator.isValidEmail(value) ?? '';
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    _passwordError = Validator.isValidPassword(value) ?? '';
    notifyListeners();
  }

  void setConfirm(String value) {
    _confirm = value;
    _confirmError = Validator.isValidConfirm(value, _password) ?? '';
    notifyListeners();
  }

  void validateSignup(String? apiErrorMessage, BuildContext context) {
    _nameError = '';
    _emailError = '';
    _passwordError = '';
    _confirmError = '';

    if (Validator.isValidName(_name) != null) {
      _nameError = Validator.isValidName(_name)!;
    }

    if (Validator.isValidEmail(_email) != null) {
      _emailError = Validator.isValidEmail(_email)!;
    }

    if (Validator.isValidPassword(_password) != null) {
      _passwordError = Validator.isValidPassword(_password)!;
    }

    if (Validator.isValidConfirm(_confirm, _password) != null) {
      _confirmError = Validator.isValidConfirm(_confirm, _password)!;
    }

    if (apiErrorMessage != null && apiErrorMessage.isNotEmpty) {
      _emailError = apiErrorMessage;
    } else {
      _nameError = '';
      _emailError = '';
      _passwordError = '';
      _confirmError = '';
      context.goNamed(MyAppRouteConstants.ProfilePicSelectionRouteName);
    }

    notifyListeners();
  }
}
