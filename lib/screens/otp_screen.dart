import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medical_store_app/components/my_button.dart';
import 'package:medical_store_app/page/auth_page.dart';
import 'package:medical_store_app/screens/sign_in_screen.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

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
  TextEditingController otp5Controller = TextEditingController();
  TextEditingController otp6Controller = TextEditingController();

  FocusNode firstFocusNode = FocusNode();
  FocusNode secondFocusNode = FocusNode();
  FocusNode thirdFocusNode = FocusNode();
  FocusNode fourthFocusNode = FocusNode();
  FocusNode fifthFocusNode = FocusNode();
  FocusNode sixthfocusNode = FocusNode();

  late Timer _timer;
  int timeLeft = 59;
  String otp = '';

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  void verifyOtp() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );
    String smsCode = otp1Controller.text +
        otp2Controller.text +
        otp3Controller.text +
        otp4Controller.text +
        otp5Controller.text +
        otp6Controller.text;
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: SignInScreen.verify, smsCode: smsCode);
      await auth.signInWithCredential(credential);
      Navigator.of(context).pop();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AuthPage()),
      );
    } catch (e) {
      String errorMessage = 'Failed to verify OTP';
      if (e is FirebaseAuthException) {
        switch (e.code) {
          case 'invalid-verification-code':
            errorMessage = 'Invalid OTP entered';
            break;
          case 'expired-action-code':
            errorMessage = 'The OTP has expired';
            break;
          case 'too-many-requests':
            errorMessage =
                'Requests from this device are blocked due to unusual activity. Please try again later.';
            break;
          default:
            errorMessage = e.message ?? 'An error occurred';
        }
      }
      print('Firebase Auth Error: ${errorMessage}');
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    } finally {
      Navigator.of(context).pop();
    }
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
    fifthFocusNode.dispose();
    sixthfocusNode.dispose();
    super.dispose();
  }

  void updateOtpCode(String value) {
    setState(() {
      otp = otp1Controller.text +
          otp2Controller.text +
          otp3Controller.text +
          otp4Controller.text +
          otp5Controller.text +
          otp6Controller.text;
    });
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OtpField(
                        width: width,
                        controller: otp1Controller,
                        focusNode: firstFocusNode,
                        nextFocusNode: secondFocusNode,
                        onChanged: updateOtpCode,
                      ),
                      OtpField(
                        width: width,
                        controller: otp2Controller,
                        focusNode: secondFocusNode,
                        nextFocusNode: thirdFocusNode,
                        onChanged: updateOtpCode,
                      ),
                      OtpField(
                        width: width,
                        controller: otp3Controller,
                        focusNode: thirdFocusNode,
                        nextFocusNode: fourthFocusNode,
                        onChanged: updateOtpCode,
                      ),
                      OtpField(
                        width: width,
                        controller: otp4Controller,
                        focusNode: fourthFocusNode,
                        nextFocusNode: fifthFocusNode,
                        onChanged: updateOtpCode,
                      ),
                      OtpField(
                        width: width,
                        controller: otp5Controller,
                        focusNode: fifthFocusNode,
                        nextFocusNode: sixthfocusNode,
                        onChanged: updateOtpCode,
                      ),
                      OtpField(
                        width: width,
                        controller: otp6Controller,
                        focusNode: sixthfocusNode,
                        onChanged: updateOtpCode,
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
                    onTap: verifyOtp,
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
                onTap: () {},
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
    required this.onChanged,
  }) : super(key: key);

  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocusNode;
  final double width;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * 0.120,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: TextFormField(
          controller: controller,
          focusNode: focusNode,
          decoration: InputDecoration(counterText: ''),
          keyboardType: TextInputType.phone,
          textAlign: TextAlign.center,
          maxLength: 1,
          onChanged: (value) {
            onChanged(value); // Notify parent about the change
            if (value.isNotEmpty && nextFocusNode != null) {
              FocusScope.of(context).requestFocus(nextFocusNode);
            }
          },
        ),
      ),
    );
  }
}
