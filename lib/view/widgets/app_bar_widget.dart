import 'package:flutter/material.dart';

import '../../constants.dart';

AppBar appBar({
  required String title,
}) {
  return AppBar(
    backgroundColor: m6Color,
    centerTitle: true,
    elevation: 0.0,
    title: Text(
      title,
      style: const TextStyle(
        color: mColor,
        fontFamily: 'Nunito-ExtraBold',
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
  );
}
