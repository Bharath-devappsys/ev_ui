import 'package:evie_ui_test/colors/evColors.dart';
import 'package:evie_ui_test/util/const/ev_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeHeader extends StatelessWidget {
  const WelcomeHeader({super.key});


  @override
  Widget build(BuildContext context) {
    double sh = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: 25,
        ),
        Container(
          height: sh * 0.06,
          alignment: Alignment.center,
          child: const Image(
            image: AssetImage('assets/img/Evie_Logo.png'),
            color: Colors.white,
          ),
        ),

        Container(
          height: 75,
          alignment: Alignment.center,
          child: Text(welcome , style: TextStyle(fontSize: 24,color: primaryColor),),
        ),
      ],
    );
  }
}
