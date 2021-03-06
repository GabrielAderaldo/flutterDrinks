import 'package:flutter/material.dart';

class Styles {
  static Widget Paddings(double nPadding, Widget child) {
    return Padding(padding: EdgeInsets.all(nPadding), child: child);
  }

  static BoxDecoration borderRadius(double numeroRaius) {
    return BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3))
        ],
        borderRadius: BorderRadius.circular(numeroRaius));
  }
}
