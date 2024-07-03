import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:topenergy/controller/transaction_controller.dart';
import 'package:topenergy/model/transaction_model.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

const double _bottomPaddingForButton = 150.0;
// const double _buttonHeight = 56.0;
// const double _buttonWidth = 200.0;
const double _pagePadding = 16.0;
const double _pageBreakpoint = 768.0;
// const double _heroImageHeight = 250.0;
// const Color _lightThemeShadowColor = Color(0xFFE4E4E4);
// const Color _darkThemeShadowColor = Color(0xFF121212);
// const Color _darkSabGradientColor = Color(0xFF313236);

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  final pageIndexNotifier = ValueNotifier(0);
  bool isContainerVisible = false;

  void _copyToClipboard(String token) {
    Clipboard.setData(ClipboardData(text: token));
  }

  final _transactionController = Get.find<TransactionController>();

  SliverWoltModalSheetPage page1({
    required BuildContext modalSheetContext,
    required TextTheme textTheme,
    required TransactionModel transModel,
  }) {
    return WoltModalSheetPage(
      hasSabGradient: false,
      topBarTitle: const Text(
        'Transaction Details',
        style: TextStyle(
          fontWeight: FontWeight.w800,
        ),
      ),
      isTopBarLayerAlwaysVisible: true,
      trailingNavBarWidget: IconButton(
        padding: const EdgeInsets.all(_pagePadding),
        icon: const Icon(Icons.close),
        onPressed: Navigator.of(modalSheetContext).pop,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          _pagePadding,
          _pagePadding,
          _pagePadding,
          _bottomPaddingForButton,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        "Token",
                        style: TextStyle(fontSize: 14),
                      ),
                      const Spacer(),
                      Container(
                        constraints: const BoxConstraints(
                          maxWidth: 180,
                        ),
                        child: Text(
                          transModel.token,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          _copyToClipboard(transModel.token);
                        },
                        child: const Icon(
                          Icons.copy,
                          size: 20,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                  const Divider(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        "Reference_id",
                        style: TextStyle(fontSize: 14),
                      ),
                      const Spacer(),
                      Container(
                        constraints: const BoxConstraints(
                          maxWidth: 180,
                        ),
                        child: Text(
                          transModel.referenceId,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        "Meter Number",
                        style: TextStyle(fontSize: 14),
                      ),
                      const Spacer(),
                      Container(
                        constraints: const BoxConstraints(
                          maxWidth: 180,
                        ),
                        child: Text(
                          transModel.meterNumber,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        "Units",
                        style: TextStyle(fontSize: 14),
                      ),
                      const Spacer(),
                      Container(
                        constraints: const BoxConstraints(
                          maxWidth: 180,
                        ),
                        child: Text(
                          transModel.units,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        "Transaction_id",
                        style: TextStyle(fontSize: 14),
                      ),
                      const Spacer(),
                      Container(
                        constraints: const BoxConstraints(
                          maxWidth: 180,
                        ),
                        child: Text(
                          transModel.transactionId,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        "Number",
                        style: TextStyle(fontSize: 14),
                      ),
                      const Spacer(),
                      Container(
                        constraints: const BoxConstraints(
                          maxWidth: 180,
                        ),
                        child: Text(
                          transModel.number,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        "Amount",
                        style: TextStyle(fontSize: 14),
                      ),
                      const Spacer(),
                      Container(
                        constraints: const BoxConstraints(
                          maxWidth: 180,
                        ),
                        child: Text(
                          transModel.amount,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        "Created_at",
                        style: TextStyle(fontSize: 14),
                      ),
                      const Spacer(),
                      Container(
                        constraints: const BoxConstraints(
                          maxWidth: 180,
                        ),
                        child: Text(
                          DateFormat("mmm dd yyyy")
                              .format(transModel.createdAt),
                          textAlign: TextAlign.justify,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        "Updated_at",
                        style: TextStyle(fontSize: 14),
                      ),
                      const Spacer(),
                      Container(
                        constraints: const BoxConstraints(
                          maxWidth: 180,
                        ),
                        child: Text(
                          DateFormat("mmm dd yyyy")
                              .format(transModel.updatedAt),
                          textAlign: TextAlign.justify,
                          style: const TextStyle(fontSize: 14),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Transaction",
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: Column(
            children: [
              const Row(
                children: [
                  Text(
                    "History",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Sort: Most Recent",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_down_outlined),
                ],
              ),
              const SizedBox(height: 20),
              Obx(
                () => _transactionController.transactionHistory.isEmpty
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height / 1.7,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.network(
                              "https://app.lottiefiles.com/animation/502e0f27-7adf-44c3-821b-bd5c35f63a03",
                            ),
                            const Text("Transaction is Empty"),
                          ],
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemCount:
                              _transactionController.transactionHistory.length,
                          itemBuilder: (context, index) {
                            TransactionModel transModel = _transactionController
                                .transactionHistory[index];
                            return TransactionCard(
                              ontap: () {
                                showTransactionDetails(transModel: transModel);
                              },
                              transactionModel: transModel,
                            );
                          },
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showTransactionDetails({required TransactionModel transModel}) {
    WoltModalSheet.show<void>(
      pageIndexNotifier: pageIndexNotifier,
      context: context,
      pageListBuilder: (modalSheetContext) {
        final textTheme = Theme.of(context).textTheme;
        return [
          page1(
            modalSheetContext: modalSheetContext,
            textTheme: textTheme,
            transModel: transModel,
          ),
        ];
      },
      modalTypeBuilder: (context) {
        final size = MediaQuery.of(context).size.width;
        if (size < _pageBreakpoint) {
          return WoltModalType.bottomSheet;
        } else {
          return WoltModalType.dialog;
        }
      },
      onModalDismissedWithBarrierTap: () {
        debugPrint('Closed modal sheet with barrier tap');
        Navigator.of(context).pop();
        pageIndexNotifier.value = 0;
      },
      maxDialogWidth: 560,
      minDialogWidth: 400,
      minPageHeight: 0.0,
      maxPageHeight: 0.9,
    );
  }
}

class TransactionCard extends StatelessWidget {
  final VoidCallback ontap;

  final TransactionModel transactionModel;
  const TransactionCard({
    super.key,
    required this.ontap,
    required this.transactionModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: ontap,
          contentPadding: const EdgeInsets.symmetric(horizontal: 0),
          leading: Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 1),
                  color: Color.fromARGB(40, 0, 0, 0),
                  blurRadius: 3,
                  spreadRadius: 1,
                )
              ],
            ),
            child: const Icon(Icons.power),
          ),
          horizontalTitleGap: 10,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transactionModel.billType,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                DateFormat("MMM dd yyyy").format(transactionModel.createdAt),
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          trailing: Text(
            "₦${transactionModel.amount}",
            style: const TextStyle(color: Colors.red),
          ),
        ),
        const Divider(
          color: Color.fromARGB(255, 223, 223, 223),
        ),
      ],
    );
  }
}
