import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:pinput/pinput.dart';
import 'package:topenergy/Resources/color.dart';
import 'package:topenergy/controller/otp_controller.dart';
import 'package:topenergy/controller/retrieve_controller.dart';
import 'package:topenergy/widget/custom_button.dart';
import 'package:topenergy/widget/loading_widget.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';

class AltOtpScreen extends StatefulWidget {
  final bool isSignUp;
  const AltOtpScreen({super.key, required this.isSignUp});

  @override
  State<AltOtpScreen> createState() =>
      _AltOtpScreenState();
}

class _AltOtpScreenState extends State<AltOtpScreen> {
  @override
  void initState() {
    super.initState();
    getDetails();
  }

  void getDetails() async {
    await _retrieveController.getUserDetails();
  }

  final pinController = TextEditingController();
  String text = "";

  _onKeyboardTap(String value) {
    setState(() {
      text += value;
      pinController.text = text;
    });
  }

  final _otpController = Get.put(OtpController());
  final _retrieveController = Get.find<RetrieveController>();

  final defaultPinTheme = PinTheme(
    width: 66,
    height: 66,
    textStyle: const TextStyle(
        fontSize: 32, color: Color(0xff15141F), fontWeight: FontWeight.w800),
    decoration: BoxDecoration(
      color: const Color(0xffF9F9FA),
      //border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
      borderRadius: BorderRadius.circular(16),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          width: Get.width,
          decoration: const BoxDecoration(
            color: AppsColor.backgroundColor,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                "assets/images/wallet-card.png",
              ),
            ),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppsColor.backgroundColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.0),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(
                            0,
                            3,
                          ), // changes position of shadow
                        ),
                      ],
                    ),
                    child: ListView(
                      physics: const ClampingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          "OTP CODE",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        const SizedBox(height: 40),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            children: [
                              Text(
                                "An authentication code has been sent to",
                                style: GoogleFonts.openSans(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  textStyle:
                                      Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'user@gmail.com',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.openSans(
                                  fontSize: 16,
                                  color: Colors.white,
                                  textStyle:
                                      Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Input your OTP CODE",
                                style: GoogleFonts.openSans(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  textStyle:
                                      Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              const SizedBox(height: 40),
                              Center(
                                child: Pinput(
                                  readOnly: true,
                                  defaultPinTheme: defaultPinTheme,
                                  controller: pinController,
                                  onCompleted: (value) {
                                    _otpController.otpVerifier(
                                      otpTextController: value,
                                      retrieveController: _retrieveController,
                                      isSignUp: widget.isSignUp,
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(
                                  0,
                                  3,
                                ), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              // const SizedBox(height: 10),
                              NumericKeyboard(
                                onKeyboardTap: _onKeyboardTap,
                                textColor: Colors.black,
                                rightButtonFn: () {
                                  if (text.isNotEmpty) {
                                    setState(() {
                                      text = text.substring(0, text.length - 1);
                                      pinController.text = text;
                                    });
                                  }
                                },
                                rightIcon: const Icon(
                                  Icons.backspace,
                                  color: Colors.black,
                                ),
                                leftButtonFn: () async {},
                                leftIcon: const Icon(
                                  Icons.logout,
                                  color: Colors.red,
                                ),
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 20,
                                ),
                                child: Obx(
                                  () => CustomButton(
                                    ontap: () {
                                      _otpController.otpVerifier(
                                        otpTextController: pinController.text,
                                        retrieveController: _retrieveController,
                                        isSignUp: widget.isSignUp,
                                      );
                                    },
                                    child: _otpController.islaoding.value
                                        ? const Loader()
                                        : const Text(
                                            "Verify",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              )
            ],
          ),
        ),
      
      
      ),
    );
  }
}
