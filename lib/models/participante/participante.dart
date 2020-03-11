import 'package:firebase_database/firebase_database.dart';

class Participante {
  String key;
  String nome;
  String sobrenome;
  String email;
  String instituicao;
  String cargo;
  String senha;
  String confirma_senha;
  String aceita_noticias;

  Participante(this.nome, this.sobrenome, this.email, this.instituicao, this.cargo, this.senha, this.confirma_senha, this.aceita_noticias);

  Participante.fromSnapShot(DataSnapshot snapshot):
        key = snapshot.key,
        nome = snapshot.value['nome'],
        sobrenome = snapshot.value['sobrenome'],
        email = snapshot.value['email'],
        instituicao = snapshot.value['instituicao'],
        cargo = snapshot.value['cargo'],
        senha = snapshot.value['senha'],
        confirma_senha = snapshot.value['confirma_senha'],
        aceita_noticias = snapshot.value['aceita_noticias'];

  toJson(){
    return {
      "nome" : nome,
      "sobrenome" : sobrenome,
      "email" : email,
      "instituicao" : instituicao,
      "cargo" : cargo,
      "senha" : senha,
      "confirma_senha" : confirma_senha,
      "aceita_noticias" : aceita_noticias
    };
  }

}
