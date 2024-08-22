import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

Widget customTextInput({
  required String placeholder,
  required TextStyle placeHolderStyle,
  required TextStyle inputStyle,
  required TextEditingController inputController
}) {
  return TextField(
    controller: inputController,
    decoration: InputDecoration(
      hintText: placeholder,
      hintStyle: placeHolderStyle,
      border: InputBorder.none,
    ),
    style: inputStyle,
    maxLines: null,
  );
}
