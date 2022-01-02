import 'dart:convert';
import 'dart:io';

import 'package:apk_bebidas/Model/Pessoa.dart';
import 'package:apk_bebidas/Model/bebida.dart';
import 'package:apk_bebidas/utils/http_verificacoes.dart';
import 'package:apk_bebidas/utils/url_shared.dart';
import 'package:dio/dio.dart';

class Remote {
  Dio dio = Dio();

  Future<String> postPessoas(String nome, String path) async {
    try {
      var urlShared = Url_shared();
      var baseUrlHeroko = urlShared.baseUrlHeroko();

      Map mapBody = {"name": nome, "path": path};

      var response = await dio.post("$baseUrlHeroko/user/",
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          }),
          data: mapBody);

      return http_verificacoes.verificarResposta(response.statusCode);
    } on DioError catch (err) {
      return err.message.toString();
    }
  }

  Future<String> postBebidas(String userID, String descricao) async {
    try {
      var urlShared = Url_shared();
      var baseUrl = urlShared.baseUrl();
      var baseUrlHeroko = urlShared.baseUrlHeroko();
      Map map = {"usrId": userID, "name": descricao};

      var response = await dio.post("$baseUrlHeroko/drinks/",
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          }),
          data: map);

      return http_verificacoes.verificarResposta(response.statusCode);
    } on DioError catch (err) {
      return err.message.toString();
    }
  }

  Future<String> removeDrink(List done, String idDrink) async {
    try {
      var urlShared = Url_shared();
      var baseUrl = urlShared.baseUrl();
      var baseUrlHeroko = urlShared.baseUrlHeroko();

      Map data = {
        "ids": idDrink,
        "done": [done]
      };

      var response = await dio.put("$baseUrlHeroko/drinks/done",
          data: data,
          options: Options(headers: {
            "Content-Type": "application/json",
          }));

      return http_verificacoes.verificarResposta(response.statusCode);
    } on DioError catch (err) {
      return err.message.toString();
    }
  }

  Future<List<Drinks>> getDrinks(String pessoaID) async {
    try {
      List<Drinks> bebidas = [];
      var urlShared = Url_shared();
      var baseUrl = urlShared.baseUrl();
      var baseUrlHeroko = urlShared.baseUrlHeroko();
      var response = await dio.get("$baseUrlHeroko/user/$pessoaID/drinks");

      switch (response.statusCode) {
        case 200:
          var responseData = response.data;
          if (response.data == "null") {
            return [];
          }
          var drinksData = json.decode(responseData) as List;
          drinksData.forEach((drinks) {
            bebidas.add(Drinks.fromJson(drinks));
          });
      }
      return bebidas;
    } on DioError catch (err) {
      print(err.message.toString());
      return List.empty();
    }
  }

  Future<List<Pessoa>> getpessoas() async {
    try {
      List<Pessoa> pessoas = [];
      var urlShared = Url_shared();
      var baseUrl = urlShared.baseUrl();
      var baseUrlHeroko = urlShared.baseUrlHeroko();
      var response = await Dio().get("$baseUrlHeroko/user/");

      switch (response.statusCode) {
        case 200:
          var responseJson = json.decode(response.data);
          var pessoasData = responseJson as List;

          for (var indexPath = 0; indexPath < pessoasData.length; indexPath++) {
            var dPessoas = pessoasData[indexPath];
            var pessoaListDrinks = await getDrinks(dPessoas["_id"]);
            var pessoa = Pessoa.fromJson(dPessoas);
            pessoa.drinks = pessoaListDrinks;
            pessoas.add(pessoa);
          }
          break;
      }

      return pessoas;
    } catch (error) {
      List<Pessoa> pessoas = [];
      return pessoas;
    }
  }
}
