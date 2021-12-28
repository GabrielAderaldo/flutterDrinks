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
    id = json['id'];
    dataId = json['dataId'];
    if (json['drinks'] != null) {
      drinks = [];
      json['drinks'].forEach((v) {
        drinks!.add(new Drinks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['path'] = this.path;
    data['id'] = this.id;
    data['dataId'] = this.dataId;
    if (this.drinks != null) {
      data['drinks'] = this.drinks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
