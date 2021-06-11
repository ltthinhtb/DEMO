import 'package:bloc_example/theme/color.dart';
import 'package:flutter/material.dart';

Widget buildDropDownSelectItem(String value, List<String> list, String label,
    ValueChanged<String?> onchange) {
  return Container(
    height: 50,
    child: DropdownButtonHideUnderline(
      child: DropdownButtonFormField(
          style: TextStyle(fontSize: 14),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10, 15, 15, 10),
              labelText: label,
              labelStyle: TextStyle(fontSize: 15),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide:
                  BorderSide(color: AppColor.grey_700, width: 1))),
          value: list.contains(value) ? value : null,
          onChanged: onchange,
          isExpanded: true,
          items: list
              .map((element) => DropdownMenuItem(
            child: Text(element),
            value: element,
            onTap: () {},
          ))
              .toList()),
    ),
  );
}