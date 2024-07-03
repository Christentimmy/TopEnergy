import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:topenergy/Resources/color.dart';
import 'package:topenergy/pages/home/swap_screen_details.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class WalletHomePage extends StatefulWidget {
  final String commission;
  final String balance;
  const WalletHomePage({
    super.key,
    required this.commission,
    required this.balance,
  });

  @override
  State<WalletHomePage> createState() => _WalletHomePageState();
}

const double _bottomPaddingForButton = 150.0;
const double _pagePadding = 16.0;
const double _pageBreakpoint = 768.0;

class _WalletHomePageState extends State<WalletHomePage> {
  final pageIndexNotifier = ValueNotifier(0);

  SliverWoltModalSheetPage page1(
    BuildContext modalSheetContext,
    TextTheme textTheme,
  ) {
    return WoltModalSheetPage(
      hasSabGradient: false,
      hasTopBarLayer: false,
      backgroundColor: const Color.fromARGB(255, 8, 8, 8),
      isTopBarLayerAlwaysVisible: false,
      trailingNavBarWidget: IconButton(
        padding: const EdgeInsets.all(_pagePadding),
        icon: const Icon(
          Icons.close,
          color: Colors.white,
        ),
        onPressed: Navigator.of(modalSheetContext).pop,
      ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(
          _pagePadding,
          _pagePadding,
          _pagePadding,
          _bottomPaddingForButton,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            const Text(
              "Virtual Bank Account Details",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "23892893308",
                  style: TextStyle(
                    color: AppsColor.primaryColor,
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.copy,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const Text(
              "wema Bank",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              "Money transferred to the bank account above will automatically added to your Top Energy Wallet",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverWoltModalSheetPage swap(
    BuildContext modalSheetContext,
    TextTheme textTheme,
  ) {
    return WoltModalSheetPage(
      hasSabGradient: false,
      isTopBarLayerAlwaysVisible: false,
      trailingNavBarWidget: IconButton(
        padding: const EdgeInsets.all(_pagePadding),
        icon: const Icon(Icons.close, color: Colors.black),
        onPressed: () => Navigator.of(modalSheetContext).pop(),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SwapFrom(),
            const Center(
              child: Icon(
                Icons.swap_vert_circle_rounded,
                size: 32,
                color: AppsColor.backgroundColor,
              ),
            ),
            const SwapTo(),
            const SizedBox(height: 20),
            Container(
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppsColor.backgroundColor,
              ),
              child: const Text(
                "Confirm",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
        title: const Text(
          "Wallet",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 220,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "WALET BALANCE",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          constraints: const BoxConstraints(maxWidth: 200),
                          child: Text(
                            widget.balance.toString(),
                            style: const TextStyle(
                              fontSize: 26,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          width: 70,
                          height: 35,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: const Text(
                            "15%",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Text(
                          "Commission: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                          ),
                        ),
                        Text(
                          widget.commission.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Container(
                      height: 65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(70),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Get.to(() => const SwapDetailsScreen());
                              WoltModalSheet.show<void>(
                                pageIndexNotifier: pageIndexNotifier,
                                context: context,
                                pageListBuilder: (modalSheetContext) {
                                  final textTheme = Theme.of(context).textTheme;
                                  return [swap(modalSheetContext, textTheme)];
                                },
                                modalTypeBuilder: (context) {
                                  final size =
                                      MediaQuery.of(context).size.width;
                                  if (size < _pageBreakpoint) {
                                    return WoltModalType.bottomSheet;
                                  } else {
                                    return WoltModalType.dialog;
                                  }
                                },
                                onModalDismissedWithBarrierTap: () {
                                  debugPrint(
                                      'Closed modal sheet with barrier tap');
                                  Navigator.of(context).pop();
                                  pageIndexNotifier.value = 0;
                                },
                                maxDialogWidth: 560,
                                minDialogWidth: 400,
                                minPageHeight: 0.0,
                                maxPageHeight: 0.9,
                              );
                            },
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  FontAwesomeIcons.buildingColumns,
                                  size: 18,
                                  color: Colors.black,
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Swap",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              WoltModalSheet.show<void>(
                                pageIndexNotifier: pageIndexNotifier,
                                context: context,
                                pageListBuilder: (modalSheetContext) {
                                  final textTheme = Theme.of(context).textTheme;
                                  return [page1(modalSheetContext, textTheme)];
                                },
                                modalTypeBuilder: (context) {
                                  final size =
                                      MediaQuery.of(context).size.width;
                                  if (size < _pageBreakpoint) {
                                    return WoltModalType.bottomSheet;
                                  } else {
                                    return WoltModalType.dialog;
                                  }
                                },
                                onModalDismissedWithBarrierTap: () {
                                  debugPrint(
                                      'Closed modal sheet with barrier tap');
                                  Navigator.of(context).pop();
                                  pageIndexNotifier.value = 0;
                                },
                                maxDialogWidth: 560,
                                minDialogWidth: 400,
                                minPageHeight: 0.0,
                                maxPageHeight: 0.9,
                              );
                            },
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  FontAwesomeIcons.moneyCheck,
                                  color: Colors.black,
                                  size: 18,
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Fund Account",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    // return const LastTranCard();
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        horizontalTitleGap: 5,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 0),
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
                          child: index == 2 ||
                                  index == 1 ||
                                  index == 6 ||
                                  index == 8
                              ? const Icon(
                                  Icons.keyboard_arrow_up_outlined,
                                  color: Colors.red,
                                )
                              : const Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  color: Colors.green,
                                ),
                        ),
                        title: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "12 April 2023",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "0793079237239488",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        trailing: Column(
                          children: [
                            index == 2 || index == 1 || index == 6 || index == 8
                                ? const Text(
                                    "-20,000",
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  )
                                : const Text(
                                    "+340,000",
                                    style: TextStyle(
                                      color: Colors.green,
                                    ),
                                  ),
                            index == 2 || index == 1 || index == 6 || index == 8
                                ? const Text("fund")
                                : const Text("debit"),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
