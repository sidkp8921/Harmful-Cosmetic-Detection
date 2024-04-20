import 'package:cosmetic/thirdscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
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
              fit: BoxFit.fill),
        ),
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
              'Login',
              style: TextStyle(
                  fontSize: 30,
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
            child: Text(
                'Becare will send an SMS message to verify your phone number.'),
          )),
      SizedBox(
        height: 20,
      ),
      Row(
        children: [
          SizedBox(
            width: 25,
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Enter Phone Number"),
            ),
          ),
          SizedBox(
            width: 40,
          )
        ],
      ),
      SizedBox(
        height: 20,
      ),
      Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: RichText(
            text: TextSpan(
              text: 'By continuing, I agree to the',
              style: TextStyle(fontSize: 14, color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                    text: ' Terms & use of privacy policy',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          // RichText(
          //   text: TextSpan(
          //     text: 'Terms of use & privact policy',
          //     style: TextStyle(
          //         color: Colors.black,
          //         fontSize: 14,
          //         fontWeight: FontWeight.w600),
          //   ),
          // ),
          // Text(
          //   'By continuing i agree to the ',
          //   style: TextStyle(fontSize: 14),
          // ),
          // InkWell(
          //   onTap: () {
          //     // Add your navigation logic here to navigate to the Terms of Use and Privacy Policy page.
          //   },
          //   child: Text(
          //     'Terms of Use & Privacy  Policy',
          //     style: TextStyle(
          //       color: Colors.black,
          //       fontSize: 14,
          //       fontWeight: FontWeight.w700,
          //     ),
          //   ),
          // ),
        ),
      ),
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
                    MaterialPageRoute(builder: ((context) => LoginScreen())));
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
                ),
              ],
            ),
          )),
    ])));
  }
}
