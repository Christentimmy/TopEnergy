import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:topenergy/controller/token_controller.dart';
import 'package:topenergy/model/transaction_model.dart';
import 'package:topenergy/model/verify_power.dart';
import 'package:topenergy/pages/home/continue_purchase.dart';
import 'package:topenergy/widget/custom_snackbar.dart';

class TransactionController extends GetxController {
  RxList<TransactionModel> transactionHistory = <TransactionModel>[].obs;
  RxBool isloading = false.obs;
  String baseUrl = 'https://topenergy.ng';

  Future<void> getTransactionHistory() async {
    isloading.value = true;
    try {
      final token = await TokenStorage().getToken();
      if (token == null) {
        debugPrint("Token is null");
        return;
      }
      final response = await http.get(
        Uri.parse("$baseUrl/api/agent/transactions"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      final decodedResponceBody = json.decode(response.body);
      if (decodedResponceBody["status"] != true) {
        return CustomSnackbar()
            .showErrorMessage(decodedResponceBody["responseMessage"]);
      }
      final List transactionList = decodedResponceBody["responseBody"];
      final mapped = transactionList
          .map((element) => TransactionModel.fromJson(element))
          .toList();
      transactionHistory.value = mapped;
      print(transactionHistory.length);
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isloading.value = false;
    }
  }

  Future<void> verifyMeterNumber(
    String disco,
    String meterNumber,
    String meterType,
  ) async {
    isloading.value = true;
    Stopwatch stop = Stopwatch()..start();

    // Make the POST request
    try {
      Stopwatch tokenTime = Stopwatch()..start();
      final bearToken = await TokenStorage().getToken();
      if (bearToken == null) {
        debugPrint("Token is null");
        return;
      }
      tokenTime.stop();
      print("token Retrieve and validation: ${tokenTime.elapsed}");
      Stopwatch networkTime = Stopwatch()..start();
      final body = jsonEncode({
        'disCo': disco,
        'meterNo': meterNumber,
        'meterType': meterType,
      });

      final response = await http.post(
        Uri.parse("$baseUrl/api/agent/verify-power"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $bearToken',
        },
        body: body,
      );
      networkTime.stop();
      print("Network: ${networkTime.elapsed}");

      var decodedResponceBody = json.decode(response.body);
      print(decodedResponceBody);
      if (decodedResponceBody["status"] != true) {
        return CustomSnackbar()
            .showErrorMessage(decodedResponceBody["responseMessage"]);
      }
      VerificationResponseBody verifyPower = VerificationResponseBody.fromJson(
          decodedResponceBody["responseBody"]);
      Get.to(
        () => ContinuePurchaseScreen(
          verifyPowerDetails: verifyPower,
        ),
      );
      stop.stop();
      print("Execution Time: ${stop.elapsed}");
    } catch (e) {
      debugPrint('Error making HTTP request: $e');
    } finally {
      isloading.value = false;
    }
  }
}
