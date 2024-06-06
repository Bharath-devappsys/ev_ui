import 'package:evie_ui_test/ui/auth/login/widgets/welcomeBack.dart';
import 'package:evie_ui_test/ui/auth/registerORlogin/pages/RegisterOrLogin.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar:AppBar(
          leading: IconButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   PageTransition(
              //     type: PageTransitionType.leftToRight,
              //     duration: Duration(milliseconds: 400),
              //     isIos: false,
              //     child: RegisterOrLogin(),
              //   ),
              // );
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: Text(
            "Welcome Back",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: WelcomeBack(),
    );
  }
}
