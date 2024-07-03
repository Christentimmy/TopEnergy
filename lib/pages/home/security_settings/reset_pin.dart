import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:topenergy/Resources/color.dart';

class ResetPinScreen extends StatefulWidget {
  const ResetPinScreen({super.key});

  @override
  State<ResetPinScreen> createState() => _ResetPinScreenState();
}

class _ResetPinScreenState extends State<ResetPinScreen> {
  bool _isCurrentPin = false;
  bool _isNewPin = false;
  bool _isConfirmPin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Reset Pin",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppsColor.backgroundColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  "Your four-digit transaction pin secures your transactions, Please don't share with anyone",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 50),
                const Padding(
                  padding: EdgeInsets.only(left: 5.0),
                  child: Text(
                    "Current Pin: ",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(
                      width: 1,
                      color: AppsColor.backgroundColor,
                    ),
                  ),
                  child: TextFormField(
                    obscureText: _isCurrentPin,
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isCurrentPin = !_isCurrentPin;
                          });
                        },
                        icon: _isCurrentPin
                            ? const Icon(Icons.remove_red_eye)
                            : const Icon(FontAwesomeIcons.eyeSlash, size: 15),
                      ),
                      hintText: "****",
                      hintStyle: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                const Padding(
                  padding: EdgeInsets.only(left: 5.0),
                  child: Text(
                    "New Pin: ",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(
                      width: 1,
                      color: AppsColor.backgroundColor,
                    ),
                  ),
                  child: TextFormField(
                    obscureText: _isNewPin,
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      hintText: "****",
                      hintStyle: const TextStyle(
                        fontSize: 12,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isNewPin = !_isNewPin;
                          });
                        },
                        icon: _isNewPin
                            ? const Icon(Icons.remove_red_eye)
                            : const Icon(FontAwesomeIcons.eyeSlash, size: 15),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                const Padding(
                  padding: EdgeInsets.only(left: 5.0),
                  child: Text(
                    "Confirm Pin: ",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(
                      width: 1,
                      color: AppsColor.backgroundColor,
                    ),
                  ),
                  child: TextFormField(
                    obscureText: _isConfirmPin,
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      hintText: "****",
                      hintStyle: const TextStyle(
                        fontSize: 12,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isConfirmPin = !_isConfirmPin;
                          });
                        },
                        icon: _isConfirmPin
                            ? const Icon(Icons.remove_red_eye)
                            : const Icon(FontAwesomeIcons.eyeSlash, size: 15),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Forgot Transaction Pin? ",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Reset Pin",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppsColor.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Container(
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppsColor.backgroundColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Text(
                    "Done",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
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
