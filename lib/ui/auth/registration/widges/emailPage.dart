import 'package:evie_ui_test/colors/evColors.dart';
import 'package:evie_ui_test/ui/auth/registration/widges/passwordPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';

class EmailPage extends StatefulWidget {
  EmailPage({
    super.key,
  });

  @override
  State<EmailPage> createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  late FocusNode email;
  late FocusNode submit;

  @override
  void initState() {
    super.initState();
    email = FocusNode();
    submit = FocusNode();
  }

  @override
  void dispose() {
    email.dispose();
    submit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
        padding: EdgeInsets.all(18.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Your email  ",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 12.0,
              ),
              Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    // color: Colors.pink.withOpacity(0.2),
                    color: secondaryColor.withOpacity(0.2),
                    spreadRadius: 0.5,
                    blurRadius: 35,
                    offset: Offset(0, 4),
                  )
                ]),
                child: TextFormField(
                  controller: emailController,
                  autofocus: true,
                  enabled: true,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.emailAddress,
                  focusNode: email,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter your email';
                    } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    fillColor: primaryColor,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0)),
                  ),
                  onFieldSubmitted: (term) {
                    email.unfocus();
                    FocusScope.of(context).requestFocus(submit);
                  },
                ),
              ),
              SizedBox(
                height: 55.0,
              ),
              Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        // color: Colors.pink.withOpacity(0.2),
                        color: primaryColor.withOpacity(0.2),
                        spreadRadius: 6,
                        blurRadius: 25,
                        offset: Offset(0,4),
                      )
                    ]
                ),
                child: ConstrainedBox(
                    constraints:
                    BoxConstraints.tightFor(width: screenWidth, height: 50),
                    child: ElevatedButton(
                        focusNode: submit,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {

                            // Navigator.push(
                            //   context,
                            //   PageTransition(
                            //     type: PageTransitionType.rightToLeft,
                            //     duration: Duration(milliseconds: 400),
                            //     child: PasswordPage(),
                            //     isIos: false,
                            //   ),
                            // );
                            Navigator.of(context).push(
                              CupertinoPageRoute(builder: (context)=> PasswordPage())
                            );

                            print("Email is Valid!!");
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: secondaryColor),
                        child: Text(
                          "Continue",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ))),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: screenWidth / 3,
                    height: 2,
                    color: Colors.grey,
                  ),
                  Text(
                    " OR ",
                    style: TextStyle(fontSize: 16),
                  ),
                  Container(
                    width: screenWidth / 3,
                    height: 2,
                    color: Colors.grey,
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: secondaryColor.withOpacity(0.2),
                    spreadRadius: 6,
                    blurRadius: 25,
                    offset: Offset(0, 4),
                  )
                ]),
                child: ConstrainedBox(
                    constraints:
                        BoxConstraints.tightFor(width: screenWidth, height: 50),
                    child: ElevatedButton(
                        onPressed: () {
                          //register using google
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height : screenWidth * 0.055,
                              alignment: Alignment.center,
                              child: const Image(
                                image: AssetImage('assets/img/google.png'),
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              "Continue with Google",
                              style: TextStyle(
                                  color: secondaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            )
                          ],
                        ))),
              )
            ],
          ),
        ));
  }
}
