import 'package:evie_ui_test/colors/evColors.dart';
import 'package:evie_ui_test/ui/auth/Registration/pages/Registration.dart';
import 'package:evie_ui_test/ui/auth/login/pages/login.dart';
import 'package:evie_ui_test/util/const/ev_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class WelcomeFooter extends StatelessWidget {
  const WelcomeFooter({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ConstrainedBox(
            constraints:
                BoxConstraints.tightFor(width: screenWidth, height: 50),
            child: FilledButton.tonal(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   PageTransition(
                  //     type: PageTransitionType.rightToLeft,
                  //     duration: Duration(milliseconds: 400),
                  //     child: Registration(),
                  //     isIos: false,
                  //   ),
                  // );
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                        builder: (context) => Registration(),
                    ),
                  );
                },
                style: ButtonStyle(backgroundColor:
                    MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                  return primaryColor;
                })),
                child: Text(
                  register,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ),
          SizedBox(
            height: 18,
          ),
          ConstrainedBox(
            constraints:
                BoxConstraints.tightFor(width: screenWidth, height: 50),
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    side: BorderSide(width: 2.0, color: primaryColor)),
                onPressed: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(builder: (context) => Login())
                  );
                  // Navigator.push(
                  //   context,
                  //   PageTransition(
                  //     type: PageTransitionType.rightToLeft,
                  //     duration: Duration(milliseconds: 400),
                  //     child: Login(),
                  //     isIos: false,
                  //   ),
                  // );
                },
                child: Text(
                  login,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: primaryColor),
                )),
          ),
          SizedBox(
            height: 22,
          ),

          // Wrap(
          //   crossAxisAlignment: WrapCrossAlignment.start,
          //   children: [
          //     Text(terms_policy),
          //     GestureDetector(
          //       child: Text(
          //         terms_of_service,
          //         style: TextStyle(fontWeight: FontWeight.bold),
          //       ),
          //       onTap: (){
          //         print("$terms_of_service clicked!!");
          //       }
          //     ),
          //     Text(acknowledge),
          //     GestureDetector(
          //       child: Text(
          //         privacy_policy,
          //         style: TextStyle(fontWeight: FontWeight.bold),
          //       ),
          //       onTap: (){
          //         print("$privacy_policy is Clicked!!");
          //       },
          //     )
          //   ],
          // ),

          RichText(
            text: TextSpan(
                style: new TextStyle(fontSize: 16, color: primaryColor),
                children: <TextSpan>[
                  new TextSpan(text: terms_policy),
                  new TextSpan(
                      text: terms_of_service,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => {print("Terms of seervices")},
                      style: new TextStyle(fontWeight: FontWeight.bold)),
                  new TextSpan(text: acknowledge),
                  new TextSpan(
                      text: privacy_policy,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => {print("Privacy Policy")},
                      style: new TextStyle(fontWeight: FontWeight.bold))
                ]),
          ),

          SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
