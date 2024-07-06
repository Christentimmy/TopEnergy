import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:topenergy/Resources/color.dart';
import 'package:topenergy/controller/retrieve_controller.dart';
import 'package:topenergy/widget/custom_button.dart';
import 'package:topenergy/widget/custom_textfield.dart';

class AltProfileScreen extends StatefulWidget {
  const AltProfileScreen({super.key});

  @override
  State<AltProfileScreen> createState() => _AltProfileScreenState();
}

class _AltProfileScreenState extends State<AltProfileScreen> {
  final _retrieveController = Get.find<RetrieveController>();
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController(
        text: _retrieveController.userDetails.value?.name);
    _emailController = TextEditingController(
        text: _retrieveController.userDetails.value?.email);
    _phoneNumberController = TextEditingController(
        text: _retrieveController.userDetails.value?.phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final currentHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // extendBody: true,
      // backgroundColor: null,
      // extendBodyBehindAppBar: true,
      body: Container(
        width: currentWidth,
        height: currentHeight,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/background.jpg",
            ),
            opacity: 0.4,
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 55),
                    padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: MediaQuery.of(context).viewInsets.bottom / 3.2),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextFieldUpdate(
                          textEditingController: _fullNameController,
                        ),
                        CustomTextFieldUpdate(
                          textEditingController: _emailController,
                        ),
                        CustomTextFieldUpdate(
                          textEditingController: _phoneNumberController,
                          type: TextInputType.number,
                        ),
                        const SizedBox(height: 50),
                        CustomButton(
                          ontap: () {},
                          child: const Text(
                            "Update",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 120,
                    width: 120,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppsColor.backgroundColor,
                      image: DecorationImage(
                        image: AssetImage("assets/images/powava.png"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
