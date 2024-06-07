import 'package:evie_ui_test/ui/auth/registration/widges/custom_time_picker.dart';
import 'package:evie_ui_test/ui/auth/registration/widges/height_picker.dart';
import 'package:evie_ui_test/ui/auth/registration/widges/weight_picker.dart';
import 'package:flutter/material.dart';

class CheckPickers extends StatefulWidget {
  const CheckPickers({super.key});

  @override
  State<CheckPickers> createState() => _CheckPickersState();
}

class _CheckPickersState extends State<CheckPickers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomTimePicker(),
    );
  }
}
