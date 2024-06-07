import 'package:evie_ui_test/colors/evColors.dart';
import 'package:evie_ui_test/ui/home/pages/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class PasswordPage extends StatefulWidget {
  PasswordPage({super.key});

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController passController = TextEditingController();

  late FocusNode password;
  late FocusNode submit;
  bool passVisible = false;

  @override
  void initState(){
    super.initState();
    passVisible = false;
    password = FocusNode();
    submit = FocusNode();
  }

  @override
  void dispose(){
    password.dispose();
    submit.dispose();
    super.dispose();
  }

  bool _isValid = false;
  String _errorMessage = '';

  bool _validatePassword(String password) {
    // Reset error message
    _errorMessage = '';

    // Password length greater than 6
    if (password.length <6) {
      _errorMessage += '• Password must be longer than 6 characters.\n';
    }

    // Contains at least one uppercase letter
    if (!password.contains(RegExp(r'[A-Z]'))) {
      _errorMessage += '• Uppercase letter is missing.\n';
    }

    // Contains at least one lowercase letter
    if (!password.contains(RegExp(r'[a-z]'))) {
      _errorMessage += '• Lowercase letter is missing.\n';
    }

    // Contains at least one digit
    if (!password.contains(RegExp(r'[0-9]'))) {
      _errorMessage += '• Digit is missing.\n';
    }

    // Contains at least one special character
    if (!password.contains(RegExp(r'[!@#%^&*(),.?":{}|<>]'))) {
      _errorMessage += '• Special character is missing.\n';
    }

    // If there are no error messages, the password is valid
    return _errorMessage.isEmpty;
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
          "Create your account",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(18.0),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text("Now choose a strong password...",style: TextStyle(
                    fontSize: 18,
                  ),),
                  SizedBox(
                    height: 25,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 15,),
                          Text("Your password  ",
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
                          controller: passController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          autofocus: true,
                          textInputAction: TextInputAction.done,
                          focusNode: password,
                          enabled: true,

                          keyboardType: TextInputType.visiblePassword,
                          onFieldSubmitted: (term){
                            password.unfocus();
                            FocusScope.of(context).requestFocus(submit);
                          },
                          obscureText: !passVisible,
                          validator: (value){
                            _isValid = _validatePassword(passController.text);
                            if(_isValid != true){
                              return _errorMessage;
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            fillColor: primaryColor,
                            filled: true,
                            suffixIcon: IconButton(
                              icon: Icon(
                                passVisible? Icons.visibility_outlined : Icons.visibility_off_outlined
                              ),
                              onPressed: (){
                                setState(() {
                                  passVisible = !passVisible;
                                });
                              },
                            ),
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
              child: Text("Submit" , style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18
              ),),
              backgroundColor: secondaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50))
              ),
              onPressed: (){
                if(_formKey.currentState!.validate()){
                  print("Password is Valid!!");
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      duration: Duration(milliseconds: 600),
                      child: HomeScreen(),
                      isIos: true,
                    ),
                  );
                }
              },
            ),
          ),
        )
    );
  }
}
