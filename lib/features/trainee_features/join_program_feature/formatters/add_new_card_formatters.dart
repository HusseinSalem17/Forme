import 'dart:math';

import 'package:flutter/services.dart';

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    final text = newValue.text;

    if (text.length <= 4) {
      return newValue;
    }

    final formattedText = StringBuffer();
    for (int i = 0; i < text.length; i += 4) {
      final end = (i + 4 < text.length) ? i + 4 : text.length;
      formattedText.write(text.substring(i, end));

      if (end < text.length) {
        formattedText.write(' ');
      }
    }

    return newValue.copyWith(
      text: formattedText.toString(),
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}

class ExpireDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    final String newText = newValue.text;

    // Allow only numeric characters
    final String sanitizedText = newText.replaceAll(RegExp(r'[^0-9]'), '');

    if (sanitizedText.length >= 2) {
      // Insert '/' after the second numeric character
      final String formattedText =
          '${sanitizedText.substring(0, 2)}${sanitizedText.length > 2 ? '/${sanitizedText.substring(2, min(4, sanitizedText.length))}' : ''}';
      return TextEditingValue(
        text: formattedText,
        selection: TextSelection.collapsed(offset: formattedText.length),
      );
    }

    return newValue.copyWith(
      text: sanitizedText,
      selection: TextSelection.collapsed(offset: sanitizedText.length),
    );
  }
}

