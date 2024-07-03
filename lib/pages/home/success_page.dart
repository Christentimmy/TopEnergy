import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:topenergy/Resources/color.dart';
import 'package:topenergy/widget/bottom_widget.dart';

class SuccessPageScreen extends StatefulWidget {
  final String token;
  const SuccessPageScreen({super.key, required this.token});

  @override
  State<SuccessPageScreen> createState() => _SuccessPageScreenState();
}

class _SuccessPageScreenState extends State<SuccessPageScreen> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    void copyToClipboard(token) {
      Clipboard.setData(ClipboardData(text: token));
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("assets/images/purchasesucc.json"),
            const SizedBox(height: 16),
            Text(
              isLoading ? 'Loading...' : 'Success!',
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            RichText(
              text: const TextSpan(children: [
                TextSpan(
                  text: "Your order has been placed ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                TextSpan(
                  text: "Order History",
                  style: TextStyle(
                    color: AppsColor.primaryColor,
                    fontSize: 17,
                  ),
                ),
                TextSpan(),
              ]),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Token: ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  widget.token.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    copyToClipboard(widget.token);
                  },
                  child: const Icon(
                    Icons.copy,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Get.offAll(() => const BottomNaviagtionScreen());
              },
              child: Container(
                width: 150,
                height: 45,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppsColor.primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "Go Home",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
