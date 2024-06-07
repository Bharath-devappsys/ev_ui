import 'dart:async';

import 'package:evie_ui_test/ui/auth/registerORlogin/pages/RegisterOrLogin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double percent=10.0;
  void startLoading() {
    Timer? timer;
    timer = Timer.periodic(Duration(milliseconds: 600), (_) {
      setState(() {
        percent += 15;

        if (percent >= 100) {
          timer!.cancel();
          
            Navigator.of(context).push(
              CupertinoPageRoute(builder: (context)=> RegisterOrLogin())
            );
        }
      });
    });
  }

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    startLoading();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Lottie.asset('assets/img/LaunchEvieAnimation.json',
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width, ),
    );
  }
}
