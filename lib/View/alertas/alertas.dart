import 'package:flutter/material.dart';

class alertas {
  static Widget alertaSimples(String corpo, BuildContext context) {
    return AlertDialog(
      title: Text("Sucesso!"),
      content: Text(corpo),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("OK"))
      ],
    );
  }

  static Widget erroSimples(
      String title, String msgError, String buttonText, BuildContext context,
      {Function? onPressedError}) {
    return AlertDialog(
      title: Text(title),
      content: Text(msgError),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
              onPressedError?.call();
            },
            child: Text(buttonText))
      ],
    );
  }
}
