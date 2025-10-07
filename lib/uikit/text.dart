import 'package:flutter/material.dart' as m;
import 'package:get/get.dart';
import 'package:royalxui/toolkit.dart' as t;

class Text extends m.StatelessWidget {
  final String data;
  final t.EnumFontSize fontSize;
  const Text(this.data, {super.key, this.fontSize = t.EnumFontSize.body});

  @override
  m.Widget build(m.BuildContext context) {
    m.FontWeight fontWeight() {
      switch (fontSize) {
        case t.EnumFontSize.body:
          return m.FontWeight.normal;
        case t.EnumFontSize.title:
          return m.FontWeight.bold;
        default:
          return m.FontWeight.w200;
      }
    }

    double size() {
      switch (fontSize) {
        case t.EnumFontSize.body:
          return 15;
        case t.EnumFontSize.title:
          return 20;
        default:
          return 10;
      }
    }

    return m.Text(
      data,
      style: m.TextStyle(
        fontFamily: Get.locale?.languageCode == t.Constants.en
            ? 'Roboto'
            : 'shabnam',
        fontWeight: fontWeight(),
        fontSize: size(),
      ),
    );
  }
}
