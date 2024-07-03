import 'package:flutter/material.dart';
import 'package:topenergy/Resources/color.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback ontap;
  final Widget child;
  const CustomButton({super.key, required this.ontap, required this.child,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppsColor.backgroundColor,
        ),
        child: child,
      ),
    );
  }
}
