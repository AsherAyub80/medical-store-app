import 'dart:async';

import 'package:flutter/material.dart';
import 'package:medical_store_app/components/my_button.dart';
import 'package:medical_store_app/screens/nav_bar_screen.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  TextEditingController otp1Controller = TextEditingController();
  TextEditingController otp2Controller = TextEditingController();
  TextEditingController otp3Controller = TextEditingController();
  TextEditingController otp4Controller = TextEditingController();

  FocusNode firstFocusNode = FocusNode();
  FocusNode secondFocusNode = FocusNode();
  FocusNode thirdFocusNode = FocusNode();
  FocusNode fourthFocusNode = FocusNode();

  late Timer _timer;
  int timeLeft = 59;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        if (timeLeft < 1) {
          timer.cancel();
          scaffoldMessengerKey.currentState?.showSnackBar(
            const SnackBar(content: Text('OTP expired')),
          );
        } else {
          timeLeft--;
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    firstFocusNode.dispose();
    secondFocusNode.dispose();
    thirdFocusNode.dispose();
    fourthFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Enter the verification code',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'We just sent you a verification code via phone',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      OtpField(
                        width: width,
                        controller: otp1Controller,
                        focusNode: firstFocusNode,
                        nextFocusNode: secondFocusNode,
                      ),
                      OtpField(
                        width: width,
                        controller: otp2Controller,
                        focusNode: secondFocusNode,
                        nextFocusNode: thirdFocusNode,
                      ),
                      OtpField(
                        width: width,
                        controller: otp3Controller,
                        focusNode: thirdFocusNode,
                        nextFocusNode: fourthFocusNode,
                      ),
                      OtpField(
                        width: width,
                        controller: otp4Controller,
                        focusNode: fourthFocusNode,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.1,
                  ),
                  MyButton(
                    height: height * 0.09,
                    width: width * 0.9,
                    text: 'Submit Code',
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NavBarScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.08,
              ),
              Text(
                'The verification code will expire in 0:${timeLeft.toString().padLeft(2, '0')}',
                style: const TextStyle(color: Colors.grey),
              ),
              GestureDetector(
                onTap: () {
                  // Implement resend code functionality here
                },
                child: const Text(
                  'Resend Code',
                  style: TextStyle(color: Color(0xff4157FF), fontSize: 15),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OtpField extends StatelessWidget {
  const OtpField({
    Key? key,
    required this.width,
    required this.controller,
    required this.focusNode,
    this.nextFocusNode,
  }) : super(key: key);

  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocusNode;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * 0.150,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        decoration: InputDecoration(counterText: ''),
        keyboardType: TextInputType.phone,
        textAlign: TextAlign.center,
        maxLength: 1,
        onChanged: (value) {
          if (value.isNotEmpty && nextFocusNode != null) {
            FocusScope.of(context).requestFocus(nextFocusNode);
          }
        },
      ),
    );
  }
}
