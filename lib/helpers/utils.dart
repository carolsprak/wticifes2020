import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

class Utils {
  static void fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static String textToMd5(String text) {
    return md5.convert(utf8.encode(text)).toString();
  }
}
