
import 'package:evie_ui_test/ui/auth/registerORlogin/widgets/welcomeFooter.dart';
import 'package:evie_ui_test/ui/auth/registerORlogin/widgets/welcomeHeader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterOrLogin extends StatelessWidget {
  const RegisterOrLogin({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
          child: ConstrainedBox(
              constraints: BoxConstraints(minHeight : screenHeight),
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/img/welcome-bg.png"),
                      fit: BoxFit.cover)
              ),
              padding: EdgeInsets.all(18),
              width: screenWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WelcomeHeader(),
                  Container(
                    height: 250,
                    alignment: Alignment.center,
                    child: const Image(
                      image: AssetImage('assets/img/welcome-ring2.png'),
                      // color: Colors.transparent,
                    ),
                  ),
                  WelcomeFooter()
                ],
              ),
            ),
          ),
        )
    );
  }
}
