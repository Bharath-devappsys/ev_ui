import 'package:evie_ui_test/colors/evColors.dart';
import 'package:evie_ui_test/ui/pairing/widgets/pair_evie.dart';
import 'package:evie_ui_test/util/const/ev_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EvieCantPair extends StatefulWidget {
  const EvieCantPair({super.key});

  @override
  State<EvieCantPair> createState() => _EvieCantPairState();
}

class _EvieCantPairState extends State<EvieCantPair> {
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
                height: screenHeight * 0.10,
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
                height: screenHeight * 0.10,
              ),
              Text(
                cantPair_heading,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Text(
                cantPair_subheading,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.only(bottom: 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                print("$cancel_pairing pressed");
              },
              child: Text(cancel_pairing,
                style: TextStyle(
                    color: secondaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),),
            ),
            SizedBox(height: screenHeight * 0.02,),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: screenWidth * 0.93, height: 50),
              child: FloatingActionButton(
                child: Text(
                  goto_settings ,
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 18
                ),),
                backgroundColor: secondaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50))
                ),
                onPressed: (){
                  // Navigator.of(context).push(
                  //     CupertinoPageRoute(builder: (context) => PairEvie())
                  // );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
