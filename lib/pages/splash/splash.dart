import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../onboarding/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigate();
    super.initState();
  }

  void navigate() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    Get.off(() => const OnboardingScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            opacity: 0.2,
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const Spacer(),
            Image.asset(
              "assets/images/logo.png",
            ),
            const SizedBox(height: 10),
            const Text(
              "Agents App",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.none,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Powered by",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    decoration: TextDecoration.none,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 5),
                Image.asset(
                  "assets/images/powlogo.png",
                  height: 30,
                  width: 30,
                  color: Colors.white,
                ),
                const SizedBox(width: 5),
                const Text(
                  "Raiju Capital",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    decoration: TextDecoration.none,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
