import 'package:apk_bebidas/View/inpults/inpults.dart';
import 'package:flutter/material.dart';

class Modal_page {
  static Widget modalDrinkPost(
      TextEditingController nomeDrink, VoidCallback onPress) {
    return Container(
      height: 400,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 26),
            child: Center(
              child: Text(
                "Digite o nome da bebida",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(36),
            child: Inpults.inpultClassico("Drinks", nomeDrink),
          ),
          Spacer(),
          ElevatedButton(onPressed: onPress, child: Text("Postar"))
        ],
      ),
    );
  }
}
