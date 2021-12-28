import 'package:apk_bebidas/Model/Pessoa.dart';
import 'package:apk_bebidas/datasource/local_datasorce.dart';
import 'package:apk_bebidas/datasource/remote_datasource.dart';

class Repository {
  Repository(Local local, this.remote);

  final Remote remote;

  Future<List<Pessoa>> getPessoas() async {
    return remote.getpessoas();
  }
}
