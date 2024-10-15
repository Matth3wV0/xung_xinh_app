import 'package:flutter/material.dart';
import 'package:xung_xinh_app/ui/account_login/account_login.dart';
import 'package:xung_xinh_app/ui/home/home_page.dart';
import 'package:xung_xinh_app/ui/loading/loading.dart';
import 'package:xung_xinh_app/ui/registory/register.dart';

// void main() => runApp(const Register());

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const Loading(), // Your Scaffold widget goes here.
    routes: {
      '/loginpage' : (context) => const AccountLogin(),
      '/registerpage': (context) => const Register(),
      '/homepage': (context) => const HomePage()
    },
  ));
}
