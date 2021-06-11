import 'package:bloc_example/theme/color.dart';
import 'package:flutter/material.dart';

Widget buildTextField(TextEditingController controller,
    {Widget? suffixIcon,
    bool? enable = true,
    String? label,
    ValueChanged<String?>? onchange,
    String? error,
    int? maxLine = 1,
    String? hintText}) {
  return Container(
    constraints: BoxConstraints(minHeight: 50, maxHeight: double.infinity),
    child: TextFormField(
      maxLines: maxLine,
      controller: controller,
      enabled: enable,
      onChanged: onchange,
      style: TextStyle(fontSize: 14),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: AppColor.grey_500),
        suffixIcon: suffixIcon,
        errorText: error == "" ? null : error,
        contentPadding: suffixIcon == null
            ? EdgeInsets.fromLTRB(10, 15, 20, 10)
            : EdgeInsets.fromLTRB(10, 0, 10, 0),
        labelText: label,
        labelStyle: TextStyle(color: AppColor.grey_500),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color: AppColor.blue, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color: AppColor.grey_700, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color: AppColor.red, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color: AppColor.red, width: 1),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color: AppColor.grey_700, width: 1),
        ),
      ),
    ),
  );
}
