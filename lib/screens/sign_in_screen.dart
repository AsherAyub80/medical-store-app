import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medical_store_app/components/my_button.dart';
import 'package:medical_store_app/screens/otp_screen.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});

  static String verify = '';
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController countryCodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    countryCodeController.text = '+92';
  }

  var phone = '';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: height * 0.2,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: height * 0.1,
                child: Center(
                  child: Image.asset('images/Vector.png'),
                ),
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset.zero,
                      blurRadius: 2,
                      spreadRadius: 2,
                      blurStyle: BlurStyle.outer),
                ], color: Colors.white, shape: BoxShape.circle),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'Quick Medical',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.black),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 20.0, top: 80),
                child: Text(
                  'Please Enter your Mobile Number\nto Login/Sign Up',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextField(
                  onChanged: (value) {
                    phone = value;
                  },
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: '+92 3021372222',
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      letterSpacing: 1,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Colors.black)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Colors.black)),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MyButton(
                height: height * 0.09,
                width: width * 0.9,
                onTap: () async {
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: countryCodeController.text + phone,
                    verificationCompleted: (PhoneAuthCredential credential) {},
                    verificationFailed: (FirebaseAuthException e) {},
                    codeSent: (String verificationId, int? resendToken) {
                      SignInScreen.verify = verificationId;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => OtpScreen()));
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {},
                  );
                },
                text: 'Continue',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
