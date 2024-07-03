import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:topenergy/pages/auth/reset_password.dart';

import '../../Resources/color.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Verification",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        leading: const Icon(
          Icons.keyboard_arrow_left_outlined,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Please enter your email to receive verification code",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  "Email: ",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  style: const TextStyle(
                    fontSize: 15.5,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email, size: 20),
                    hintStyle: const TextStyle(
                      fontSize: 12,
                    ),
                    hintText: "user@gmail.com",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(55, 0, 0, 0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppsColor.backgroundColor,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 80),
              GestureDetector(
                onTap: () {
                  Get.to(()=> const ResetPassword());
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10),
                     color: AppsColor.primaryColor,
                  ),
                  child: const Text("Proceed", style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
