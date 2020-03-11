import 'package:firebase_database/firebase_database.dart';
import 'package:wticifes_app/models/atividade/atividade.dart';
import 'package:wticifes_app/models/participante/participante.dart';

class Agenda {
  String key;
  Participante participante;
  Atividade atividade;

  Agenda(this.participante, this.atividade);

  Agenda.fromSnapShot(DataSnapshot snapshot):
        key = snapshot.key,
        participante = snapshot.value['participante'],
        atividade = snapshot.value['atividade'];

  toJson(){
    return {
      "participante" : participante,
      "atividade" : atividade
    };
  }

}
