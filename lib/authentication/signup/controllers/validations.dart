class Validator {

  static String? isValidName(String name) {
    if(name.isEmpty) {
      return "Fullname cannot be empty";
    }
    return null;
  }

  static String? isValidEmail(String email) {
    if (email.isEmpty) {
      return "Email cannot be empty";
    }
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    bool isValidFormat = emailRegex.hasMatch(email);
    if (!isValidFormat) {
      return "Invalid email format";
    }
    return null;
  }

  static String? isValidPassword(String password) {
    if (password.isEmpty) {
      return "Password Cannot be empty";
    }
    final passwordRegex = RegExp(r'^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\S+$).{8,}$');
    bool isValidFormat = passwordRegex.hasMatch(password);

    if (password.length < 8) {
      return "Password must contain atleast 8 characters";
    }

    if (!isValidFormat) {
      return "Please enter a strong password";
    }
    return null;
  }

  static String? isValidConfirm(String password, String pass) {
    if (password.isEmpty) {
      return "Confirm Password Cannot be empty";
    } else if(password != pass) {
      return "Password Mismatch";
    }
    return null;
  }

  static String? isValidUserId(String userId) {
    if(userId.isEmpty) {
      return "Username Cannot be Empty";
    }
    return null;
  }

}