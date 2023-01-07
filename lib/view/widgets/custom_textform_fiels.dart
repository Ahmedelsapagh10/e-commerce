import 'package:flutter/material.dart';
import 'package:juniorflutterdevelopervacancytask/constants.dart';

class Custom_Text_Field extends StatelessWidget {
  String? hintText;
  bool? obscureText;
  TextInputType? textInputType;
  Function(String)? onChange;
  Function(String)? onFieldSubmitted;

  Custom_Text_Field(
      {this.hintText,
      this.textInputType,
      this.onChange,
      this.obscureText = false});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (e) {
        if (e!.isEmpty) {
          return 'Please Enter your info';
        }
      },
      //  onFieldSubmitted: onFieldSubmitted,
      onChanged: onChange,
      obscureText: obscureText!,
      cursorColor: Colors.white,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: m3Color),
          focusColor: Colors.red,
          fillColor: mColor,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                width: 2,
                color: m3Color,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                width: 2,
                color: m3Color,
              )),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: m3Color,
                width: 2,
              ))),
    );
  }
}
