import 'package:evie_ui_test/ui/auth/registration/widges/custom_time_picker.dart';
import 'package:evie_ui_test/ui/auth/registration/widges/custome_date_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeightPicker extends StatefulWidget {
  const WeightPicker({super.key});

  @override
  State<WeightPicker> createState() => _WeightPickerState();
}

class _WeightPickerState extends State<WeightPicker> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
        padding: EdgeInsets.all(18),
        child: CupertinoPicker(
          itemExtent: 32.0,
          onSelectedItemChanged: (int index) {
            setState(() {
              selectedIndex = index;
            });
          },
          children: List.generate(500, (index) {
            final isSelectedIndex = index == selectedIndex;
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${index + 1}',
                    style: TextStyle(
                      color: isSelectedIndex
                          ? CupertinoColors.black
                          : CupertinoColors.inactiveGray,
                    ),
                  ),
                  if (isSelectedIndex)
                    const SizedBox(width: 5.0), // Add spacing only if selected
                  if (isSelectedIndex)
                    Text('lbs'), // Show "lbs" only on active index
                ],
              ),
            );
          }),
        ),
    );
  }
}
