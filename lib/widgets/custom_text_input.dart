import 'package:flutter/material.dart';

Widget customTextInput({
  required TextStyle inputStyle,
  required TextEditingController inputController,
  required InputDecoration decoration,
  int? maxLines,
  void Function(String)? onChanged
}) {
  return TextField(
    controller: inputController,
    decoration: decoration,
    style: inputStyle,
    maxLines: maxLines,
    onChanged: onChanged,
  );
}
