import 'package:flutter/material.dart';

extension NumberParsing on String {
  int parseInt() {
    return int.parse(this);
  }
}

extension StringUtils on String? {
  bool isNullOrEmpty() {
    return (this ?? "").isEmpty;
  }
}

extension TextEditingControllerSetValue on TextEditingController {
  TextEditingController setValue(String? value) {
    try {
      var cursorPos = (value ?? "").isNotEmpty ? selection.base.offset : 0;
      text = value ?? "";
      selection = TextSelection(
        baseOffset: cursorPos,
        extentOffset: cursorPos,
      );
      return this;
    } catch (ex) {
      var cursorPos = 0;
      text = value ?? "";
      selection = TextSelection(
        baseOffset: cursorPos,
        extentOffset: cursorPos,
      );
      return this;
    }
  }
}
