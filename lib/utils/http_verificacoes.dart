class http_verificacoes {
  static String verificarResposta(int? statusCode) {
    switch (statusCode) {
      case 200:
        return "Postagem realizada com sucesso!";
      case 201:
        return "Postagem criada com sucesso!";
      case 401:
        return "Você não tem autorização para essa ação";
      case 404:
        return "Falha na internet";
      case 500:
        return "falha ao tentar adicionar a data";
      default:
        return "erro desconhecido";
    }
  }
}
