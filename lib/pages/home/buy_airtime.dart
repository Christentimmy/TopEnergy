import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:topenergy/Resources/color.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'package:contacts_service/contacts_service.dart';

class BuyAirtime extends StatefulWidget {
  const BuyAirtime({super.key});

  @override
  State<BuyAirtime> createState() => _BuyAirtimeState();
}

const double _bottomPaddingForButton = 150.0;
const double _pagePadding = 16.0;
const double _pageBreakpoint = 768.0;

class _BuyAirtimeState extends State<BuyAirtime> with TickerProviderStateMixin {
  final pageIndexNotifier = ValueNotifier(0);
  final PageController _controller = PageController();

  SliverWoltModalSheetPage page1(
    BuildContext modalSheetContext,
    TextTheme textTheme,
  ) {
    return WoltModalSheetPage(
      hasSabGradient: false,
      hasTopBarLayer: false,
      pageTitle: const Center(
        child: Text(
          "Select Your Airtime Provider",
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    network.value = "MTN";
                    Navigator.pop(modalSheetContext);
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 30,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset("assets/images/MTN.png"),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "MTN",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    network.value = "AIRTEL";
                    Navigator.pop(modalSheetContext);
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 40,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset(
                          "assets/images/Airtel.png",
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "AIRTEL",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    network.value = "GLO";
                    Navigator.pop(modalSheetContext);
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset("assets/images/glo.png"),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "GLO",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    network.value = "9MOBILE";
                    Navigator.pop(modalSheetContext);
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 40),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset("assets/images/9mobile.png"),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "9MOBILE",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  final List _utilities = [
    [
      "Airtime",
      true,
    ],
    [
      "Data",
      false,
    ],
  ];

  void _change(int index) {
    setState(() {
      for (var i = 0; i < _utilities.length; i++) {
        _utilities[i][1] = false;
      }
      _utilities[index][1] = true;
      if (index == 0) {
        _controller.animateToPage(
          0,
          duration: const Duration(microseconds: 200),
          curve: Curves.easeInOut,
        );
      } else if (index == 1) {
        _controller.animateToPage(
          1,
          duration: const Duration(microseconds: 200),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  RxString network = "Airtel".obs;
  RxString dataPlan = "Select Data Plan".obs;

  final List _dataPlanDetails = [
    "2000GB For 1Year",
    "1000GB For 1Year",
    "400GB For 1Year",
    "250GB For 3Month",
    "150GB For 3Month",
    "90GB For 3Month",
    "120GB For 1Month",
    "110GB For 1Month",
    "75GB For 1Month",
    "40GB For 1Month",
    "27GB For 1Month",
    "20GB For 1Month",
  ];

  SliverWoltModalSheetPage displaDataPlan(
      BuildContext modalSheetContext2, TextTheme textTheme) {
    return WoltModalSheetPage(
      hasSabGradient: false,
      topBarTitle: Text(
        'Select Data Plan',
        style: textTheme.titleSmall,
      ),
      isTopBarLayerAlwaysVisible: true,
      trailingNavBarWidget: IconButton(
        padding: const EdgeInsets.all(_pagePadding),
        icon: const Icon(Icons.close),
        onPressed: Navigator.of(modalSheetContext2).pop,
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
            SizedBox(
              height: 550,
              child: ListView.builder(
                itemCount: _dataPlanDetails.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      dataPlan.value = _dataPlanDetails[index];
                      Navigator.pop(modalSheetContext2);
                    },
                    contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                    title: Column(
                      children: [
                        Center(
                          child: Text(
                            _dataPlanDetails[index],
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const Divider(),
                      ],
                    ),
                  );
                  // return GestureDetector(
                  //   onTap: () {
                  //       dataPlan.value = _dataPlanDetails[index];
                  //           Navigator.pop(modalSheetContext2);
                  //   },
                  //   child: Padding(
                  //     padding: const EdgeInsets.symmetric(vertical: 5),
                  //     child: Column(
                  //       crossAxisAlignment: CrossAxisAlignment.center,
                  //       children: [
                  //         Text(
                  //           _dataPlanDetails[index],
                  //           style: const TextStyle(
                  //             fontSize: 14,
                  //             fontWeight: FontWeight.w500,
                  //           ),
                  //         ),
                  //         const Divider(),
                  //       ],
                  //     ),
                  //   ),
                  // );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  RxString selectedContactNumber = "000-0000-0000".obs;

  Future<void> _requestContactPermissionAndOpenPicker() async {
    var status = await Permission.contacts.request();

    if (status.isGranted) {
      return _showContactPicker();
    } else {
      print("Contact permission is required to access contacts.");
    }
  }

  Future<void> _showContactPicker() async {
    print("Hello");
    Contact? selectedContact = await ContactsService.openDeviceContactPicker();

    if (selectedContact != null) {
      // Access the selected contact's information
      String contactNumber = selectedContact.phones?.isNotEmpty ?? false
          ? selectedContact.phones?.first.value ?? ""
          : "No phone number available";

      print("Selected Contact Name: ${selectedContact.displayName}");
      print("Selected Contact Number: $contactNumber");
      selectedContactNumber.value = contactNumber;
      print(selectedContactNumber);

      // You can now use the contact information as needed
    }
  }

  @override
  Widget build(BuildContext context) {
    double currentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppsColor.backgroundColor,
        title: const Text(
          'Buy Airtime',
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 4,
                    color: AppsColor.backgroundColor,
                  ),
                ),
                child: ListView.builder(
                  itemCount: _utilities.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        _change(index);
                      },
                      child: Container(
                        width: currentWidth / 2.2,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: _utilities[index][1]
                              ? AppsColor.backgroundColor
                              : null,
                          borderRadius: index == 0
                              ? const BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                )
                              : const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),
                        ),
                        child: Text(
                          _utilities[index][0],
                          style: TextStyle(
                            color: _utilities[index][1]
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: PageView(
                controller: _controller,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  //Airtime
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Phone Number",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          children: [
                            Obx(
                              () => Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      width: 2,
                                      color: AppsColor.backgroundColor,
                                    ),
                                  ),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: selectedContactNumber.value,
                                      hintStyle: const TextStyle(
                                        fontSize: 12,
                                      ),
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            GestureDetector(
                              onTap: () {
                                _requestContactPermissionAndOpenPicker();
                              },
                              child: Container(
                                width: 50,
                                height: 60,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: AppsColor.backgroundColor,
                                    width: 2,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.perm_contact_calendar_rounded,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          "NetWork",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Container(
                          width: currentWidth,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 2,
                              color: AppsColor.backgroundColor,
                            ),
                          ),
                          child: ListTile(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 10),
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
                            leading: Obx(
                              () => Text(
                                network.toString(),
                              ),
                            ),
                            trailing: const Icon(Icons.keyboard_arrow_down),
                          ),
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          "Amount",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 2,
                              color: AppsColor.backgroundColor,
                            ),
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              hintText: "1000",
                              hintStyle: TextStyle(
                                fontSize: 12,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 60),
                        Center(
                          child: Container(
                            height: 45,
                            width: 250,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppsColor.backgroundColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              "Proceed",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Data
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Phone Number",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    width: 2,
                                    color: AppsColor.backgroundColor,
                                  ),
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: selectedContactNumber.value,
                                    hintStyle: const TextStyle(
                                      fontSize: 12,
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: _requestContactPermissionAndOpenPicker,
                              child: Container(
                                width: 50,
                                height: 60,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: AppsColor.backgroundColor,
                                    width: 2,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.perm_contact_calendar_rounded,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          "NetWork",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Container(
                          width: currentWidth,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 2,
                              color: AppsColor.backgroundColor,
                            ),
                          ),
                          child: ListTile(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 10),
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
                            leading: Obx(
                              () => Text(
                                network.toString(),
                              ),
                            ),
                            trailing: const Icon(Icons.keyboard_arrow_down),
                          ),
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          "Data Plan",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Container(
                          width: currentWidth,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 2,
                              color: AppsColor.backgroundColor,
                            ),
                          ),
                          child: ListTile(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 10),
                            onTap: () {
                              WoltModalSheet.show<void>(
                                pageIndexNotifier: pageIndexNotifier,
                                context: context,
                                pageListBuilder: (modalSheetContext) {
                                  final textTheme = Theme.of(context).textTheme;
                                  return [
                                    displaDataPlan(modalSheetContext, textTheme)
                                  ];
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
                            leading: Obx(
                              () => Text(
                                dataPlan.toString(),
                              ),
                            ),
                            trailing: const Icon(Icons.keyboard_arrow_down),
                          ),
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          "Amount",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Container(
                          height: 50,
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 2,
                              color: AppsColor.backgroundColor,
                            ),
                          ),
                          child: const Text("₦1000"),
                        ),
                        const SizedBox(height: 60),
                        Center(
                          child: Container(
                            height: 45,
                            width: 250,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppsColor.backgroundColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              "Proceed",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
