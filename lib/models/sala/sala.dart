import 'package:firebase_database/firebase_database.dart';


class Sala {
  String key;
  String nome;


  Sala(this.nome);

  Sala.fromSnapShot(DataSnapshot snapshot):
        key = snapshot.key,
        nome = snapshot.value['nome'];

  toJson(){
    return {
      "nome" : nome
    };
  }

}
