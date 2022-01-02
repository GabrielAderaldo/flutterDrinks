import 'package:apk_bebidas/View/Style/styles.dart';
import 'package:apk_bebidas/View/inpults/inpults.dart';
import 'package:flutter/material.dart';

class Postagem_pessoas_page {
  static Widget stackPostagem(
      TextEditingController primeiroController,
      TextEditingController segundoController,
      VoidCallback onPressed,
      String placeholder) {
    Positioned containerInterno(TextEditingController primeiroController,
        TextEditingController segundoController) {
      return Positioned(
        left: 20,
        right: 20,
        bottom: 200,
        top: 20,
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: Styles.borderRadius(26),
          child: ListView(
            children: [
              CircleAvatar(
                radius: 40,
                child: Icon(Icons.filter_9_plus_sharp),
              ),
              Styles.Paddings(
                  20, Inpults.inpultClassico("Nome", primeiroController)),
              Styles.Paddings(
                  20, Inpults.inpultClassico("Path discord", segundoController))
            ],
          ),
        ),
      );
    }

    Widget buttonInterno(VoidCallback onPressed) {
      return Positioned(
          left: 20,
          right: 20,
          bottom: 20,
          child:
              ElevatedButton(onPressed: onPressed, child: Text("Adicionar")));
    }

    return Stack(children: [
      containerInterno(primeiroController, segundoController),
      buttonInterno(onPressed)
    ]);
  }
}
