import 'package:evie_ui_test/ui/auth/registration/widges/emailPage.dart';
import 'package:evie_ui_test/ui/auth/registration/widges/passwordPage.dart';
import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {

  @override
  Widget build(BuildContext context) {
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

        body: Container(
            child: EmailPage(),
        )
    );
  }
}
