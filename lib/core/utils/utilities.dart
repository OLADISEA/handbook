import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

import 'package:intl/intl.dart';

class Utilities {


  static String removeHtmlTags(String htmlText) {
    final regex = RegExp(r'<[^>]*>', multiLine: true, caseSensitive: false);
    return htmlText.replaceAll(regex, '').trim();
  }

  static String removeFirstZero(String phoneNumber) {
    if (phoneNumber.isEmpty) return phoneNumber;

    if (phoneNumber.startsWith('+')) return phoneNumber;

    if (phoneNumber.startsWith('0')) {
      return phoneNumber.substring(1);
    }

    return phoneNumber;
  }

  static String formatTime(String isoTime) {
    final dateTime = DateTime.parse(isoTime);
    return DateFormat('h:mma').format(dateTime); // Example: 11:20AM
  }


  static String formatScheduleAt(String scheduleAt) {
    try {
      final dateTime = DateTime.parse(scheduleAt).toLocal();

      final outputFormat = DateFormat("dd-MM-yyyy : h:mm a");
      return outputFormat.format(dateTime);
    } catch (e) {
      return scheduleAt; // fallback
    }
  }


  static String formatNaira(int amount) {
    final formatter =
        NumberFormat.currency(locale: 'en_NG', symbol: '₦', decimalDigits: 0);
    return formatter.format(amount);
  }

  static String formatNaira2(num amount) {
    final formatter =
    NumberFormat.currency(locale: 'en_NG', symbol: '₦', decimalDigits: 2);
    return formatter.format(amount);
  }

  static String formatNairaSafely(String? value) {
  if (value == null || value.isEmpty) return "₦0.00";

  final numericString = value.replaceAll(RegExp(r'[^0-9.]'), '');
  final number = double.tryParse(numericString) ?? 0.0;

  final formatter = NumberFormat("#,##0.00", "en_NG");
  return "₦${formatter.format(number)}";
  }


  static String formatPhone({required String code, required String phone}) {
    if (phone.length > 10) {
      var subString = phone.substring(1);
      return '$code$subString';
    } else {
      return '$code$phone';
    }
  }

  static String removeLeadingZero(String phone) {
    if (phone.length == 11 && phone.startsWith('0')) {
      return phone.substring(1);
    }
    return phone;
  }

  static String returnPhoneCodeFromPhone(
      {required String phone, required String code}) {
    var codeFormatted = "+$code";
    //var theCount = phone.length - 10;
    var theCode = phone.substring(0, codeFormatted.length);
    //print(theCode);
    return theCode;
  }

  static String returnPhoneFromPhone(
      {required String phone, required String code}) {
    var codeFormatted = "+$code";
    var theCount = phone.substring(codeFormatted.length, phone.length);
    var thePhone = theCount;
    return thePhone;
  }

  static String formatPayoutDate(String isoDate) {
    DateTime parsedDate = DateTime.parse(isoDate);
    return '${parsedDate.day.toString().padLeft(2, '0')}/${parsedDate.month.toString().padLeft(2, '0')}/${parsedDate.year.toString().substring(2)}';
  }

  static String formatAffiliateName(String fullName) {
    if (fullName.length >= 5) {
      return "${fullName.substring(0, 5)}****";
    }
    return fullName;
  }

  static String removeCommas(String input) {
    return input.replaceAll(',', '');
  }

  static Future<List<String>> fetchPlaceSuggestions(String input) async {
    final apiKey = '';
    final url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&key=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final predictions = json['predictions'] as List;
      return predictions.map((p) => p['description'] as String).toList();
    } else {
      return [];
    }
  }

  static String formatAmount(num amount) {
    if (amount >= 1000000) {
      return '${(amount / 1000000).toStringAsFixed(2)}M';
    } else if (amount >= 100000) {
      return '${(amount / 1000).toStringAsFixed(2)}K';
    } else {
      return formatCurrency(amount.toDouble());
    }
  }

  static String formatCurrency(dynamic amount) {
    double value;
    if (amount is String) {
      value = double.tryParse(amount) ?? 0;
    } else if (amount is num) {
      value = amount.toDouble();
    } else {
      value = 0;
    }
    final formatter =
        NumberFormat.currency(locale: 'en_NG', symbol: '₦', decimalDigits: 2);
    return formatter.format(value);
  }

  static String formatDate(String timestamp) {
    try {
      final dt = DateTime.parse(timestamp);
      return DateFormat('MMM d, y').format(dt);
    } catch (_) {
      return timestamp;
    }
  }

  static String formatDate2(String input) {
    try {
      final parsedDate = DateFormat("dd MMM yyyy").parse(input);

      return DateFormat("dd-MM-yyyy").format(parsedDate);
    } catch (e) {
      return input;
    }
  }

  static String formatOrderDate(DateTime? dateTime, {String fallback = 'Unknown date'}) {
    if (dateTime == null) return fallback;
    final DateFormat formatter = DateFormat("MMM d, yyyy h:mma");
    return formatter.format(dateTime);
  }
}
