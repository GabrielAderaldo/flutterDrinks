class Drinks {
  String? nameDrink;
  bool? isBebeu;
  String? id;
  String? personId;

  Drinks({this.nameDrink, this.isBebeu, this.id, this.personId});

  Drinks.fromJson(Map<String, dynamic> json) {
    nameDrink = json['nameDrink'];
    isBebeu = json['isBebeu'];
    id = json['id'];
    personId = json['PersonId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nameDrink'] = this.nameDrink;
    data['isBebeu'] = this.isBebeu;
    data['id'] = this.id;
    data['PersonId'] = this.personId;
    return data;
  }
}
