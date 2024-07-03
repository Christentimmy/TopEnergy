import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:topenergy/Resources/color.dart';
import 'package:topenergy/controller/payment_controller.dart';
import 'package:topenergy/controller/retrieve_controller.dart';
import 'package:topenergy/model/verify_power.dart';
import 'package:topenergy/widget/custom_button.dart';
import 'package:topenergy/widget/custom_snackbar.dart';
import 'package:topenergy/widget/loading_widget.dart';

class EnterTransactionPinScreen extends StatefulWidget {
  final String amount;
  final VerificationResponseBody verifyPowerDetails;
  const EnterTransactionPinScreen({
    super.key,
    required this.amount,
    required this.verifyPowerDetails,
  });

  @override
  State<EnterTransactionPinScreen> createState() =>
      _EnterTransactionPinScreenState();
}

class _EnterTransactionPinScreenState extends State<EnterTransactionPinScreen> {
  // final TextEditingController _text1 = TextEditingController();
  // final TextEditingController _text2 = TextEditingController();
  // final TextEditingController _text3 = TextEditingController();
  // final TextEditingController _text4 = TextEditingController();

  final _pinController = TextEditingController();
  final _retrieveController = Get.find<RetrieveController>();
  final _paymentController = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   backgroundColor: Colors.white,
    //   appBar: AppBar(
    //     title: const Text(
    //       "Security",
    //       style: TextStyle(
    //         fontSize: 20,
    //         fontWeight: FontWeight.w800,
    //       ),
    //     ),
    //     centerTitle: true,
    //     leading: IconButton(
    //       onPressed: () => Get.back(),
    //       icon: const Icon(
    //         Icons.arrow_back_ios,
    //       ),
    //     ),
    //   ),
    //   body: SafeArea(
    //     child: Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           const SizedBox(height: 20),
    //           Center(
    //             child: Container(
    //               height: 65,
    //               width: 65,
    //               alignment: Alignment.center,
    //               decoration: BoxDecoration(
    //                 color: Colors.blue,
    //                 borderRadius: BorderRadius.circular(15),
    //               ),
    //               child: const Icon(
    //                 Icons.lock,
    //                 size: 30,
    //                 color: Colors.white,
    //               ),
    //             ),
    //           ),
    //           const SizedBox(height: 10),
    //           const Center(
    //             child: Text(
    //               "Enter Your Transaction Pin",
    //               style: TextStyle(
    //                 fontSize: 17,
    //                 fontWeight: FontWeight.w500,
    //               ),
    //             ),
    //           ),
    //           const SizedBox(height: 20),
    //           Form(
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 Container(
    //                   height: 60,
    //                   width: 58,
    //                   decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(10),
    //                     border: Border.all(
    //                       width: 2,
    //                       color: Colors.blue,
    //                     ),
    //                   ),
    //                   child: TextField(
    //                     controller: _text1,
    //                     onChanged: (value) {
    //                       if (value.length == 1) {
    //                         FocusScope.of(context).nextFocus();
    //                       }
    //                     },
    //                     style: const TextStyle(
    //                       fontSize: 16,
    //                       fontWeight: FontWeight.w500,
    //                     ),
    //                     inputFormatters: [
    //                       LengthLimitingTextInputFormatter(1),
    //                       FilteringTextInputFormatter.digitsOnly,
    //                     ],
    //                     textAlign: TextAlign.center,
    //                     keyboardType: TextInputType.number,
    //                     decoration: const InputDecoration(
    //                       enabledBorder: OutlineInputBorder(
    //                         borderSide: BorderSide.none,
    //                       ),
    //                       focusedBorder: OutlineInputBorder(
    //                         borderSide: BorderSide.none,
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //                 Container(
    //                   height: 60,
    //                   width: 58,
    //                   decoration: BoxDecoration(
    //                       borderRadius: BorderRadius.circular(10),
    //                       border: Border.all(
    //                         width: 2,
    //                         color: Colors.blue,
    //                       )),
    //                   child: TextField(
    //                     controller: _text2,
    //                     onChanged: (value) {
    //                       if (value.length == 1) {
    //                         FocusScope.of(context).nextFocus();
    //                       }
    //                     },
    //                     style: const TextStyle(
    //                       fontSize: 16,
    //                       fontWeight: FontWeight.w500,
    //                     ),
    //                     inputFormatters: [
    //                       LengthLimitingTextInputFormatter(1),
    //                       FilteringTextInputFormatter.digitsOnly,
    //                     ],
    //                     textAlign: TextAlign.center,
    //                     keyboardType: TextInputType.number,
    //                     decoration: const InputDecoration(
    //                       enabledBorder: OutlineInputBorder(
    //                         borderSide: BorderSide.none,
    //                       ),
    //                       focusedBorder: OutlineInputBorder(
    //                         borderSide: BorderSide.none,
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //                 Container(
    //                   height: 60,
    //                   width: 58,
    //                   decoration: BoxDecoration(
    //                       borderRadius: BorderRadius.circular(10),
    //                       border: Border.all(
    //                         width: 2,
    //                         color: Colors.blue,
    //                       )),
    //                   child: TextField(
    //                     controller: _text3,
    //                     onChanged: (value) {
    //                       if (value.length == 1) {
    //                         FocusScope.of(context).nextFocus();
    //                       }
    //                     },
    //                     style: const TextStyle(
    //                       fontSize: 16,
    //                       fontWeight: FontWeight.w500,
    //                     ),
    //                     inputFormatters: [
    //                       LengthLimitingTextInputFormatter(1),
    //                       FilteringTextInputFormatter.digitsOnly,
    //                     ],
    //                     textAlign: TextAlign.center,
    //                     keyboardType: TextInputType.number,
    //                     decoration: const InputDecoration(
    //                       enabledBorder: OutlineInputBorder(
    //                         borderSide: BorderSide.none,
    //                       ),
    //                       focusedBorder: OutlineInputBorder(
    //                         borderSide: BorderSide.none,
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //                 Container(
    //                   height: 60,
    //                   width: 58,
    //                   decoration: BoxDecoration(
    //                       borderRadius: BorderRadius.circular(10),
    //                       border: Border.all(
    //                         width: 2,
    //                         color: Colors.blue,
    //                       )),
    //                   child: TextField(
    //                     controller: _text4,
    //                     onChanged: (value) {
    //                       if (value.length == 1) {
    //                         FocusScope.of(context).nextFocus();
    //                       }
    //                     },
    //                     style: const TextStyle(
    //                       fontSize: 16,
    //                       fontWeight: FontWeight.w500,
    //                     ),
    //                     inputFormatters: [
    //                       LengthLimitingTextInputFormatter(1),
    //                       FilteringTextInputFormatter.digitsOnly,
    //                     ],
    //                     textAlign: TextAlign.center,
    //                     keyboardType: TextInputType.number,
    //                     decoration: const InputDecoration(
    //                       enabledBorder: OutlineInputBorder(
    //                         borderSide: BorderSide.none,
    //                       ),
    //                       focusedBorder: OutlineInputBorder(
    //                         borderSide: BorderSide.none,
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           const Spacer(),
    //           Obx(
    //             () => GestureDetector(
    //               onTap: () {
    //                 String enteredPin =
    //                     _text1.text + _text2.text + _text3.text + _text4.text;
    //                 if (enteredPin ==
    //                     _retrieveController.userDetails.value!.pin) {
    //                   makePayement(widget.amount);
    //                 } else {
    //                   Get.snackbar("Error", "Incorrect Pin");
    //                 }
    //               },
    //               child: Center(
    //                 child: Container(
    //                   margin: const EdgeInsets.symmetric(vertical: 10),
    //                   height: 45,
    //                   width: 300,
    //                   alignment: Alignment.center,
    //                   decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(15),
    //                     color: Colors.blue,
    //                   ),
    //                   child: _isloading.value
    //                       ? const CircularProgressIndicator(
    //                           color: Colors.white,
    //                         )
    //                       : const Text(
    //                           "Proceed",
    //                           style: TextStyle(
    //                             color: Colors.white,
    //                             fontWeight: FontWeight.w500,
    //                           ),
    //                         ),
    //                 ),
    //               ),
    //             ),
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // );
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: const Text(
            "Verification",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // const SizedBox(height: 20),
                  Lottie.asset("assets/images/enterpin.json", height: 200),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    textAlign: TextAlign.center,
                    "Enter Your 4-digits Pin",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.2,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  PinCodeTextField(
                    hintCharacter: "",
                    keyboardType: TextInputType.number,
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppsColor.backgroundColor,
                      fontSize: 20,
                    ),
                    length: 4,
                    obscureText: false,
                    controller: _pinController,
                    animationType: AnimationType.fade,
                    cursorColor: Colors.deepPurple,
                    pinTheme: PinTheme(
                      errorBorderColor: Colors.red,
                      borderWidth: 0,
                      // activeColor: AppColor.greyHint,
                      activeColor: Colors.grey,
                      activeFillColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      shape: PinCodeFieldShape.circle,
                      inactiveColor: Colors.grey,
                      selectedColor: Colors.deepPurpleAccent,
                      selectedFillColor: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      fieldHeight: 60,
                      fieldWidth: MediaQuery.of(context).size.width / 5,
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    onCompleted: (value) {
                      if (value == _retrieveController.userDetails.value!.pin) {
                        // makePayement(widget.amount);
                        _paymentController.makePayement(
                          amount: widget.amount,
                          transactionId:
                              widget.verifyPowerDetails.transactionId,
                        );
                      } else {
                        CustomSnackbar().showErrorMessage("Incorrect Pin!");
                      }
                    },
                    boxShadows: const [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(1, -2),
                        blurRadius: 5,
                      ),
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(-1, 2),
                        blurRadius: 5,
                      )
                    ],
                    beforeTextPaste: (text) {
                      return true;
                    },
                    appContext: context,
                  ),
                  const SizedBox(height: 10),
                  Obx(
                    () => CustomButton(
                      ontap: () async {
                        if (_pinController.text ==
                            _retrieveController.userDetails.value!.pin) {
                          _paymentController.makePayement(
                            amount: widget.amount,
                            transactionId:
                                widget.verifyPowerDetails.transactionId,
                          );
                        } else {
                          Get.snackbar("Error", "Incorrect Pin");
                        }
                      },
                      child: _paymentController.isloading.value
                          ? const Loader()
                          : const Text(
                              "Next",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
