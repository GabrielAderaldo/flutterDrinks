import 'package:apk_bebidas/View/Bordas/BordersStyle.dart';
import 'package:apk_bebidas/View/alertas/alertas.dart';
import 'package:apk_bebidas/datasource/local_datasorce.dart';
import 'package:apk_bebidas/datasource/remote_datasource.dart';
import 'package:apk_bebidas/repository/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Postagem_pessoa extends StatefulWidget {
  const Postagem_pessoa({Key? key}) : super(key: key);

  @override
  _Postagem_pessoaState createState() => _Postagem_pessoaState();
}

class _Postagem_pessoaState extends State<Postagem_pessoa> {
  late TextEditingController _controllerInpultName;
  late TextEditingController _controllerPathImage;
  Repository repository = Repository(Local(), Remote());

  @override
  void initState() {
    super.initState();
    _controllerInpultName = TextEditingController();
    _controllerPathImage = TextEditingController();
  }

  Widget inpult(String titulo, TextEditingController _controller) {
    return TextFormField(
      controller: _controller,
      decoration:
          InputDecoration(border: OutlineInputBorder(), hintText: titulo),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Cadastro de pessoas"),
      ),
      body: Stack(
        children: [
          Positioned(
            left: 20,
            right: 20,
            top: 30,
            bottom: 140,
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: inpult("Digite o nome", _controllerInpultName),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: inpult("Path da image", _controllerPathImage),
                  ),
                ],
              ),
              height: 200,
              width: 200,
              decoration: BordersStyle.borderRadius(10),
            ),
          ),
          Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: ElevatedButton(
                child: Text("Postar"),
                onPressed: () {
                  repository
                      .postPessoas(
                          _controllerInpultName.text, _controllerPathImage.text)
                      .then((value) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return alertas.alertaSimples(
                              "${_controllerInpultName.text} Foi adicionada com sucesso",
                              context);
                        });
                  });
                },
              ))
        ],
      ),
    );
  }
}
