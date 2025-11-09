import 'package:flutter/services.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    String newText = newValue.text.replaceAll(RegExp(r'[^\d.]'), '');

    if (newText.split('.').length > 2) {
      newText = oldValue.text;
    }
    if (newText.isNotEmpty && newText != '.') {
      List<String> parts = newText.split('.');
      String wholePart = parts[0];
      String decimalPart = parts.length > 1 ? '.${parts[1]}' : '';

      String formattedWhole = '';
      for (int i = 0; i < wholePart.length; i++) {
        if (i > 0 && (wholePart.length - i) % 3 == 0) {
          formattedWhole += ',';
        }
        formattedWhole += wholePart[i];
      }

      newText = formattedWhole + decimalPart;
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}