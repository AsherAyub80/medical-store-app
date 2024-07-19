import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.height,
    required this.width,
    required this.onTap,
    required this.text,
  });

  final double height;
  final double width;
  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: const Color(0xff4157FF),
            borderRadius: BorderRadius.circular(30)),
        child: Center(
          child: Text(
            text.toUpperCase(),
            style: const TextStyle(
                letterSpacing: 0.5,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 17),
          ),
        ),
      ),
    );
  }
}
