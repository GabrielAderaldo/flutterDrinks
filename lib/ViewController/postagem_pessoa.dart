import 'package:apk_bebidas/View/alertas/alertas.dart';
import 'package:apk_bebidas/View/inpults/inpults.dart';
import 'package:apk_bebidas/View/pages/postagem_pessoa_page.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Cadastro de pessoas"),
        ),
        body: Postagem_pessoas_page.stackPostagem(
            _controllerInpultName, _controllerPathImage, () async {
          String response = await repository.postPessoas(
              _controllerInpultName.text, _controllerPathImage.text);

          if (response != "Postagem criada com sucesso!") {
            showDialog(
                context: context,
                builder: (context) =>
                    alertas.erroSimples("Atenção", response, "OK", context));
          } else {
            showDialog(
                context: context,
                builder: (context) => alertas.alertaSimples(response, context));
          }
        }, "placeholder"));
  }
}
