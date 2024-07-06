import 'package:flutter/material.dart';
import 'package:topenergy/Resources/color.dart';

// ignore: must_be_immutable
class CustomTextfield extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isObscureText;
  String? hintText;
  IconData? prefixIcon;
  IconData? suffixIcon;
  VoidCallback? suffixTap;
  TextInputType? type;
  final String? Function(String?)? passwordValidator;
  bool? isReferral;
  CustomTextfield({
    super.key,
    required this.textEditingController,
    this.hintText,
    required this.isObscureText,
    this.prefixIcon,
    this.type,
    this.suffixIcon,
    this.suffixTap,
    this.passwordValidator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        keyboardType: type,
        obscureText: isObscureText,
        controller: textEditingController,
        validator: passwordValidator ??
            (value) {
              if (value!.isEmpty) {
                return "Field is required";
              }
              return null;
            },
        style: const TextStyle(
          fontSize: 15.5,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          prefixIcon: prefixIcon != null ? Icon(prefixIcon, size: 20) : null,
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 13,
          ),
          suffixIcon: IconButton(
            onPressed: suffixTap,
            icon: Icon(suffixIcon, size: 18),
          ),
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
    );
  }
}

// ignore: must_be_immutable
class CustomTextFieldUpdate extends StatelessWidget {
  final TextEditingController textEditingController;
  String? hintText;
  IconData? prefixIcon;
  IconData? suffixIcon;
  VoidCallback? suffixTap;
  TextInputType? type;

  bool? isReferral;
  CustomTextFieldUpdate({
    super.key,
    required this.textEditingController,
    this.hintText,
    this.prefixIcon,
    this.type,
    this.suffixIcon,
    this.suffixTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        keyboardType: type,
        controller: textEditingController,
        style: const TextStyle(
          fontSize: 15.5,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          prefixIcon: prefixIcon != null ? Icon(prefixIcon, size: 20) : null,
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 13,
          ),
          suffixIcon: IconButton(
            onPressed: suffixTap,
            icon: Icon(suffixIcon, size: 18),
          ),
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
    );
  }
}
