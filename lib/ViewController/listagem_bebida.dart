import 'package:apk_bebidas/Model/bebida.dart';
import 'package:apk_bebidas/ViewController/postagem_drink.dart';
import 'package:apk_bebidas/datasource/local_datasorce.dart';
import 'package:apk_bebidas/datasource/remote_datasource.dart';
import 'package:apk_bebidas/repository/repository.dart';
import 'package:flutter/material.dart';

class Listagem_drink extends StatefulWidget {
  const Listagem_drink(this.id, this.nomePessoa, this.path);

  final String nomePessoa;
  final String id;
  final String path;

  @override
  _Listagem_drinkState createState() => _Listagem_drinkState();
}

class _Listagem_drinkState extends State<Listagem_drink> {
  bool isSelected = false;
  List<Drinks> bebidas = [];

  @override
  void initState() {
    super.initState();
    atualizarBebidas();
  }

  Future<void> atualizarBebidas() async {
    var data = await repository.getDrinks(widget.id);

    setState(() {
      bebidas = data;
    });
  }

  Repository repository = Repository(Local(), Remote());

  Widget containerCardPerfil() {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Row(
        children: [
          ClipOval(
              child: Image.network(
            widget.path,
            errorBuilder: (context, error, stackTrace) {
              return Image.network(
                  "https://cdn.discordapp.com/attachments/580125063186087966/926234408191656036/unknown.png");
            },
            fit: BoxFit.cover,
            width: 90.0,
            height: 90.0,
          )),
          Padding(
              padding: EdgeInsets.all(30.0),
              child: Row(
                children: [
                  Text(
                    "${widget.nomePessoa}",
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ))
        ],
      ),
      elevation: 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Portal de bebidas"),
      ),
      body: RefreshIndicator(
        onRefresh: atualizarBebidas,
        child: Column(
          children: [
            containerCardPerfil(),
            Expanded(
              child: ListView.builder(
                  itemCount: bebidas.length,
                  itemBuilder: (context, indexPath) {
                    var bebida = bebidas[indexPath];
                    return Card(
                      margin: EdgeInsets.all(8),
                      child: Column(
                        children: [
                          CheckboxListTile(
                            value: bebida.isBebeu,
                            onChanged: (value) {
                              setState(() {
                                bebida.isBebeu = value;
                                repository
                                    .deletetDrinks([value], bebida.id ?? "");
                              });
                            },
                            title: Text(
                              bebida.nameDrink ?? "",
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
            ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(26))),
                      context: context,
                      builder: (context) => Postagem_drink(widget.id));
                },
                child: Text("Adicionar Bebidas"))
          ],
        ),
      ),
    );
  }
}
