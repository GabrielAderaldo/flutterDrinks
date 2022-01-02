import 'dart:ffi';

import 'package:flutter/material.dart';

class Inpults {
  static Widget inpultClassico(
      //TODO: Ajeitar o inpult
      String placeholder,
      TextEditingController _controller) {
    return TextField(
      controller: _controller,
      decoration:
          InputDecoration(border: OutlineInputBorder(), hintText: placeholder),
    );
  }

  static Widget posicionedinputl(
      String placeholder, TextEditingController _controller,
      {double? top, double? bottom}) {
    return Positioned(
        top: top,
        left: 20,
        right: 20,
        bottom: bottom,
        child: TextFormField(
          controller: _controller,
          decoration: InputDecoration(
              border: OutlineInputBorder(), hintText: placeholder),
        ));
  }
}
