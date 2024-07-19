import 'package:flutter/material.dart';

class Mycontainer extends StatelessWidget {
  const Mycontainer({super.key, required this.isActive});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(microseconds: 300),
      height: 5,
      width: 5,
      decoration: BoxDecoration(
          color: isActive ? Colors.blue : Colors.grey, shape: BoxShape.circle),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({
    super.key,
    required this.image,
    required this.title,
    required this.des,
  });
  final String image, title, des;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  height: 300,
                  child: Image.asset(
                    image,
                    fit: BoxFit.fill,
                  ),
                ),
                Text(
                  textAlign: TextAlign.center,
                  title,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                ),
                Text(
                  des,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
