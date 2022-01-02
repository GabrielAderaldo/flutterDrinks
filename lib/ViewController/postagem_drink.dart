import 'dart:async';

import 'package:apk_bebidas/View/alertas/alertas.dart';
import 'package:apk_bebidas/View/modal/modal_page.dart';
import 'package:apk_bebidas/datasource/local_datasorce.dart';
import 'package:apk_bebidas/datasource/remote_datasource.dart';
import 'package:apk_bebidas/repository/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Postagem_drink extends StatefulWidget {
  const Postagem_drink(this.id);

  final id;
  @override
  _Postagem_drinkState createState() => _Postagem_drinkState();
}

class _Postagem_drinkState extends State<Postagem_drink> {
  late TextEditingController _controllerInpultName;
  Repository repository = Repository(Local(), Remote());

  Widget inpult(String titulo, TextEditingController _controller) {
    return TextFormField(
      controller: _controller,
      decoration:
          InputDecoration(border: OutlineInputBorder(), hintText: titulo),
    );
  }

  @override
  void initState() {
    super.initState();
    _controllerInpultName = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Modal_page.modalDrinkPost(_controllerInpultName, () async {
      String resposta =
          await repository.createDrink(widget.id, _controllerInpultName.text);
      if (resposta != "Postagem criada com sucesso!") {
        showDialog(
            context: context,
            builder: (context) =>
                alertas.erroSimples("Erro", resposta, "Fechar", context));
      } else {
        Navigator.pop(context);
      }
      Navigator.pop(context);
    });
  }
}
