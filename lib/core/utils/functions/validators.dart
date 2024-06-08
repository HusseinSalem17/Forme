String? validateInput(String? value) {
  if (value == null || value.isEmpty) {
    return 'This field is required';
  }

  return null; // Return null if the input is valid
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email is required';
  }

  // Regular expression to validate email format
  final emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');

  if (!emailRegex.hasMatch(value)) {
    return 'Invalid email format';
  }

  return null; // Return null if the email is valid
}

bool passwordsMatch(String password, String confirmPassword) {
  return password == confirmPassword;
}

bool isValidURL(String url) {
  final RegExp urlRegExp = RegExp(
    r'^(https?|ftp):\/\/[^\s/$.?#].[^\s]*$',
    caseSensitive: false,
  );
  return urlRegExp.hasMatch(url);
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password is required';
  }

  // Define your password strength criteria
  // Modify this logic based on your specific requirements
  bool hasUppercase = false;
  bool hasLowercase = false;
  bool hasDigit = false;
  bool hasSpecialChar = false;

  for (int i = 0; i < value.length; i++) {
    if (value[i].toUpperCase() != value[i].toLowerCase()) {
      // Check for uppercase and lowercase letters
      if (value[i] == value[i].toUpperCase()) {
        hasUppercase = true;
      } else {
        hasLowercase = true;
      }
    } else if (value.codeUnitAt(i) >= 48 && value.codeUnitAt(i) <= 57) {
      // Check for digits
      hasDigit = true;
    } else {
      // Check for special characters
      hasSpecialChar = true;
    }
  }

  // Define your desired strength criteria
  bool hasDesiredStrength =
      hasUppercase && hasLowercase && hasDigit && hasSpecialChar;

  if (!hasDesiredStrength) {
    return 'Password should contain at least one uppercase letter, one lowercase letter, one digit, and one special character';
  }

  return null; // Return null if the password has the desired strength
}

String formatCardNumber(String cardNumber) {
  if (cardNumber.length <= 4) {
    return cardNumber;
  }
  if (cardNumber.length <= 8) {
    return '${cardNumber.substring(0, 4)} ${cardNumber.substring(4)}';
  }
  if (cardNumber.length <= 12) {
    return '${cardNumber.substring(0, 4)} ${cardNumber.substring(4, 8)} ${cardNumber.substring(8)}';
  }
  return '${cardNumber.substring(0, 4)} ${cardNumber.substring(4, 8)} ${cardNumber.substring(8, 12)} ${cardNumber.substring(12)}';
}
