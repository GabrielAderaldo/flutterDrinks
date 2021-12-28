import 'package:apk_bebidas/Model/Pessoa.dart';
import 'package:dio/dio.dart';

class Remote {
  //Listagem de pessoa
  Future<List<Pessoa>> getpessoas() async {
    List<Pessoa> pessoas = [];
    var response = await Dio()
        .get('https://61c24023de977000179b541d.mockapi.io/data/1/Person');

    switch (response.statusCode) {
      case 200:
        var pessoasData = response.data as List;
        pessoasData.forEach((dPessoas) {
          pessoas.add(Pessoa.fromJson(dPessoas));
        });
        break;
    }

    return pessoas;
  }
}
