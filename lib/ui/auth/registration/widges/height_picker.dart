import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeightPicker extends StatefulWidget {
  const HeightPicker({super.key});

  @override
  State<HeightPicker> createState() => _HeightPickerState();
}

class _HeightPickerState extends State<HeightPicker> {
  int feet = 0;
  int inches = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(18),
        child: Row(
          children: [
            Container(
              width: 200,
              child: CupertinoPicker(
                itemExtent: 35.0,
                onSelectedItemChanged: (int index) {
                  setState(() {
                    feet = index;
                  });
                },
                children: List.generate(25, (index) {
                  final isSelectedIndex = index == feet;
                  return Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${index + 1}',
                          style: TextStyle(
                            fontSize: 24,
                            color: isSelectedIndex
                                ? CupertinoColors.black
                                : CupertinoColors.inactiveGray,
                          ),
                        ),
                        if (isSelectedIndex)
                          const SizedBox(width: 5.0), // Add spacing only if selected
                        if (isSelectedIndex)
                          Text("'",style: TextStyle(fontSize: 24)), // Show "lbs" only on active index
                      ],
                    ),
                  );
                }),
              ),
            ),
            Container(
              width: 200,
              child: CupertinoPicker(
                itemExtent: 35.0,
                onSelectedItemChanged: (int index) {
                  setState(() {
                    inches = index;
                  });
                },
                children: List.generate(12, (index) {
                  final isSelectedIndex = index == inches;
                  return Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${index + 1}',
                          style: TextStyle(
                            fontSize: 24,
                            color: isSelectedIndex
                                ? CupertinoColors.black
                                : CupertinoColors.inactiveGray,
                          ),
                        ),
                        if (isSelectedIndex)
                          const SizedBox(width: 5.0), // Add spacing only if selected
                        if (isSelectedIndex)
                          Text('"',style: TextStyle(fontSize: 24),), // Show "lbs" only on active index
                      ],
                    ),
                  );
                }),
              ),
            )
          ],
        )
    );
  }
}
