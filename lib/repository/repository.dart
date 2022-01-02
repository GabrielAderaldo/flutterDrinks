import 'dart:ffi';

import 'package:apk_bebidas/Model/Pessoa.dart';
import 'package:apk_bebidas/Model/bebida.dart';
import 'package:apk_bebidas/datasource/local_datasorce.dart';
import 'package:apk_bebidas/datasource/remote_datasource.dart';

class Repository {
  Repository(Local local, this.remote);

  final Remote remote;

  Future<String> postPessoas(String nome, String path) async {
    return remote.postPessoas(nome, path);
  }

  Future<List<Pessoa>> getPessoas() async {
    return remote.getpessoas();
  }

  Future<List<Drinks>> getDrinks(String pessoaId) async {
    return remote.getDrinks(pessoaId);
  }

  Future<String> deletetDrinks(List done, String idDrink) async {
    return remote.removeDrink(done, idDrink);
  }

  Future<String> createDrink(String userID, String descricao) async {
    return remote.postBebidas(userID, descricao);
  }
}
