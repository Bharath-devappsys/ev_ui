import 'dart:async';

import 'package:evie_ui_test/colors/evColors.dart';
import 'package:evie_ui_test/ui/pairing/widgets/connecting_ring.dart';
import 'package:evie_ui_test/ui/pairing/widgets/ev_paired.dart';
import 'package:evie_ui_test/util/const/ev_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PairInProgress extends StatefulWidget {
  const PairInProgress({super.key});

  @override
  State<PairInProgress> createState() => _PairInProgressState();
}

class _PairInProgressState extends State<PairInProgress> {

  double percent=10.0;
  void startLoading() {
    Timer? timer;
    timer = Timer.periodic(Duration(milliseconds: 400), (_) {
      setState(() {
        percent += 15;

        if (percent >= 100) {
          timer!.cancel();

          Navigator.of(context).push(
              CupertinoPageRoute(builder: (context)=> EvPaired())
          );
        }
      });
    });
  }

  @override
  void initState(){
    super.initState();
    startLoading();
  }


  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
            height: screenHeight,
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.15,
                ),
                Container(
                  child: CupertinoActivityIndicator(
                      radius: 30.0),
                ),
                SizedBox(
                  height: screenHeight * 0.20,
                ),
                Container(
                  child: Text(pair_in_progress, style: TextStyle(
                    color: secondaryColor,
                    fontSize: 28,
                  ),),
                ),
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                Container(
                  child: Text(
                    pair_in_progress_subheading,
                    style: TextStyle(
                        fontSize: 16,
                        color: secondaryColor
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

              ],
            ),
          )
      ),
      floatingActionButton: Container(
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.only(bottom: 8, left: 28),
        child:
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(builder: (context)=> ConnectingRing())
                  );
                },
                child: Text(cancel_pairing),
              )
      ),
    );
  }
}
