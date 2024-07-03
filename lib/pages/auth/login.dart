// import 'dart:convert';
// import 'dart:core';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:topenergy/Resources/color.dart';
// import 'package:topenergy/Resources/constants.dart';
// import 'package:topenergy/controller/shared_preferences_helper.dart';
// import 'package:topenergy/model/user_model.dart';
// import 'package:topenergy/pages/auth/forgot_password.dart';
// import 'package:topenergy/pages/auth/otp_screen.dart';
// import 'package:topenergy/pages/auth/sign_up.dart';
// import 'package:topenergy/widget/bottom_widget.dart';
// import '../../controller/local_auth.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   bool _isauthenticated = false;
//   bool isobscureText = true;
//   bool _isEmptyEmail = false;
//   bool _isEmptyPassword = false;
//   bool _isLoading = false;

//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   bool _isValidEmail(String email) {
//     final RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
//     return emailRegExp.hasMatch(email);
//   }

//   void _handleTextFieldChanges(String value) {
//     setState(() {
//       _isEmptyEmail = _emailController.text.trim().isEmpty;
//       _isEmptyPassword = _passwordController.text.isEmpty;
//     });
//   }

//   void _showErrorMessage(String message) {
//     SnackbarUtils.showErrorSnackbar(message);
//   }

//   void verifyForm() {
//     setState(() {
//       _isLoading = true;
//     });

//     if (_isEmptyEmail || _isEmptyPassword) {
//       _showErrorMessage('Please fill up all fields before submitting');
//       setState(() {
//         _isLoading = false;
//       });
//     } else if (!_isValidEmail(_emailController.text)) {
//       _showErrorMessage('Please enter a valid email address');
//       setState(() {
//         _isLoading = false;
//         _isEmptyEmail = true;
//       });
//     } else {
//       _loginUser();
//     }
//   }

//   void _handleLoginSuccess(UserModel user) async {
//     await SharedPreferencesHelper.saveUserData(
//         user.email, int.parse(user.otpCode), user.token);
//     setState(() {
//       _isLoading = false;
//       SharedPreferencesHelper.getUserData();
//     });
//     Navigator.of(context).pushReplacement(MaterialPageRoute(
//       builder: (context) => const BottomNaviagtionScreen(),
//     ));
//     // Get.to(() => const BottomNaviagtionScreen());
//   }

//   void handleResendVerifyCode(UserModel user) async {
//     await SharedPreferencesHelper.saveUserData(
//       user.email,
//       int.parse(user.otpCode),
//       user.token,
//     );
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString("token", user.token);
//     String? token = prefs.getString("token");
//     print(token);
//     setState(() {
//       _isLoading = false;
//     });
//     Navigator.of(context).pushReplacement(MaterialPageRoute(
//       builder: (context) => OtpScreen(),
//     ));
//   }

//   void _handleLoginFailure(String errorMessage) {
//     _showErrorMessage(errorMessage);
//     setState(() {
//       _isLoading = false;
//     });
//   }

//   void _loginUser() async {
//     String email = _emailController.text;
//     String password = _passwordController.text;

//     // API endpoint
//     String apiUrl = '$appName/api/agent/login';
//     Map<String, String> body = {
//       'email': email,
//       'password': password,
//     };
//     try {
//       var response = await http.post(Uri.parse(apiUrl), body: body);
//       if (response.statusCode == 200) {
//         var responseData = jsonDecode(response.body);
//         if (responseData['status'] == true) {
//           if (responseData['responseBody']['active'] == false) {
//             var userJson = responseData['responseBody']['user_details'];
//             var user = UserModel.fromJson(userJson as Map<String, dynamic>);
//             _handleLoginFailure(responseData['responseMessage']);
//             handleResendVerifyCode(user);
//           } else {
//             var userJson = responseData['responseBody']['user_details'];
//             print(userJson);
//             var user = UserModel.fromJson(userJson as Map<String, dynamic>);
//             print("here");
//             _handleLoginSuccess(user);
//           }
//         } else {
//           _handleLoginFailure(responseData['responseMessage']);
//         }
//       } else {
//         _handleLoginFailure('Oops!!! Something went wrong');
//       }
//     } catch (error) {
//       print(error.toString());
//       _handleLoginFailure('Error during registration');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: const Color.fromARGB(255, 247, 247, 247),
//       bottomSheet: Container(
//         padding: const EdgeInsets.only(bottom: 20),
//         color: const Color.fromARGB(255, 247, 247, 247),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               "Powered by",
//               style: TextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.w300,
//                 decoration: TextDecoration.none,
//                 color: Colors.black,
//               ),
//             ),
//             const SizedBox(width: 5),
//             Image.asset(
//               "assets/images/powlogo.png",
//               height: 30,
//               width: 30,
//               color: Colors.black,
//             ),
//             const SizedBox(width: 5),
//             const Text(
//               "Raiju Capital",
//               style: TextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.w300,
//                 decoration: TextDecoration.none,
//                 color: Colors.black,
//               ),
//             )
//           ],
//         ),
//       ),
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(200),
//         child: Container(
//           decoration: const BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage("assets/images/background.jpg"),
//               fit: BoxFit.cover,
//             ),
//           ),
//           child: AppBar(
//             elevation: 2,
//             automaticallyImplyLeading: false,
//             backgroundColor: Colors.black.withOpacity(0.7),
//             leadingWidth: 260,
//             toolbarHeight: 200,
//             leading: const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Text(
//                     "Login Now",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 28,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                   Text(
//                     "Get Started with TopEnergy App",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.w100,
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.only(
//             left: 15,
//             right: 15,
//             top: 15,
//             bottom: MediaQuery.of(context).viewPadding.bottom,
//           ),
//           child: Form(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 10),
//                 const Padding(
//                   padding: EdgeInsets.only(left: 8.0),
//                   child: Text(
//                     "Email: ",
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   width: double.infinity,
//                   alignment: Alignment.center,
//                   margin: const EdgeInsets.symmetric(vertical: 10),
//                   decoration: BoxDecoration(
//                     color: const Color.fromARGB(118, 205, 205, 205),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: TextFormField(
//                     controller: _emailController,
//                     onChanged: _handleTextFieldChanges,
//                     style: const TextStyle(
//                       fontSize: 15.5,
//                       fontWeight: FontWeight.w500,
//                     ),
//                     decoration: InputDecoration(
//                       prefixIcon: const Icon(Icons.email, size: 20),
//                       hintText: "user@gmail.com",
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: BorderSide(
//                           color: _isEmptyEmail
//                               ? Colors.red
//                               : const Color.fromARGB(55, 0, 0, 0),
//                         ),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: const BorderSide(
//                           color: AppsColor.backgroundColor,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 5),
//                 const Padding(
//                   padding: EdgeInsets.only(left: 8.0),
//                   child: Text(
//                     "Password: ",
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   width: double.infinity,
//                   alignment: Alignment.center,
//                   margin: const EdgeInsets.symmetric(vertical: 10),
//                   decoration: BoxDecoration(
//                     color: const Color.fromARGB(118, 205, 205, 205),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: TextFormField(
//                     controller: _passwordController,
//                     onChanged: _handleTextFieldChanges,
//                     obscureText: isobscureText,
//                     style: const TextStyle(
//                       fontSize: 15.5,
//                       fontWeight: FontWeight.w500,
//                     ),
//                     decoration: InputDecoration(
//                       prefixIcon: const Icon(Icons.lock, size: 20),
//                       hintText: "Enter password",
//                       suffixIcon: IconButton(
//                         onPressed: () {
//                           setState(() {
//                             isobscureText = !isobscureText;
//                           });
//                         },
//                         icon: isobscureText
//                             ? const Icon(FontAwesomeIcons.eyeSlash, size: 15)
//                             : const Icon(Icons.remove_red_eye),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: BorderSide(
//                           color: _isEmptyPassword
//                               ? Colors.red
//                               : const Color.fromARGB(55, 0, 0, 0),
//                         ),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: const BorderSide(
//                           color: AppsColor.backgroundColor,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         Get.to(() => const ForgotPasswordScreen());
//                       },
//                       child: const Text(
//                         "Forgot Password?",
//                         style: TextStyle(
//                           fontSize: 12,
//                           color: AppsColor.primaryColor,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 15),
//                 IgnorePointer(
//                   ignoring: _isLoading,
//                   child: InkWell(
//                     onTap: verifyForm,
//                     // onTap: () {
//                     //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BottomNaviagtionScreen(),),);
//                     // },
//                     child: Stack(children: [
//                       Container(
//                         width: double.infinity,
//                         height: 45,
//                         alignment: Alignment.center,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(15),
//                           color: AppsColor.backgroundColor,
//                         ),
//                         child: _isLoading
//                             ? const SizedBox.shrink()
//                             : const Text(
//                                 "Proceed",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                 ),
//                               ),
//                       ),
//                       if (_isLoading)
//                         const Positioned.fill(
//                           child: Center(
//                             child: CircularProgressIndicator(
//                               valueColor:
//                                   AlwaysStoppedAnimation<Color>(Colors.white),
//                             ),
//                           ),
//                         ),
//                     ]),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text(
//                       "Don't have account? ",
//                       style: TextStyle(
//                         color: Colors.black,
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         // Get.to(() => const SignUpScreen());
//                         Navigator.of(context).push(
//                           MaterialPageRoute(
//                             builder: (context) => const SignUpScreen(),
//                           ),
//                         );
//                       },
//                       child: const Text(
//                         "Sign Up",
//                         style: TextStyle(
//                           color: AppsColor.primaryColor,
//                           fontWeight: FontWeight.w900,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 // const SizedBox(height: 50),
//                 const Spacer(),

//                 GestureDetector(
//                   onTap: () async {
//                     final authenticate = await LocalAuth.authenticate();
//                     setState(() {
//                       _isauthenticated = authenticate;
//                       if (_isauthenticated == true) {
//                         Get.snackbar("Auth", "successful");
//                       }
//                     });
//                   },
//                   child: Center(
//                     child: Container(
//                       height: 50,
//                       width: 50,
//                       margin: const EdgeInsets.only(bottom: 70, right: 5),
//                       decoration: const BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage("assets/images/fing.png"),
//                           fit: BoxFit.contain,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
