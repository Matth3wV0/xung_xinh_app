import 'package:flutter/material.dart';
import 'package:xung_xinh_app/components/my_textfield.dart';
import 'package:xung_xinh_app/ui/home/home_page.dart';
import 'package:xung_xinh_app/components/my_button.dart';

class AccountLogin extends StatefulWidget {
  const AccountLogin({super.key});

  @override
  State<AccountLogin> createState() => _AccountLoginState();
}

class _AccountLoginState extends State<AccountLogin> {
  //text controller
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  //BUILD IN
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFFFEFBEF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFEFBEF),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: screenHeight / 2 - 300),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(
                          right: screenWidth / 2 + 58, bottom: 0),
                      child: const Text(
                        "LOG IN",
                        style: TextStyle(
                            color: Color(0xFF3A4054),
                            fontFamily: 'Montserrat',
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      )),
                  const SizedBox(height: 90),
                  MyTextField(
                    hintText: "Username",
                    title: "EMAIL",
                    obscureText: false,
                    icon: Icons.mail_outline,
                    controller: username,
                  ),
                  const SizedBox(height: 10),
                  MyTextField(
                    hintText: "Password",
                    title: "PASSWORD",
                    obscureText: true,
                    icon: Icons.lock_outline,
                    controller: password,
                  ),
                  const SizedBox(height: 30),
                  const IntrinsicHeight(
                      child: Button(
                    isPop: true,
                    title: "LOG IN",
                    page: '/homepage',
                  )),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Haven't have an account?",
                        style: TextStyle(
                            color: Color(0xFF3A4054),
                            fontFamily: 'Montserrat',
                            fontSize: 14),
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/registerpage');
                        },
                        child: const Text(
                          "Register",
                          style: TextStyle(
                            color: Color(0xFFD2918F),
                            fontFamily: 'Montserrat',
                            fontSize: 14,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
