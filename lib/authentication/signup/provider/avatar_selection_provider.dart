import 'package:connectify/authentication/signup/controllers/validations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import '../../../utils/routes/app_route_constants.dart';

class AvatarProvider extends ChangeNotifier {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;

  String _userId = '';
  String _userIdError = '';

  String get userId => _userId;
  String get userIdError => _userIdError;

  void setUserName(String value) {
    _userId = value;
    _userIdError = Validator.isValidUserId(value) ?? '';
    notifyListeners();
  }

  void validateUser(String? apiErrorMessage, BuildContext context) {
    _userIdError = '';

    if (Validator.isValidUserId(_userId) != null) {
      _userIdError = Validator.isValidName(_userId)!;
    } else {
      _userIdError = '';
      context.goNamed(MyAppRouteConstants.OTPPageRouteName);
    }

    notifyListeners();
  }
}
