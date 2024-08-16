import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(String message) {
  Fluttertoast.showToast( 
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: const Color.fromARGB(255, 58, 58, 58), 
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

Color randomPastelLiteColor() {
    final Random random = Random();
    double hue = random.nextDouble() * 360;
    double saturation = 0.4 + random.nextDouble() * 0.2;
    double value = 0.8 + random.nextDouble() * 0.2;
    Color pastelColor = HSVColor.fromAHSV(1.0, hue, saturation, value).toColor();
    return pastelColor.withOpacity(0.1);
  }
