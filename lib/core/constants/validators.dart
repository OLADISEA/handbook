class ValidatorsData {

  static String? validateEmail(String value) {
    const Pattern pattern = r'^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    final regex = RegExp(pattern as String);
    if (!regex.hasMatch(value)) {
      return 'Please enter a valid email address.';
    } else {
      return null;
    }
  }




  static String? validateText(String value, String label) {
    if (value.isEmpty || value.length < 2) {
      return '$label is invalid';
    } else {
      return null;
    }
  }


  static String? customTextValidation(String value, int min, int max) {
    if (value.length < min) {
      return 'Enter a minimum of $min characters';
    }else if(value.length > max){
      return 'Enter a maximum of $max characters';

    }
    else {
      return null;
    }
  }



  static String? validateNumber(String value, String label) {
    if (value.isEmpty) {
      return '$label is invalid';
    } else {
      return null;
    }
  }




  static String? validateAmount(
      String value, String? storedBalance, double limit) {
    final amount = value.isEmpty ? 0 : double.parse(value);
    if (amount > double.parse(storedBalance ?? '0')) {
      return 'Insufficient Balance';
    } else if (value.isEmpty) {
      return 'Input amount';
    } else if (amount > limit) {
      return 'Transaction Limit Exceeded';
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber(String value) {
    if (value.isEmpty) {
      return 'This field is required.';
    } else if (!(value.length > 10 && value.length < 12)) {
      return 'Enter a valid phone number';
    } else {
      return null;
    }
  }

  static String? validateFullName(String value) {
    if (value.isEmpty) {
      return 'This field is required.';
    } else if (!value.contains(' ') || value.length < 4) {
      return 'Enter a valid full name';
    } else {
      return null;
    }
  }
  static bool validateAddress(String address) {
    final RegExp regex = RegExp(
      r'^([A-Za-z]?\d+[A-Za-z]*)\s+[A-Za-z]+[\w\s]*$',
    );
    return regex.hasMatch(address);
  }
}
