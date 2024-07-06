import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:topenergy/controller/retrieve_controller.dart';
import 'package:topenergy/controller/token_controller.dart';
import 'package:topenergy/pages/auth/alt_create_pin.dart';
import 'package:topenergy/pages/auth/alt_login.dart';
import 'package:topenergy/widget/bottom_widget.dart';
import 'package:topenergy/widget/custom_snackbar.dart';
import 'package:http/http.dart' as http;

class OtpController extends GetxController {
  String baseUrl = "https://topenergy.ng";
  RxBool islaoding = false.obs;
  void otpVerifier({
    required String otpTextController,
    required RetrieveController retrieveController,
    required bool isSignUp,
  }) async {
    islaoding.value = true;
    try {
      final token = await TokenStorage().getToken();
      if (token != null && token.isEmpty) {
        CustomSnackbar().showErrorMessage("Kindly Re-Auth");
        return Get.offAll(() => AltLoginScreen());
      }
      await http.get(
        Uri.parse(
          "$baseUrl/api/agent/verify-details",
        ),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
      );
      if (otpTextController == retrieveController.userDetails.value!.otpCode) {
        CustomSnackbar().showSuccessMessage("Success");
        if (isSignUp == true) {
          // Get.off(() => const CreatePinScreen());
          Get.offAll(()=> AltCreatePinScreen());
        } else {
          Get.off(() => const BottomNaviagtionScreen());
        }
      } else {
        otpTextController = "";
        CustomSnackbar().showErrorMessage("Invalid OTP. Please try again.");
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      islaoding.value = false;
    }
  }

  // void _sendVerify() async {
  //   String apiUrl = '';

  //   try {
  //     var response = await http.get(
  //       Uri.parse(apiUrl),
  //       headers: {
  //         'Authorization': 'Bearer $_token',
  //       },
  //     );
  //     if (response.statusCode == 200) {
  //       print('Response: ${response.body}');
  //     } else {
  //       print('Request failed with status: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     print('Error sending request: $e');
  //   }
  // }
}
