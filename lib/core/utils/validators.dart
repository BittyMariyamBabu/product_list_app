// A collection of reusable form field validators.

class AppValidators {
  AppValidators._(); // Private constructor to prevent instantiation

  /// Validates that the field is not empty.
  static String? required(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "This field is required";
    }
    return null;
  }

  /// Validates a phone number.
  static String? phone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Phone number is required";
    }
    final phoneRegex = RegExp(r'^[0-9]{10}$');
    if (!phoneRegex.hasMatch(value.trim())) {
      return "Enter a valid 10-digit phone number";
    }
    return null;
  }

  /// Validates an OTP.
  /// Default length is 6 digits.
  /// Returns error if empty or not matching length/digits.
  static String? otp(String? value, {int length = 6}) {
    if (value == null || value.trim().isEmpty) {
      return "OTP is required";
    }
    final otpRegex = RegExp(r'^[0-9]+$');
    if (!otpRegex.hasMatch(value.trim()) || value.trim().length != length) {
      return "Enter a valid $length-digit OTP";
    }
    return null;
  }

  /// Validates full name.
  /// Checks that the field is not empty and contains only letters & spaces.
  /// Returns error if invalid.
  static String? fullName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Full name is required";
    }
    final nameRegex = RegExp(r"^[a-zA-Z ]+$");
    if (!nameRegex.hasMatch(value.trim())) {
      return "Enter a valid full name (letters and spaces only)";
    }
    return null;
  }
}


