import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xung_xinh_app/components/my_textfield.dart';
import 'package:xung_xinh_app/ui/account_login/account_login.dart';
import 'package:xung_xinh_app/ui/registory/register.dart';
import 'package:xung_xinh_app/components/my_button.dart';


class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoadingPage();
  }
}

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: const Color(0xFFFEFBEF),
        body: ListView(children: [Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 350,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                        height: screenHeight / 2,
                        width: screenWidth,
                        child: Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/Logo.png'))),
                        )),
                    Positioned(
                        height: (screenHeight / 2) + 280,
                        width: screenWidth,
                        child: Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/Name.png'))),
                        ))
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(5),
                child: Column(
                  children: [
                    Text(
                      "Welcome to Xúng Xính",
                      style: TextStyle(
                          color: Color(0xFF3A4054),
                          fontFamily: 'Montserrat',
                          fontSize: 19),
                    ),
                    Text(
                      "Create your own dream wardrobe now!",
                      style: TextStyle(
                          color: Color(0xFF3A4054),
                          fontFamily: 'Montserrat',
                          fontSize: 19),
                    ),
                    SizedBox(height: 180),
                    IntrinsicHeight(child: Button(isPop: false,title: "LOG IN",page: '/loginpage',)),
                    SizedBox(height: 10),
                    Text(
                      "OR",
                      style: TextStyle(
                          color: Color(0xFF7B8794),
                          fontFamily: 'Montserrat',
                          fontSize: 14),
                    ),
                    SizedBox(height: 10),
                    IntrinsicHeight(
                      child: Button(isPop: false,title: "REGISTER", page: '/registerpage',),
                    )
                  ],
                ),
              )
            ])]));
  }
}
