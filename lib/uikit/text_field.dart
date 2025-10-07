import 'package:flutter/material.dart' as m;
import 'package:get/get.dart';
import 'package:royalxui/toolkit.dart' as t;

class TextField extends m.StatelessWidget {
  final m.TextEditingController? controller;
  final m.FocusNode? focusNode;
  final Function(String)? onChanged;
  final String? errorText;
  final String? labelText;
  const TextField({
    super.key,
    this.controller,
    this.focusNode,
    this.onChanged,
    this.errorText,
    this.labelText,
  });

  @override
  m.Widget build(m.BuildContext context) {
    return m.TextField(
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      textAlign: m.TextAlign.left,
      decoration: m.InputDecoration(
        labelText: labelText,
        errorText: errorText,
        border: m.OutlineInputBorder(),
        labelStyle: m.TextStyle(
          fontFamily: Get.locale?.languageCode == t.Constants.en
              ? 'Roboto'
              : 'shabnam',
        ),
        errorStyle: m.TextStyle(
          fontFamily: Get.locale?.languageCode == t.Constants.en
              ? 'Roboto'
              : 'shabnam',
        ),
      ),
    );
  }
}
