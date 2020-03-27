import 'package:firebase_database/firebase_database.dart';
import 'package:wticifes_app/helpers/prefs.dart';
import 'dart:convert' as convert;

class Transporte {
  String key;
  String dia;
  String data;
  String local_saida;
	String local_chegada;
	String intinerario;
	String horario_saida;
	String horario_chegada;
  String linha;
	String ano_evento;

  Transporte(this.dia, this.data, this.local_saida, this.local_chegada, this.intinerario, 
  this.horario_saida, this.horario_chegada, this.linha, this.ano_evento);

  Transporte.fromSnapShot(DataSnapshot snapshot):
        key = snapshot.key,
        dia = snapshot.value['dia'],
        data = snapshot.value['data'],
        local_saida = snapshot.value['local_saida'],
        local_chegada = snapshot.value['local_chegada'],
        intinerario = snapshot.value['intinerario'],
        horario_saida = snapshot.value['horario_saida'],
        horario_chegada = snapshot.value['horario_chegada'],
        linha = snapshot.value['linha'],
        ano_evento = snapshot.value['ano_evento'];

  toJson(){
    return {
      "dia" : dia,
      "data" : data,
      "local_saida" : local_saida,
      "local_chegada" : local_chegada,
      "intinerario" : intinerario,
      "horario_saida" : horario_saida,
      "horario_chegada" : horario_chegada,
      "linha" : linha,
      "ano_evento" : ano_evento
    };
  }

  Transporte.fromJson(Map<String, dynamic> json) {
    dia = json['dia'];
    data = json['data'];
    local_saida = json['local_saida'];
    local_chegada = json['local_chegada'];
    intinerario = json['intinerario'];
    horario_saida = json['horario_saida'];
    horario_chegada = json['horario_chegada'];
    linha = json['linha'];
    ano_evento =json['ano_evento'];
  }

  static void clear() {
    Prefs.setString("transporte.prefs", "");
  }

  void save() {
    Map map = toJson();

    String json = convert.json.encode(map);

    Prefs.setString("transporte.prefs", json);
  }

  static Future<Transporte> get() async {
    String json = await Prefs.getString("transporte.prefs");
    if(json.isEmpty) {
      return null;
    }
    Map map = convert.json.decode(json);
    Transporte transporte = Transporte.fromJson(map);
    return transporte;
  }

  @override
  String toString() {
    return 'Transporte{linha: $linha, intinerario: $intinerario, data: $data}';
  }

}
