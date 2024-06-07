import 'package:evie_ui_test/colors/evColors.dart';
import 'package:evie_ui_test/ui/pairing/widgets/connecting_ring.dart';
import 'package:evie_ui_test/ui/pairing/widgets/evie_cant_pair.dart';
import 'package:evie_ui_test/ui/pairing/widgets/search_nearby_device.dart';
import 'package:evie_ui_test/util/const/ev_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PairEvie extends StatefulWidget {
  const PairEvie({super.key});

  @override
  State<PairEvie> createState() => _PairEvieState();
}

class _PairEvieState extends State<PairEvie> {

  CupertinoAlertDialog iosStyleAlert() {
    return CupertinoAlertDialog(
      title: Text("Evie app would like to Use Bluetooth\n"),
      content: Text("Please connect my device so I can track and monitor using my Evie ring!",textAlign: TextAlign.center,),
      actions: [
        CupertinoDialogAction(
          child: Text("Dont Allow"),
          onPressed: () => Navigator.of(context).push(
            CupertinoPageRoute(builder: (context)=> EvieCantPair())
          ),
        ),
        CupertinoDialogAction(
          child: Text("Allow"),
          onPressed: () => Navigator.of(context).push(
            CupertinoPageRoute(builder: (context)=> ConnectingRing())
          ),
        ),
      ],
    );
  }

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
                pair_evie_heading,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Text(
                pair_evie_subheading_1,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Container(
                width: 275,
                child: Text(
                  pair_evie_subheading_2,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Text(
                pair_evie_subheading_3,
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
                    fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: screenHeight * 0.02,),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: screenWidth * 0.93, height: 50),
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
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => iosStyleAlert(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
