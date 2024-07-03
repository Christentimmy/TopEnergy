import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:topenergy/Resources/color.dart';
import 'package:topenergy/pages/auth/alt_login.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  final RxInt _currentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        padding: const EdgeInsets.only(bottom: 20),
        color: AppsColor.backgroundColor,
        child: Row(
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
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 360,
                child: PageView(
                  controller: _controller,
                  onPageChanged: (value) {
                    _currentIndex.value = value;
                  },
                  children: [
                    SizedBox(
                      height: 350,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/powava.png"),
                              ),
                            ),
                          ),
                          const SizedBox(height: 50),
                          const Text(
                            "Reconnect back with few clicks!",
                            style: TextStyle(
                              color: AppsColor.primaryColor,
                              fontSize: 17,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              "Top up your electricity units at your comfort anytime, anywhere with Topenergy.ng Mobile App",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w100,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 350,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/slider2.png"),
                              ),
                            ),
                          ),
                          const SizedBox(height: 50),
                          const Text(
                            "Right Value for your money",
                            style: TextStyle(
                              color: AppsColor.primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25),
                            child: Text(
                              "Always available for pay bill or purchase electricity units on Topenergy.ng Mobile App",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w100,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: [
                    const Text(
                      "Skip",
                      style: TextStyle(color: Colors.white),
                    ),
                    const Spacer(),
                    Obx(
                      () => AnimatedSmoothIndicator(
                        activeIndex: _currentIndex.value,
                        count: 2,
                        effect: const WormEffect(
                          activeDotColor: AppsColor.primaryColor,
                          dotHeight: 12,
                          dotWidth: 12,
                        ),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        _currentIndex.value == 1
                            ? Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                                builder: (context) => AltLoginScreen(),
                              ))
                            : _controller.jumpToPage(2);
                      },
                      child: Container(
                        width: 45,
                        height: 45,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 5,
                            color: Colors.white,
                          ),
                        ),
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
