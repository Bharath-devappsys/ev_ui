import 'dart:ui';

import 'package:evie_ui_test/colors/evColors.dart';
import 'package:evie_ui_test/ui/pairing/widgets/evie_cant_pair.dart';
import 'package:evie_ui_test/ui/pairing/widgets/pair_in_progress.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ConnectingRing extends StatefulWidget {
  const ConnectingRing({super.key});

  @override
  State<ConnectingRing> createState() => _ConnectingRingState();
}

class _ConnectingRingState extends State<ConnectingRing> {
  int _selectedCard = -1;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: Container(
        padding: EdgeInsets.only(bottom: 5, left: 28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Pick the device you want to connect with.",
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(
                  width: screenWidth * 0.93, height: 50),
              child: FloatingActionButton(
                child: Text(
                  "Connect",
                  style: TextStyle(
                      color: _selectedCard < 0 ? secondaryColor : primaryColor,
                      fontSize: 18),
                ),
                backgroundColor:
                    _selectedCard < 0 ? Colors.grey.shade400 : secondaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                onPressed: _selectedCard < 0
                    ? null
                    : () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (context) => PairInProgress()));
                      },
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("         "),
              Container(
                child: Text(
                  "Connecting ring",
                  style: TextStyle(fontSize: 24),
                ),
              ),
              Container(
                child: IconButton(
                  padding: EdgeInsets.only(right: 15),
                  onPressed: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => EvieCantPair()));
                  },
                  icon: Icon(
                    Icons.cancel_outlined,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          Container(
            color: primaryColor,
            height: screenWidth * 1.5,
            child: ListView.builder(
                itemCount: 14,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      if(index == 0) ... [
                        Text(
                          "Device found",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey, fontSize: 20),
                        ),
                      ],
                      SizedBox(
                        height: 18,
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 8, right: 8),
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                              color: _selectedCard == index ? secondaryColor.withOpacity(0.2) : Colors.grey.shade100,
                              spreadRadius: 1,
                              blurRadius: 15,
                              offset: Offset(0, 4),
                            )
                          ]),
                          height: 56,
                          child: GestureDetector(
                            onTap: () => setState(() => _selectedCard = index),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50),
                                  ),
                                  border: Border.all(
                                      color: _selectedCard == index
                                          ? successColor
                                          : secondaryColor.withOpacity(0.2)),
                                  color: _selectedCard < 0 ||
                                          _selectedCard == index
                                      ? Colors.white
                                      : Colors.grey.shade200),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(left: 18),
                                    child: Text("Movano ${index+1}"),
                                  ),
                                  Container(
                                      padding: EdgeInsets.only(right: 28),
                                      child: _selectedCard == index
                                          ? Container(
                                              height: screenHeight * 0.023,
                                              child: Image(
                                                  image: AssetImage(
                                                      "assets/img/check_icon.png")),
                                            )
                                          : Container(
                                              child: Icon(
                                                size: screenHeight * 0.023,
                                                  Icons.radio_button_unchecked),
                                            )),
                                ],
                              ),
                            ),
                          )),
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}
