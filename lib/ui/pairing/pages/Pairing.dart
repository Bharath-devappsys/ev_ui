import 'package:evie_ui_test/colors/evColors.dart';
import 'package:evie_ui_test/ui/pairing/widgets/startPair.dart';
import 'package:flutter/material.dart';

class Pairing extends StatefulWidget {
  const Pairing({super.key});

  @override
  State<Pairing> createState() => _PairingState();
}

class _PairingState extends State<Pairing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: primaryColor,
      body: StartPairing()
    );
  }
}
