import 'package:flutter/material.dart';
import 'package:xung_xinh_app/ui/account_login/account_login.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final String title;
  final bool obscureText;
  final IconData icon;
  final TextEditingController controller;

  const MyTextField(
      {super.key,
      required this.hintText,
      required this.title,
      required this.obscureText,
      required this.icon,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
        padding: const EdgeInsets.only(left: 40, top: 5),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            margin: const EdgeInsets.only(bottom: 8, left: 1),
            child: Text(
              title,
              style: const TextStyle(
                  fontFamily: 'Montserrat',
                  color: Color(0xFF000000),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xFFD2D2D2),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(25),
              color: const Color(0xFFFFFFFF),
            ),
            padding:
                const EdgeInsets.only(top: 1, bottom: 1, left: 15, right: 15),
            margin: const EdgeInsets.only(left: 0, right: 40),
            width: double.infinity,
            child: Row(children: [
              Container(
                  margin: const EdgeInsets.only(right: 18),
                  width: 24,
                  height: 24,
                  child:
                      Icon(icon as IconData?, color: const Color(0xFF7B8794))),
              Expanded(
                  child: TextField(
                    controller: controller,
                obscureText: obscureText,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hintText,
                    hintStyle: const TextStyle(
                        color: Color(0xFF7B8794),
                        fontFamily: 'Montserrat',
                        fontSize: 16)),
              )),
            ]),
          ),
        ]));
  }
}
