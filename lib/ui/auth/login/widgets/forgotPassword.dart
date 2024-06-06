import 'package:evie_ui_test/colors/evColors.dart';
import 'package:evie_ui_test/util/const/ev_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  late FocusNode email;
  late FocusNode submit;

  @override
  void initState(){
    super.initState();
    email = FocusNode();
    submit = FocusNode();
  }

  @override
  void dispose(){
    email.dispose();
    submit.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          "Forgot password",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(18.0),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                      text: TextSpan(
                        text: resetPassword,
                        style: TextStyle(fontSize: 18,color: secondaryColor)
                      )
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 15,),
                          Text("Your email  ",
                            style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),
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
                          textInputAction: TextInputAction.done,
                          focusNode: email,
                          enabled: true,

                          keyboardType: TextInputType.visiblePassword,
                          onFieldSubmitted: (term){
                            email.unfocus();
                            FocusScope.of(context).requestFocus(submit);
                          },
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Enter your email';
                            }
                            else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                              return 'Enter a valid email';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            fillColor: primaryColor,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0)
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 35.0,
                      ),

                      SizedBox(
                        height: 55,
                      ),

                    ],
                  ),
                ],
              )
          )
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: EdgeInsets.all(18),
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(width: screenWidth, height: 50),
            child: FloatingActionButton(
              focusNode: submit,
              child: Text("Send reset code" , style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16
              ),),
              backgroundColor: secondaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50))
              ),
              onPressed: (){
                if(_formKey.currentState!.validate()){
                  print("Password is Valid!!");
                }
              },
            ),
          ),
        )
    );
  }
}
