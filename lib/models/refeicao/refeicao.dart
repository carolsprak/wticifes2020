import 'package:firebase_database/firebase_database.dart';
import 'package:wticifes_app/helpers/prefs.dart';
import 'dart:convert' as convert;

class Refeicao {
  String key;
  String dia;
	String tipo;
	String cardapio;
	String valor;
	String sobremesa;
  String horario;
	String ano_evento;

  Refeicao(this.dia, this.tipo, this.cardapio, 
  this.valor, this.sobremesa, this.horario, this.ano_evento);

  Refeicao.fromSnapShot(DataSnapshot snapshot):
        key = snapshot.key,
        dia = snapshot.value['dia'],
        tipo = snapshot.value['tipo'],
        cardapio = snapshot.value['cardapio'],
        valor = snapshot.value['valor'],
        sobremesa = snapshot.value['sobremesa'],
        horario = snapshot.value['horario'],
        ano_evento = snapshot.value['ano_evento'];

  toJson(){
    return {
      "dia" : dia,
      "tipo" : tipo,
      "cardapio" : cardapio,
      "valor" : valor,
      "sobremesa" : sobremesa,
      "horario" : horario,
      "ano_evento" : ano_evento
    };
  }

  Refeicao.fromJson(Map<String, dynamic> json) {
    dia = json['dia'];
    tipo = json['tipo'];
    cardapio = json['cardapio'];
    valor = json['valor'];
    sobremesa = json['sobremesa'];
    horario = json['horario'];
    ano_evento =json['ano_evento'];
  }

  static void clear() {
    Prefs.setString("refeicao.prefs", "");
  }

  void save() {
    Map map = toJson();

    String json = convert.json.encode(map);

    Prefs.setString("refeicao.prefs", json);
  }

  static Future<Refeicao> get() async {
    String json = await Prefs.getString("refeicao.prefs");
    if(json.isEmpty) {
      return null;
    }
    Map map = convert.json.decode(json);
    Refeicao refeicao = Refeicao.fromJson(map);
    return refeicao;
  }

  @override
  String toString() {
    return 'Refeicao{dia: $dia, cardapio: $cardapio}';
  }

}
