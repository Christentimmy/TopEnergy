import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const appName = 'https://topenergy.ng';

String capitalize(String text) {
  // Split the text into words
  List<String> words = text.split(' ');

  // Capitalize the first letter of each word
  List<String> capitalizedWords = words.map((word) {
    if (word.isEmpty) {
      return word; // Return empty string unchanged
    }
    return word[0].toUpperCase() + word.substring(1).toLowerCase();
  }).toList();

  // Join the capitalized words back into a single string
  return capitalizedWords.join(' ');
}

String formatNumber(String numberString) {
  // Parse the numberString to double
  double number = double.tryParse(numberString) ?? 0.0;

  // Use NumberFormat to format the number with commas and two decimal places
  final formatter = NumberFormat("#,##0.00", "en_US");
  return formatter.format(number);
}

class SnackbarUtils {
  static void showSnackbar({
    required String title,
    required String message,
    Color? backgroundColor,
    Color? textColor,
    IconData? iconData,
  }) {
    Get.snackbar(
      title,
      message,
      icon: iconData != null ? Icon(iconData, color: textColor) : null,
      shouldIconPulse: false,
      barBlur: 20.0,
      backgroundColor: backgroundColor,
      colorText: textColor,
      snackPosition: SnackPosition.TOP,
      borderRadius: 10.0,
      margin: const EdgeInsets.all(10),
      duration: const Duration(seconds: 3),
    );
  }

  static void showErrorSnackbar(String message) {
    showSnackbar(
      title: "Error",
      message: message,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      iconData: Icons.error,
    );
  }

  static void showSuccessSnackbar(String message) {
    showSnackbar(
      title: "Success",
      message: message,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      iconData: Icons.check_circle,
    );
  }
}
