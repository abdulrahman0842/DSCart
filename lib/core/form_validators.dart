class FormValidators {
  static String? requiredField(String? value, {String? fieldName = "Field"}) {
    if (value == null || value.trim().isEmpty) {
      return "$fieldName is required";
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Email is Required";
    }

    if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(value)) {
      return "Enter Valid Email";
    }
    return null;
  }

  static String? password(String? value, {int minLength = 6}) {
    if (value == null || value.trim().isEmpty) {
      return "Password is requred";
    }
    if (value.length < minLength) {
      return "Passsword must be atleast $minLength characters";
    }
    return null;
  }

  static String? phone(String? value, {int minLength = 10}) {
    if (value == null || value.trim().isEmpty) {
      return "Phone is required";
    }
    if (!RegExp(r'^[6-9]\d{9}$').hasMatch(value)) {
      return "Invalid Phone Number";
    }
  }
}
