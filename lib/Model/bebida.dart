class Drinks {
  String? nameDrink;
  bool? isBebeu;
  String? id;
  String? personId;

  Drinks({this.nameDrink, this.isBebeu, this.id, this.personId});

  factory Drinks.fromJson(Map<String, dynamic> json) {
    return Drinks(
        id: json["_id"],
        nameDrink: json["name"],
        personId: json["usrId"],
        isBebeu: json["done"]);
  }
}
