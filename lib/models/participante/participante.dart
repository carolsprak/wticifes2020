import 'package:firebase_database/firebase_database.dart';
import 'package:wticifes_app/helpers/prefs.dart';
import 'dart:convert' as convert;

class Participante {
  String key;
  String nome;
  String email;
  String instituicao;
  String cargo;
  String senha;
  String confirma_senha;
  bool aceita_noticias;

  Participante(this.nome, this.email, this.instituicao, this.cargo, this.senha, this.confirma_senha, this.aceita_noticias);

  Participante.fromSnapShot(DataSnapshot snapshot):
        key = snapshot.key,
        nome = snapshot.value['nome'],
        email = snapshot.value['email'],
        instituicao = snapshot.value['instituicao'],
        cargo = snapshot.value['cargo'],
        senha = snapshot.value['senha'],
        confirma_senha = snapshot.value['confirma_senha'],
        aceita_noticias = snapshot.value['aceita_noticias'];

  toJson(){
    return {
      "nome" : nome,
      "email" : email,
      "instituicao" : instituicao,
      "cargo" : cargo,
      "senha" : senha,
      "confirma_senha" : confirma_senha,
      "aceita_noticias" : aceita_noticias
    };
  }

  Participante.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    email = json['email'];
    instituicao = json['instituicao'];
    cargo = json['cargo'];
    senha = json['senha'];
    confirma_senha = json['confirma_senha'];
    aceita_noticias =json['aceita_noticias'];
  }

  static void clear() {
    Prefs.setString("participante.prefs", "");
  }

  void save() {
    Map map = toJson();

    String json = convert.json.encode(map);

    Prefs.setString("participante.prefs", json);
  }

  static Future<Participante> get() async {
    String json = await Prefs.getString("participante.prefs");
    if(json.isEmpty) {
      return null;
    }
    Map map = convert.json.decode(json);
    Participante participante = Participante.fromJson(map);
    return participante;
  }

  @override
  String toString() {
    return 'Participante{email: $email, nome: $nome}';
  }

}
