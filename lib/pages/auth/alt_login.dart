import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:topenergy/Resources/color.dart';
import 'package:topenergy/controller/auth_controller.dart';
import 'package:topenergy/controller/local_auth.dart';
import 'package:topenergy/pages/auth/forgot_password.dart';
import 'package:topenergy/pages/auth/sign_up.dart';
import 'package:topenergy/widget/custom_button.dart';
import 'package:topenergy/widget/custom_textfield.dart';
import 'package:topenergy/widget/loading_widget.dart';

class AltLoginScreen extends StatelessWidget {
  AltLoginScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _authController = Get.put(AuthController());
  final RxBool _isauthenticated = false.obs;

  final RxBool _isPasswordVisible = false.obs;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomSheet: const CustomBottomSheet(),
        backgroundColor: const Color.fromARGB(255, 247, 247, 247),
        appBar:  PreferredSize(
          preferredSize: const Size.fromHeight(150),
          child: CustomAppBar(
            text: "Login Now",
            subTitle: "Get Started with TopEnergy App",
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Email: ",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      CustomTextfield(
                        textEditingController: _emailController,
                        hintText: 'user@gmail.com',
                        isObscureText: false,
                        prefixIcon: Icons.email,
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "Password: ",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Obx(
                        () => CustomTextfield(
                          textEditingController: _passwordController,
                          hintText: "Enter Password",
                          isObscureText:
                              _isPasswordVisible.value ? true : false,
                          prefixIcon: Icons.lock,
                          suffixIcon: _isPasswordVisible.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          suffixTap: () {
                            _isPasswordVisible.value =
                                !_isPasswordVisible.value;
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const ForgotPasswordScreen());
                            },
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(
                                fontSize: 12,
                                color: AppsColor.primaryColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Obx(
                        () => CustomButton(
                          ontap: () {
                            if (_formKey.currentState!.validate()) {
                              //proceed
                              _authController.loginUser(
                                email: _emailController.text,
                                password: _passwordController.text,
                              );
                            }
                            FocusManager.instance.primaryFocus?.unfocus();
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
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have account? ",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const SignUpScreen());
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          color: AppsColor.primaryColor,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                GestureDetector(
                  onTap: () async {
                    final authenticate = await LocalAuth.authenticate();
                    _isauthenticated.value = authenticate;
                    if (_isauthenticated.value) {
                      Get.snackbar("Auth", "successful");
                    }
                  },
                  child: Center(
                    child: Container(
                      height: 50,
                      width: 50,
                      margin: const EdgeInsets.only(bottom: 70, right: 5),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/fing.png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      color: const Color.fromARGB(255, 247, 247, 247),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Powered by",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w300,
              decoration: TextDecoration.none,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 5),
          Image.asset(
            "assets/images/powlogo.png",
            height: 30,
            width: 30,
            color: Colors.black,
          ),
          const SizedBox(width: 5),
          const Text(
            "Raiju Capital",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w300,
              decoration: TextDecoration.none,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget {
  final String text;
  String? subTitle;
  CustomAppBar({
    super.key, required this.text, this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
        leading:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                subTitle ?? "",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w100,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
