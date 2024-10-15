import 'dart:ffi';

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String title;
  final page;
  final bool isPop;
  const Button({super.key, required this.title, required this.page, required this.isPop});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        if(isPop) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              page,
          (Route<dynamic> route) => false,);
        }
        else{
        Navigator.pushNamed(context, page);
      }},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: const Color(0xFF3A4054),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15),
        margin: const EdgeInsets.only(left: 25, right: 25),
        width: double.infinity,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
