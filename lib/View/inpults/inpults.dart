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
}
