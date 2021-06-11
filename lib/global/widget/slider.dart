import 'package:bloc_example/theme/color.dart';
import 'package:flutter/material.dart';


Widget buildSliderWidget(double value, String title,
    ValueChanged<double> onchange, List<String> levelList) {
  double division = levelList.isEmpty ? 1 : levelList.length - 1;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(title),
      Slider(
        value: value > 1 ? 0 : value,
        onChanged: onchange,
        max: 1,
        label: value.toString(),
        min: 0,
        divisions: division.toInt(),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List<Widget>.generate(levelList.length, (int index) {
          return Text(levelList[index],
              style: TextStyle(
                  color: value / (1 / (division)) == index.toDouble()
                      ? AppColor.greenAccent
                      : AppColor.grey_500,
                  fontSize: 10));
        }),
      )
    ],
  );
}