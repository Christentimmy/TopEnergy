import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:topenergy/controller/retrieve_controller.dart';
import 'package:topenergy/controller/token_controller.dart';
import 'package:topenergy/controller/transaction_controller.dart';
import 'package:topenergy/model/user_model.dart';
import 'package:topenergy/pages/auth/otp_screen.dart';
import 'package:topenergy/widget/bottom_widget.dart';
import 'package:topenergy/widget/custom_snackbar.dart';

class AuthController extends GetxController {
  RxBool isloading = false.obs;
  String baseUrl = "https://topenergy.ng";

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    isloading.value = true;
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/agent/login'),
        body: {
          'email': email,
          'password': password,
        },
      );
      final Map<String, dynamic> data = json.decode(response.body);
      if (data["responseMessage"] == "Invalid credentials") {
        return CustomSnackbar().showErrorMessage(data["responseMessage"]);
      }
      UserModel userDetails =
          UserModel.fromJson(data["responseBody"]["user_details"]);
      if (userDetails.active != "1") {
        Get.to(() => const OtpScreen(isSignUp: false));
        return CustomSnackbar().showErrorMessage(data["responseMessage"]);
      }
      if (data['status'] != true) {
        return CustomSnackbar().showErrorMessage(data["responseMessage"]);
      }
      TokenStorage tokenStorage = TokenStorage();
      await tokenStorage.storeToken(userDetails.token);
      final controller = Get.find<RetrieveController>();
      final transController = Get.find<TransactionController>();
      await controller.getUserDetails();
      await transController.getTransactionHistory();
      Get.to(() => const BottomNaviagtionScreen());
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isloading.value = false;
    }
  }
  Future<void> signUpUser({
    required String fullName,
    required String email,
    required String phoneNumber,
    required String password,
    String? referralCode,
  }) async {
    isloading.value = true;
    try {
      final response = await http.post(
        Uri.parse(
          "$baseUrl/api/agent/register",
        ),
        body: {
          'full_name': fullName,
          'email': email,
          'phone_number': phoneNumber,
          'password': password,
          "referral_code": referralCode ?? "",
        },
      );
      final decoded = json.decode(response.body);
      print(decoded);
      if (decoded["status"] == false) {
        return CustomSnackbar().showErrorMessage(decoded["responseMessage"]);
      }
      await TokenStorage().deleteToken();
      await TokenStorage().storeToken(decoded["responseBody"]["token"]);
      final controller = Get.find<RetrieveController>();
      final transController = Get.find<TransactionController>();
      await controller.getUserDetails();
      await transController.getTransactionHistory();
      Get.to(() => const OtpScreen(isSignUp: true));
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isloading.value = false;
    }
  }


}
