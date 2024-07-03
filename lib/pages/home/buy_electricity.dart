import 'package:flutter/material.dart';
import 'package:dropdown_model_list/dropdown_model_list.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:topenergy/Resources/color.dart';
import 'package:topenergy/controller/transaction_controller.dart';
import 'package:topenergy/model/transaction_model.dart';
import 'package:topenergy/pages/auth/alt_login.dart';
import 'package:topenergy/widget/custom_button.dart';
import 'package:topenergy/widget/custom_snackbar.dart';
import 'package:topenergy/widget/custom_textfield.dart';
import 'package:topenergy/widget/loading_widget.dart';

class ButElectricityScreen extends StatefulWidget {
  const ButElectricityScreen({super.key});

  @override
  State<ButElectricityScreen> createState() => _ButElectricityScreenState();
}

class _ButElectricityScreenState extends State<ButElectricityScreen> {
  DropListModel dropListContentModel = DropListModel([
    OptionItem(id: "ibedc", title: "IBEDC"),
    OptionItem(id: "utilitybills", title: "UTILITYBILLS"),
    OptionItem(id: "buypower", title: "BUYPOWER"),
    OptionItem(id: "bedcpower", title: "BEDCPOWER"),
    OptionItem(id: "comparelight", title: "COMAPRELIGHT"),
    OptionItem(id: "fetswallet", title: "FETSWALLET"),
    OptionItem(id: "paypaddi", title: "PAYPADDI"),
    OptionItem(id: "fetslimited", title: "FETLIMITED"),
    OptionItem(id: "ikejaelectic", title: "IKEJAELECTRIC"),
    OptionItem(id: "vtpass", title: "VTPASS"),
    OptionItem(id: "enugudisco", title: "ENUGUDISCO"),
    OptionItem(id: "irecharge", title: "IRECHARGE"),
    OptionItem(id: "instantrecharge", title: "INSTANTRECHARGE"),
    OptionItem(id: "nerc", title: "NERC"),
  ]);

  DropListModel optionTypeModel = DropListModel([
    OptionItem(id: "prepaid", title: "Prepaid"),
    OptionItem(id: "postpaid", title: "Postpaid"),
  ]);

  var optionItemSelectedContent = OptionItem(title: "Select diSco").obs;
  var optionType = OptionItem(title: "Select MeterType").obs;

  final TextEditingController _meterNoController = TextEditingController();
  final _transactionController = Get.put(TransactionController());

  @override
  Widget build(BuildContext context) {
    double currentHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: CustomAppBar(
          text: "Buy Electricity",
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 253, 253, 253),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SelectDropList(
                    hintColorTitle: Colors.black,
                    itemSelected: optionType.value,
                    dropListModel: optionTypeModel,
                    showIcon: false,
                    showArrowIcon: true,
                    showBorder: true,
                    borderColor: Colors.grey,
                    suffixIcon: Icons.arrow_drop_down,
                    arrowIconSize: 28,
                    paddingBottom: 0,
                    paddingLeft: 0,
                    heightBottomContainer: currentHeight / 9.5,
                    height: 45,
                    containerPadding: const EdgeInsets.only(left: 0, right: 10),
                    paddingRight: 0,
                    paddingTop: 0,
                    textColorTitle: AppsColor.backgroundColor,
                    paddingDropItem:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    onOptionSelected: (optionItem) {
                      optionType.value = optionItem;
                    },
                  ),
                ),
              ),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SelectDropList(
                    hintColorTitle: Colors.black,
                    itemSelected: optionItemSelectedContent.value,
                    dropListModel: dropListContentModel,
                    showIcon: false,
                    showArrowIcon: true,
                    showBorder: true,
                    borderColor: Colors.grey,
                    suffixIcon: Icons.arrow_drop_down,
                    arrowIconSize: 28,
                    paddingBottom: 0,
                    paddingLeft: 0,
                    height: 45,
                    containerPadding: const EdgeInsets.only(left: 0, right: 10),
                    paddingRight: 0,
                    paddingTop: 0,
                    paddingDropItem:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    onOptionSelected: (optionItem) {
                      optionItemSelectedContent.value = optionItem;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 7),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CustomTextfield(
                  textEditingController: _meterNoController,
                  hintText: "Meter Number",
                  isObscureText: false,
                  type: TextInputType.number,
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Obx(
                  () => CustomButton(
                    ontap: () async {
                      FocusManager.instance.primaryFocus?.unfocus();
                      if (_meterNoController.text.isNotEmpty &&
                          optionItemSelectedContent.value.title !=
                              "Select diSco" &&
                          optionType.value.title != "Select MeterType") {
                        await _transactionController.verifyMeterNumber(
                          optionItemSelectedContent.value.title,
                          _meterNoController.text,
                          optionType.value.title,
                        );
                        _meterNoController.clear();
                      } else {
                        CustomSnackbar()
                            .showErrorMessage("Fill All Requirements");
                      }
                    },
                    child: _transactionController.isloading.value
                        ? const Loader()
                        : const Text(
                            "Verify",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  "Select From Your List",
                  style: TextStyle(
                    color: AppsColor.backgroundColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const Divider(thickness: 0.3),
              Obx(
                () => _transactionController.transactionHistory.isEmpty
                    ? SizedBox(
                        height: currentHeight / 3.2,
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
                    : SizedBox(
                        height: currentHeight / 3.2,
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          itemCount:
                              _transactionController.transactionHistory.length,
                          itemBuilder: (context, index) {
                            TransactionModel model = _transactionController
                                .transactionHistory[index];
                            return LastTranCard(model: model);
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
}

class LastTranCard extends StatelessWidget {
  final TransactionModel model;
  const LastTranCard({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          // onTap: () {
          //   Get.to(() => const ContinuePurchaseScreen());
          // },
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
                model.meterNumber,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                model.billType,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "₦${model.amount}",
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ],
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: AppsColor.primaryColor,
            size: 18,
          ),
        ),
        const Divider(
          thickness: 0.3,
        ),
      ],
    );
  }
}
