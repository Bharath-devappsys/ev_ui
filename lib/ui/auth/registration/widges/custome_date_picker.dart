import 'package:flutter/cupertino.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({super.key});

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CupertinoDatePicker(
        initialDateTime: DateTime.now(),
        maximumDate: DateTime.now(),
        minimumYear: 1947,
        maximumYear: 2024,
        mode: CupertinoDatePickerMode.date,
        onDateTimeChanged: (DateTime value) {},
      ),
    );
  }
}
