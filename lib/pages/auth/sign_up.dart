import 'dart:core';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:topenergy/Resources/color.dart';
import 'package:topenergy/controller/auth_controller.dart';
import 'package:topenergy/pages/auth/alt_login.dart';
import 'package:topenergy/widget/custom_button.dart';
import 'package:topenergy/widget/custom_textfield.dart';
import 'package:topenergy/widget/loading_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final RxBool _isobscureText = false.obs;
  bool isobscureText = false;
  final RxBool _isValue = false.obs;

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _referralController = TextEditingController();
  final _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 247, 247),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(140),
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: AppBar(
            elevation: 2,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.black.withOpacity(0.7),
            leadingWidth: 260,
            toolbarHeight: 200,
            leading: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Create Account",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Text(
                    "Get Started with TopEnergy App",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 15,
            right: 15,
            bottom: MediaQuery.of(context).viewPadding.bottom,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Full Name: ",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    CustomTextfield(
                      textEditingController: _fullNameController,
                      hintText: "John John",
                      isObscureText: false,
                      prefixIcon: Icons.person,
                    ),
                    const SizedBox(height: 5),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Email: ",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    CustomTextfield(
                      textEditingController: _emailController,
                      hintText: "user@email.com",
                      isObscureText: false,
                      prefixIcon: Icons.email,
                    ),
                    const SizedBox(height: 5),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Phone Number: ",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    CustomTextfield(
                      textEditingController: _phoneNumberController,
                      hintText: "08156789347",
                      isObscureText: false,
                      prefixIcon: Icons.phone,
                    ),
                    const SizedBox(height: 5),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Password: ",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Obx(
                      () => CustomTextfield(
                        textEditingController: _passwordController,
                        hintText: "Enter Password",
                        isObscureText: _isobscureText.value ? true : false,
                        prefixIcon: Icons.lock,
                        suffixIcon: _isobscureText.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        suffixTap: () {
                          _isobscureText.value = !_isobscureText.value;
                        },
                        passwordValidator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          }
                          if (value.length < 8) {
                            return 'Password must be at least 8 characters long';
                          }
                          if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]')
                              .hasMatch(value)) {
                            return 'Password must contain at least one special character';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Referral Code (Optional)",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: _referralController,
                        style: const TextStyle(
                          fontSize: 15.5,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock, size: 20),
                          hintText: "Enter code",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(55, 0, 0, 0),
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.red),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: AppsColor.backgroundColor,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Obx(
                          () => Checkbox(
                            fillColor: WidgetStateProperty.resolveWith<Color>(
                              (Set<WidgetState> states) {
                                if (states.contains(WidgetState.disabled)) {
                                  return Colors.red;
                                }
                                return _isValue.value
                                    ? AppsColor.backgroundColor
                                    : Colors.transparent;
                              },
                            ),
                            value: _isValue.value,
                            onChanged: (value) {
                              _isValue.value = value!;
                            },
                          ),
                        ),
                        Obx(() => RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                                children: [
                                  const TextSpan(text: "Accept the "),
                                  TextSpan(
                                    text: "Terms & Condition",
                                    style: TextStyle(
                                      color: _isValue.value
                                          ? Colors.blue
                                          : Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account? ",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => AltLoginScreen());
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Obx(
                      () => CustomButton(
                        ontap: () {
                          if (_formKey.currentState!.validate()) {
                            _authController.signUpUser(
                              fullName: _fullNameController.text,
                              email: _emailController.text,
                              phoneNumber: _phoneNumberController.text,
                              password: _passwordController.text,
                            );
                          }
                        },
                        child: _authController.isloading.value
                            ? const Loader()
                            : const Text(
                                "Proceed",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(height: 20),
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
