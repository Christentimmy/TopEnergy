import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:topenergy/controller/token_controller.dart';
import 'package:topenergy/pages/home/success_page.dart';
import 'package:topenergy/widget/custom_snackbar.dart';

class PaymentController extends GetxController {
  RxBool isloading = false.obs;
  String baseUrl = "https://topenergy.ng";

  Future<void> makePayement({
    required String amount,
    required int transactionId,
  }) async {
    isloading.value = true;

    // Create the JSON body
    Map<String, dynamic> requestBody = {
      'amount': amount,
      'transaction_id': transactionId,
    };

    // Convert the body to JSON
    String jsonBody = jsonEncode(requestBody);

    final bearToken = await TokenStorage().getToken();
    if (bearToken == null) {
      debugPrint("Token is null");
      return;
    }
    // Make the POST request
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/api/agent/buy-power"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $bearToken',
        },
        body: jsonBody,
      );

      debugPrint(response.body);
      var decodedResponceBody = json.decode(response.body);
      if (decodedResponceBody["status"] != true) {
        return CustomSnackbar()
            .showErrorMessage(decodedResponceBody["responseMessage"]);
      }
      // var token = decodedResponceBody["responseMessage"]["token"];
      final token = decodedResponceBody["responseBody"]["token"];
      debugPrint("This is the toekn $token");
      Get.to(() => SuccessPageScreen(token: token));
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isloading.value = false;
    }
  }
}
