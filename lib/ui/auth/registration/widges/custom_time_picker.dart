import 'package:flutter/cupertino.dart';

class CustomTimePicker extends StatefulWidget {
  const CustomTimePicker({super.key});

  @override
  State<CustomTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CupertinoDatePicker(
        // initialDateTime: DateTime.now(),
        // maximumDate: DateTime.now(),
        // minimumYear: 1947,
        // maximumYear: 2024,
        initialDateTime: DateTime.now(),
        minuteInterval: 1,
        use24hFormat: false,
        mode: CupertinoDatePickerMode.time,
        onDateTimeChanged: (DateTime value) {},
      ),
    );
  }
}
