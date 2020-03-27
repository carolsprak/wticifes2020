import 'package:firebase_database/firebase_database.dart';
import 'package:wticifes_app/models/sala/sala.dart';

class Atividade {
  String key;
  String assunto;
  String dia;
  String horario;
  String palestrantes;
  String tipo;
  String ano_evento;
  Sala sala;

  Atividade(this.assunto, this.dia, this.horario, this.palestrantes, this.tipo, this.ano_evento, this.sala);

  Atividade.fromSnapShot(DataSnapshot snapshot):
        key = snapshot.key,
        assunto = snapshot.value['assunto'],
        dia = snapshot.value['dia'],
        horario = snapshot.value['horario'],
        palestrantes = snapshot.value['palestrantes'],
        tipo = snapshot.value['tipo'],
        ano_evento = snapshot.value['ano_evento'],
        sala = snapshot.value['sala'];

  toJson(){
    return {
      "assunto" : assunto,
      "dia" : dia,
      "horario" : horario,
      "palestrantes" : palestrantes,
      "tipo" : tipo,
      "ano_evento" : ano_evento,
      "sala" : sala
    };
  }

}
