import 'dart:ui';

import 'package:apk_bebidas/Model/Pessoa.dart';
import 'package:apk_bebidas/datasource/local_datasorce.dart';
import 'package:apk_bebidas/datasource/remote_datasource.dart';
import 'package:apk_bebidas/repository/repository.dart';
import 'package:flutter/material.dart';

class Home_page extends StatefulWidget {
  String title;

  Home_page(this.title);

  @override
  _Home_pageState createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  @override
  void initState() {
    super.initState();
    atualizarPessoas();
  }

  List<Pessoa> pessoas = [];
  Repository repository = Repository(Local(), Remote());
  Future<void> atualizarPessoas() async {
    var data = await repository.getPessoas();

    setState(() {
      pessoas = data;
    });
  }

  Padding paddins(nPaddins, Widget card) {
    return Padding(child: card, padding: EdgeInsets.all(nPaddins));
  }

  ListTile upCard(String urlImagem, String numeroBebidas, String nome) {
    return ListTile(
      title: Text(nome),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(urlImagem),
      ),
      trailing: Text(numeroBebidas),
    );
  }

  ListBody bBody(String nome) {
    return ListBody(
      children: [Text(nome)],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: widget.title,
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Pessoas adicionadas."),
          ),
          body: RefreshIndicator(
            onRefresh: atualizarPessoas,
            child: ListView.builder(
                padding: EdgeInsets.all(12),
                itemCount: pessoas.length,
                itemBuilder: (context, i) {
                  var indexPessoa = pessoas[i];
                  return Card(
                    margin: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        upCard(
                          indexPessoa.path ?? "",
                          indexPessoa.drinks!.length.toString(),
                          indexPessoa.name ?? "",
                        ),
                      ],
                    ),
                  );
                }),
          )),
    );
  }
}
