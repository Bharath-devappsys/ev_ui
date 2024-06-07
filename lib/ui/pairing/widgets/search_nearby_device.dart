import 'package:evie_ui_test/ui/pairing/widgets/pair_evie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../colors/evColors.dart';
import '../../../util/const/ev_text.dart';

class SearchNearbyDevice extends StatefulWidget {
  const SearchNearbyDevice({super.key});

  @override
  State<SearchNearbyDevice> createState() => _SearchNearbyDeviceState();
}

class _SearchNearbyDeviceState extends State<SearchNearbyDevice> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(18),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: screenHeight * 0.08,
              ),
              Container(
                child: Text(
                  "Searching for nearby devices",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.15,
              ),
              Container(
                width: screenWidth,
                child: const Image(
                  image: AssetImage('assets/img/Image.png'),
                  // color: Colors.transparent,
                ),
              ),


              SizedBox(
                height: screenHeight * 0.05,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.only(bottom: 18,left: 28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Thanks for your patience. This can take a few minutes…",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: screenHeight * 0.02,),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width:  screenWidth * 0.93, height: 50),
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(width: 2.0, color: secondaryColor)),
                  onPressed: (){

                  },
                  child: Text(
                      "Cancel Connecting",
                    style: TextStyle(
                      color: secondaryColor,
                      fontSize: 18
                    ),
                  ))
            ),
          ],
        ),
      ),
    );
  }
}
