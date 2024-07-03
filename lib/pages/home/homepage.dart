import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:topenergy/Resources/color.dart';
import 'package:topenergy/Resources/constants.dart';
import 'package:topenergy/controller/retrieve_controller.dart';
import 'package:topenergy/pages/home/buy_airtime.dart';
import 'package:topenergy/pages/home/buy_electricity.dart';
import 'package:topenergy/pages/home/transaction_screen.dart';
import 'package:topenergy/pages/home/wallet_screen.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final _retrieveController = Get.find<RetrieveController>();

  final List _allServices = [
    [Icons.shopping_cart, "Electricity"],
    [Icons.call, "Airtime/Data"],
    [Icons.document_scanner, "History"],
    [FontAwesomeIcons.award, "Meters"],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 430,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Obx(
                  () => UpperWidget(
                    balance:
                        _retrieveController.userDetails.value?.acctBalance ??
                            "",
                    commission:
                        _retrieveController.userDetails.value?.acctCommission ??
                            "",
                    name: _retrieveController.userDetails.value?.name ?? "",
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 70,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 1),
                        color: Color.fromARGB(48, 0, 0, 0),
                        spreadRadius: 2,
                        blurRadius: 5,
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Top up Account",
                        style: TextStyle(
                          color: AppsColor.primaryColor,
                          fontWeight: FontWeight.w800,
                          fontSize: 17,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "23383938223",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(width: 5),
                          GestureDetector(
                            child: const Icon(Icons.copy),
                            onTap: () {
                              Clipboard.setData(
                                const ClipboardData(text: "23383938223"),
                              );
                            },
                          ),
                        ],
                      ),
                      const Text(
                        "Wema Bank",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Services",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  Center(
                    child: Container(
                      height: 80,
                      width: 320,
                      margin: const EdgeInsets.symmetric(vertical: 2),
                      child: ListView.builder(
                        itemCount: _allServices.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return ServiceCard(
                            allServices: _allServices,
                            index: index,
                            onTap: () {
                              if (index == 0) {
                                Get.to(() => const ButElectricityScreen());
                              } else if (index == 1) {
                                Get.to(() => const BuyAirtime());
                              } else if (index == 2) {
                                Get.to(() => const TransactionPage());
                              } else if (index == 3) {
                                Get.to(() => const ButElectricityScreen());
                              }
                            },
                          );
                        },
                      ),
                    ),
                  ),

                  ListTile(
                    onTap: () {},
                    contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                    leading: Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 1),
                              color: Color.fromARGB(96, 0, 0, 0),
                              blurRadius: 3,
                              spreadRadius: 1,
                            )
                          ]),
                      child: const Icon(Icons.power),
                    ),
                    horizontalTitleGap: 10,
                    title: const Text(
                      "20 units of power",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios_outlined),
                  ),
                  // const SizedBox(height: 0),
                  const Spacer(),
                  Container(
                    height: 90,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        width: 1,
                        color: Colors.black,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 65,
                          width: 85,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            "Ads Image",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        const SizedBox(width: 35),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Ads First Text",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Text(
                              "Ads Second Text",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Container(),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final int index;
  final VoidCallback onTap;
  const ServiceCard({
    super.key,
    required List allServices,
    required this.index,
    required this.onTap,
  }) : _allServices = allServices;

  final List _allServices;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 68,
        height: 45,
        margin: const EdgeInsets.symmetric(
          horizontal: 6,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1,
            color: const Color.fromARGB(73, 0, 0, 0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _allServices[index][0],
              size: 25,
            ),
            Text(
              _allServices[index][1],
              style: const TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UpperWidget extends StatefulWidget {
  final String balance;
  final String commission;
  final String name;
  const UpperWidget({
    super.key,
    required this.balance,
    required this.commission,
    required this.name,
  });

  @override
  State<UpperWidget> createState() => _UpperWidgetState();
}

class _UpperWidgetState extends State<UpperWidget> {
  bool isPrice = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 50),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
        // color: AppsColor.backgroundColor,
        image: DecorationImage(
          image: AssetImage("assets/images/background.jpg"),
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(Color.fromARGB(92, 0, 0, 0), BlendMode.darken),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 55),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Welcome,",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    capitalize(widget.name),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              const Icon(
                Icons.notifications,
                size: 25,
                color: Colors.white,
              )
            ],
          ),
          const SizedBox(height: 35),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const Text(
                        "Balance (₦)",
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isPrice = !isPrice;
                          });
                        },
                        child: const Icon(
                          Icons.remove_red_eye,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                  isPrice
                      ? const Text(
                          "***********",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w700),
                        )
                      : Text(
                          formatNumber(widget.balance),
                          // widget.balance.toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w700),
                        )
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => WalletHomePage(
                            commission: widget.commission,
                            balance: widget.balance,
                          ));
                    },
                    child: const CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      child: Icon(
                        FontAwesomeIcons.wallet,
                        size: 18,
                        color: AppsColor.primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Wallet",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => const TransactionPage());
                },
                child: const Column(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      child: Icon(FontAwesomeIcons.fileLines, size: 18),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Transaction",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => const ButElectricityScreen());
                },
                child: const Column(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      child: Icon(
                        FontAwesomeIcons.award,
                        color: AppsColor.primaryColor,
                        size: 18,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Meter",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(),
        ],
      ),
    );
  }
}
