import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:topenergy/Resources/color.dart';
import 'package:topenergy/model/verify_power.dart';
import 'package:topenergy/pages/home/enter_transaction_pin.dart';
import 'package:topenergy/widget/custom_snackbar.dart';

class ContinuePurchaseScreen extends StatefulWidget {
  final VerificationResponseBody verifyPowerDetails;
  const ContinuePurchaseScreen({super.key, required this.verifyPowerDetails});

  @override
  State<ContinuePurchaseScreen> createState() => _ContinuePurchaseScreenState();
}

class _ContinuePurchaseScreenState extends State<ContinuePurchaseScreen> {
  final TextEditingController _amountController = TextEditingController();

  int calculate20Percent(int number) {
    double percentage = 0.20; // 20%
    double result = number * percentage;
    int resultAsInt = result.toInt();
    int ans = number - resultAsInt;
    return ans;
  }

  var payableAmount = 0.obs;

  @override
  void dispose() {
    super.dispose();
    _amountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          "Complete Order",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Meter Details: ",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // ListView.builder(
                    //   shrinkWrap: true,
                    //   physics: const NeverScrollableScrollPhysics(),
                    //   itemCount: meterDetails.length,
                    //   padding: const EdgeInsets.symmetric(horizontal: 15),
                    //   itemBuilder: (context, index) {
                    //     return Padding(
                    //       padding: const EdgeInsets.symmetric(vertical: 5),
                    //       child: Column(
                    //         children: [
                    //           Row(
                    //             children: [
                    //               Text(
                    //                 meterDetails[index][0],
                    //                 style: const TextStyle(fontSize: 14),
                    //               ),
                    //               const Spacer(),
                    //               Text(
                    //                 meterDetails[index][1],
                    //                 style: const TextStyle(fontSize: 14),
                    //               ),
                    //             ],
                    //           ),
                    //           const Divider(),
                    //         ],
                    //       ),
                    //     );
                    //   },
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 12),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Text(
                                "Name",
                                style: TextStyle(fontSize: 14),
                              ),
                              const Spacer(),
                              Text(
                                widget.verifyPowerDetails.customerName,
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                            ],
                          ),
                          const Divider(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 12),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Text(
                                "Meter Number",
                                style: TextStyle(fontSize: 14),
                              ),
                              const Spacer(),
                              Text(
                                widget.verifyPowerDetails.meterNumber,
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                            ],
                          ),
                          const Divider(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 12),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Text(
                                "Account Number",
                                style: TextStyle(fontSize: 14),
                              ),
                              const Spacer(),
                              Text(
                                widget.verifyPowerDetails.accountNumber,
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                            ],
                          ),
                          const Divider(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 12),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Text(
                                "Phone Number",
                                style: TextStyle(fontSize: 14),
                              ),
                              const Spacer(),
                              Text(
                                widget.verifyPowerDetails.customerPhone,
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                            ],
                          ),
                          const Divider(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 12),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Text(
                                "Business Unit",
                                style: TextStyle(fontSize: 14),
                              ),
                              const Spacer(),
                              Text(
                                widget.verifyPowerDetails.businessUnit,
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                            ],
                          ),
                          const Divider(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 12),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Text(
                                "Transaction ID",
                                style: TextStyle(fontSize: 14),
                              ),
                              const Spacer(),
                              Text(
                                widget.verifyPowerDetails.transactionId
                                    .toString(),
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                            ],
                          ),
                          const Divider(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 12),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Text(
                                "Tarrif",
                                style: TextStyle(fontSize: 14),
                              ),
                              const Spacer(),
                              Text(
                                widget.verifyPowerDetails.tariff,
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                            ],
                          ),
                          const Divider(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 12),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Text(
                                "Address",
                                style: TextStyle(fontSize: 14),
                              ),
                              const Spacer(),
                              Container(
                                constraints: const BoxConstraints(
                                  maxWidth: 220,
                                ),
                                child: Text(
                                  widget.verifyPowerDetails.address,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Divider(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 290,
                color: Colors.black,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        "Amount(₦): ",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextFormField(
                          controller: _amountController,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            payableAmount.value =
                                calculate20Percent(int.parse(value));
                          },
                          decoration: const InputDecoration(
                            hintText: "Input Amount(Minimum of 1000)",
                            hintStyle: TextStyle(
                              fontSize: 13,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Row(
                        children: [
                          Text(
                            "Commision",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "20%",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          const Text(
                            "Payable Amount: ",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          const Spacer(),
                          Obx(
                            () => Text(
                              "₦${payableAmount.toString()}",
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      GestureDetector(
                        onTap: () {
                          if (_amountController.text.isNotEmpty) {
                            Get.to(
                              () => EnterTransactionPinScreen(
                                amount: _amountController.text,
                                verifyPowerDetails: widget.verifyPowerDetails,
                              ),
                            );
                          } else {
                            CustomSnackbar().showErrorMessage("Enter Amount");
                          }
                        },
                        child: Container(
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppsColor.primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            "Proceed to pay",
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
