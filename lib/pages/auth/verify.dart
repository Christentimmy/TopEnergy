import 'package:flutter/material.dart';


class VerifyConfirmation extends StatefulWidget {
  const VerifyConfirmation({super.key});

  @override
  State<VerifyConfirmation> createState() => _VerifyConfirmationState();
}

class _VerifyConfirmationState extends State<VerifyConfirmation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset("assets/images/verify.png"),
            ),
            const SizedBox(height: 25),
            const Text(
              "Verification Complete",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 120),
            GestureDetector(
              onTap: () {
                // Get.to(()=> const Bottomnn);
              },
              child: Container(
                width: double.infinity,
                height: 45,
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 28),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color(0xff1F75D8),
                ),
                child: const Text(
                  "Continue",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    // return Container(
    //   child: Center(
    //     child: Column(
    //       children: [
    //         Image.asset("assets/image/verify.png")
    //       ],
    //     ),
    //   ),
    // );
  }
}
