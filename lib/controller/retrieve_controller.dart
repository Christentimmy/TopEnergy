import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:topenergy/controller/token_controller.dart';
import 'package:topenergy/model/retrieve_model.dart';
import 'package:topenergy/widget/custom_snackbar.dart';


class RetrieveController extends GetxController {
  final userDetails = Rx<RetrieveBody?>(null);
  String baseUrl = "https://topenergy.ng";

  @override
  void onInit() {
    super.onInit();
    getUserDetails();
  }

  Future<void> getUserDetails() async {
    final token = await TokenStorage().getToken();
    if (token == null) {
      debugPrint("Token is null");
      return;
    }

    
    // Make the POST request
    try {
      final response = await http.get(
        Uri.parse("$baseUrl/api/agent/details"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      final decodedResponceBody = json.decode(response.body);
      if (response.statusCode != 200) {
        return CustomSnackbar()
            .showErrorMessage(decodedResponceBody["responseMessage"]);
      }

      var responseBody = decodedResponceBody["responseBody"];
      RetrieveBody user = RetrieveBody.fromJson(responseBody);
      userDetails.value = user;
    } catch (e) {
      debugPrint('Error making HTTP request: $e');
    }
  }

  // Future<void> getBalance() async {
  //   SharedPreferences _prefs = await SharedPreferences.getInstance();
  //   String? _bearToken = _prefs.getString("token");
  //   if (_bearToken == null) {
  //     debugPrint("Token is null");
  //     return;
  //   }
  //   // Make the POST request
  //   try {
  //     final response = await http.get(
  //       Uri.parse("$baseUrl//api/agent/wallet"),
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Authorization': 'Bearer $_bearToken',
  //       },
  //     );

  //     if (response.statusCode == 200) {
  //       var decodedResponceBody = json.decode(response.body);
  //       var responseBody = decodedResponceBody["responseBody"];
  //       UserModel user = UserModel.fromJson(responseBody);
  //       // _balance.value = responseBody["balance"];
  //       // _commission.value = responseBody["commission_balance"];
  //     } else {
  //       print('Request failed with status: ${response.statusCode}');
  //       print('Response body: ${response.body}');
  //     }
  //   } catch (e) {
  //     print('Error making HTTP request: $e');
  //   }
  // }
}
