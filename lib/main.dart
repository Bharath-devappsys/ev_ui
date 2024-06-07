
import 'package:evie_ui_test/ui/auth/registerORlogin/pages/RegisterOrLogin.dart';
import 'package:evie_ui_test/ui/auth/registerORlogin/pages/splash_screen.dart';
import 'package:evie_ui_test/ui/auth/registration/widges/checkPicker.dart';
import 'package:evie_ui_test/ui/auth/registration/widges/height_picker.dart';
import 'package:evie_ui_test/ui/auth/registration/widges/weight_picker.dart';
import 'package:evie_ui_test/ui/pairing/pages/Pairing.dart';
import 'package:evie_ui_test/ui/pairing/widgets/connecting_ring.dart';
import 'package:evie_ui_test/ui/pairing/widgets/pair_in_progress.dart';
import 'package:evie_ui_test/ui/pairing/widgets/search_nearby_device.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false
      ,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: GoogleFonts.firaSansTextTheme()
      ),
      home: const CheckPickers(),
    );
  }
}
