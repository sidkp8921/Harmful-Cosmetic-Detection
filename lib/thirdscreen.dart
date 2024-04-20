import 'dart:async';

import 'package:cosmetic/fourthscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late Timer _timer;
  int _otpResendDuration = 60; // Duration in seconds
  bool _timerActive = false;
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    _timerActive = true;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_otpResendDuration > 0) {
          _otpResendDuration--;
        } else {
          _timer.cancel();
          _timerActive = false;
        }
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      Container(
        alignment: Alignment.bottomLeft,
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 2.0,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/model1.png',
                ),
                fit: BoxFit.fill)),
        child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back)),
                ],
              ),
            )),
      ),
      Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'Verify with OTP',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
          )),
      SizedBox(
        height: 20,
      ),

      Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: RichText(
              text: TextSpan(
                text:
                    'Waiting to automatically detect an OTP sent to \n +91 89**** *5900.',
                style: TextStyle(fontSize: 14, color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: ' Wrong number?',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          )),

      // Align(
      //     alignment: Alignment.bottomLeft,
      //     child: Padding(
      //       padding: const EdgeInsets.only(left: 20),
      //       child: Row(
      //         children: [
      //           Text(
      //               'Waiting to automatically detect an OTP sent to \n +91 97**** *5697.'),
      //           TextButton(
      //             onPressed: () {},
      //             child: Text(
      //               'Wrong number?',
      //               style: TextStyle(color: Colors.black),
      //             ),
      //           ),
      //         ],
      //       ),
      //     )),
      SizedBox(
        height: 20,
      ),
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: OtpTextField(
              borderRadius: BorderRadius.all(Radius.zero),
              //   controller: otpbox,
              numberOfFields: 4,
              //    width: MediaQuery.of(context).size.width,
              fieldWidth: 50,
              textStyle: TextStyle(fontSize: 17),
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              showFieldAsBox: true,
              // onCompleted: (pin) {
              //   otp = pin;

              // },
            ),
          ),
          _timerActive
              ? Text(
                  ' Resend OTP in $_otpResendDuration sec',
                  style: TextStyle(color: Colors.black),
                )
              : TextButton(
                  onPressed: () {
                    // Resend OTP action
                    startTimer();
                  },
                  child: Text(
                    'Resend OTP?',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
        ],
      ),

      SizedBox(
        height: 20,
      ),
      // Align(
      //   alignment: Alignment.bottomLeft,
      //   child: Padding(
      //     padding: const EdgeInsets.only(left: 10),
      //     child: TextButton(
      //       onPressed: () {},
      //       child: Text(
      //         'Resend OTP?',
      //         style: TextStyle(color: Colors.black),
      //       ),
      //     ),
      //   ),
      // ),
      SizedBox(
        height: 20,
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => FourthScreen())));
              },
              child: Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(Color.fromARGB(255, 10, 1, 1)))),
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Text('Having trouble logging in ?'),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Get Help',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ButtonStyle(splashFactory: NoSplash.splashFactory),
                ),
              ],
            ),
          )),
    ])));
  }
}
