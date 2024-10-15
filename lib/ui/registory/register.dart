import 'package:flutter/material.dart';
import 'package:xung_xinh_app/components/my_button.dart';
import 'package:xung_xinh_app/components/my_textfield.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return const RegisterPage();
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text controller
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmpassword = TextEditingController();

  //BUILD IN
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFEFBEF),
        appBar: AppBar(
          backgroundColor: const Color(0xFFFEFBEF),
        ),
        body: Center(
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  const Text(
                    "Get's started with Xúng Xính.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                        color: Color(0xFF3A4054),
                        fontFamily: 'Montserrat',
                        fontSize: 21),
                  ),
                  const SizedBox(height: 70),
                  MyTextField(
                    controller: username,
                      hintText: "Your Full Name",
                      title: "Your name",
                      obscureText: false,
                      icon: Icons.person_2_outlined),
                  const SizedBox(height: 25),
                  MyTextField(
                    controller: email,
                      hintText: "Your Email Address",
                      title: "Email Address",
                      obscureText: false,
                      icon: Icons.mail_outline),
                  const SizedBox(height: 25),
                  MyTextField(
                    controller: password,
                      hintText: "Password",
                      title: "Your password",
                      obscureText: true,
                      icon: Icons.lock_outline),
                  const SizedBox(height: 25),
                   MyTextField(
                    controller: confirmpassword,
                      hintText: "Confirm Password",
                      title: "Confirm password",
                      obscureText: true,
                      icon: Icons.lock_outline),
                  const SizedBox(height: 40),
                  const IntrinsicHeight(
                      child: Button(isPop: false,title: "REGISTER", page: '/loginpage')),
                  const SizedBox(height: 10),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 100),
                      child: Text("Already have an account?",
                          style: TextStyle(
                              color: Color(0xFF3A4054),
                              fontFamily: 'Montserrat',
                              fontSize: 14)),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/loginpage');
                      },
                      // color: Color(0xFF3A4054),
                      child: const Text("Log in",
                          style: TextStyle(
                              color: Color(0xFFD2918F),
                              fontFamily: 'Montserrat',
                              fontSize: 14)),
                    )
                  ]),
                  const SizedBox(height: 60),
                  const Text(
                      "By joining I agree to receive emails from Xúng Xính.",
                      style: TextStyle(
                          color: Color(0xFFA1A1A1),
                          fontFamily: 'Montserrat',
                          fontSize: 12)),
                ],
              ),
            ],
          ),
        ));
  }
}
