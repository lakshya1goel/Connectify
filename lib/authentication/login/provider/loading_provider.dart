import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../views/widgets/loading.dart';

class LoadingProvider extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void showCustomLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // set to false if you want to force the user to close the dialog
      builder: (BuildContext context) {
        return CustomLoadingIndicator();
      },
    );
  }

  void hideCustomLoadingDialog(BuildContext context) {
    Navigator.of(context).pop(); // Close the dialog when you want to hide it
  }

}
