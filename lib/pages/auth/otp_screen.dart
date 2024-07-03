import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:topenergy/Resources/color.dart';
import 'package:topenergy/controller/otp_controller.dart';
import 'package:topenergy/controller/retrieve_controller.dart';
import 'package:topenergy/widget/custom_button.dart';
import 'package:topenergy/widget/loading_widget.dart';

class OtpScreen extends StatefulWidget {
  final bool isSignUp;
  const OtpScreen({super.key, required this.isSignUp});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _retrieveController = Get.find<RetrieveController>();
  final TextEditingController _otpTextController = TextEditingController();
  final _otpController = Get.put(OtpController());

  @override
  void initState() {
    super.initState();
    getDetails();
  }

  void getDetails() async {
    await _retrieveController.getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppsColor.backgroundColor,
        elevation: 0,
        title: const Center(
          child: Text(
            'Verify Account',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 32),
          child: Column(
            children: [
              const SizedBox(height: 18),
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/illustration-3.png',
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Verification',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppsColor.primaryColor,
                ),
              ),
              const SizedBox(height: 10),
              Obx(
                () => Text(
                  "Enter your OTP code sent to ${_retrieveController.userDetails.value?.email ?? ""}",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 18),
              PinCodeFields(
                length: 4,
                controller: _otpTextController,
                keyboardType: TextInputType.number,
                textStyle:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                fieldHeight: 70,
                fieldWidth: 70,
                fieldBorderStyle: FieldBorderStyle.square,
                fieldBackgroundColor: Colors.white,
                activeBorderColor: AppsColor.primaryColor,
                onComplete: (value) {
                  _otpController.otpVerifier(
                    otpTextController: value,
                    retrieveController: _retrieveController,
                    isSignUp: widget.isSignUp,
                  );
                },
              ),
              const SizedBox(height: 22),
              Obx(
                () => CustomButton(
                  ontap: () {
                    _otpController.otpVerifier(
                      otpTextController: _otpTextController.text,
                      retrieveController: _retrieveController,
                      isSignUp: widget.isSignUp,
                    );
                  },
                  child: _otpController.islaoding.value
                      ? const Loader()
                      : const Padding(
                          padding: EdgeInsets.all(14.0),
                          child: Text(
                            'Verify',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 18),
              const Text(
                "Didn't you receive any code?",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 18),
              TextButton(
                onPressed: () {
                  // Add logic to resend OTP
                },
                child: const Text(
                  "Resend New Code",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppsColor.primaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
