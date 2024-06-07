import 'package:evie_ui_test/colors/evColors.dart';
import 'package:evie_ui_test/ui/home/pages/home.dart';
import 'package:evie_ui_test/util/const/ev_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EvPaired extends StatefulWidget {
  const EvPaired({super.key});

  @override
  State<EvPaired> createState() => _EvPairedState();
}

class _EvPairedState extends State<EvPaired> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(18),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.25,
              ),
              Container(
                height: 155,
                alignment: Alignment.center,
                child: const Image(
                  image: AssetImage('assets/img/Broken Arrow_V2 Renders.png'),
                  // color: Colors.transparent,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.07,
              ),
              Text(
                paired_heading,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Text(
                paired_subheading,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.only(bottom: 18),
        child: Container(
          child: ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: screenWidth * 0.93, height: 56),
              child: FloatingActionButton(
                child: Text(got_it , style: TextStyle(
                    color: primaryColor,
                    fontSize: 18
                ),),
                backgroundColor: secondaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50))
                ),
                onPressed: (){
                  Navigator.of(context).push(
                      CupertinoPageRoute(builder: (context) => HomeScreen())
                  );
                },
              ),
            ),
      ),
    ),);
  }
}
