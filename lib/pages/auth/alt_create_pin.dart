import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:pinput/pinput.dart';
import 'package:topenergy/Resources/color.dart';
import 'package:topenergy/controller/transaction_controller.dart';
import 'package:topenergy/widget/custom_button.dart';
import 'package:topenergy/widget/loading_widget.dart';

class AltCreatePinScreen extends StatelessWidget {
  AltCreatePinScreen({super.key});

  final _pinController = TextEditingController();
  final _transactionController = Get.put(TransactionController());

  final defaultPinTheme = PinTheme(
    width: 66,
    height: 66,
    textStyle: const TextStyle(
      fontSize: 32,
      color: Color(0xff15141F),
      fontWeight: FontWeight.w800,
    ),
    decoration: BoxDecoration(
      color: const Color(0xffF9F9FA),
      //border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
      borderRadius: BorderRadius.circular(16),
    ),
  );

  final RxString _text = "".obs;

  _onKeyboardTap(String value) {
    _text.value += value;
    _pinController.text = _text.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        decoration: BoxDecoration(
          color: AppsColor.backgroundColor.withOpacity(0.1),
          image: const DecorationImage(
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
                    color: const Color.fromARGB(255, 11, 41, 77),
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
                        "PIN CODE",
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
                              "Create Your Transaction Pin",
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
                              "Enter pin code below",
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
                                controller: _pinController,
                                onCompleted: (value) {},
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
                                if (_text.value.isNotEmpty) {
                                  _text.value = _text.value
                                      .substring(0, _text.value.length - 1);
                                  _pinController.text = _text.value;
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 20,
                              ),
                              child: Obx(
                                () => CustomButton(
                                  ontap: () {
                                    _transactionController.createTransactionPin(
                                        _pinController.text, );
                                  },
                                  child: _transactionController.isloading.value
                                      ? const Loader()
                                      : const Text(
                                          "Done",
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
    );
  }
}
