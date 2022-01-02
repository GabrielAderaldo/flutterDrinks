import 'bebida.dart';

class Pessoa {
  String? name;
  String? path;
  String? id;
  String? dataId;
  List<Drinks>? drinks;

  Pessoa({this.name, this.path, this.id, this.dataId, this.drinks});

  Pessoa.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    path = json['path'];
    id = json['_id'];
    dataId = json['dataId'];
    if (json['drinks'] != null) {
      drinks = [];
      json['drinks'].forEach((v) {
        drinks!.add(new Drinks.fromJson(v));
      });
    }
  }
}
