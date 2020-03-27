
import 'package:flutter/material.dart';
import 'package:wticifes_app/helpers/api_response.dart';
import 'package:wticifes_app/models/participante/participante.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:firebase_database/firebase_database.dart';

class ParticipanteController extends StatefulWidget {
  @override
  _ParticipanteControllerState createState() => _ParticipanteControllerState.instance;

  Future<ApiResponse> adicionarParticipante(GlobalKey<FormState> formKey, Participante participante) {
    return createState()._cadastrar(participante, formKey);
  } 

}

class _ParticipanteControllerState extends State<ParticipanteController> {

  String firebaseUserUid;

  final FirebaseAuth _auth = FirebaseAuth.instance;  

  DatabaseReference databaseReference = FirebaseDatabase.instance.reference();  

  static _ParticipanteControllerState _instance;

  _ParticipanteControllerState._(){}

  static _ParticipanteControllerState get instance => _instance = _instance??_ParticipanteControllerState._();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }  

  // salva o participante na collection de usuarios logados
  void _saveUser(FirebaseUser fUser, Participante participante) async {
    if (fUser != null) {
      firebaseUserUid = fUser.uid;
      DocumentReference refUser =
      Firestore.instance.collection("participante").document(firebaseUserUid);
      refUser.setData({
        'nome' : participante.nome,
        'email': participante.email,
        'instituicao': participante.instituicao,
        'cargo' : participante.cargo,
        'senha' : participante.senha,
        'confirma_senha': participante.confirma_senha,
        'aceita_noticias': participante.aceita_noticias
      });      
    }
  }

  Future<ApiResponse> _cadastrar(Participante participante, GlobalKey<FormState> formKey) async {
    try {
      // Usuario do Firebase
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: participante.email, password: participante.senha);
      final FirebaseUser fUser = result.user;
      print("Firebase Nome: ${fUser.displayName}");
            
      // Dados para atualizar o usuário
      final userUpdateInfo = UserUpdateInfo();
      userUpdateInfo.displayName = participante.nome;      
      fUser.updateProfile(userUpdateInfo);

      //Salva dados no firestone
      _saveUser(fUser, participante);
      
      formKey.currentState.save();
      formKey.currentState.reset();

      // Resposta genérica
      return ApiResponse.ok(msg: "Participante cadastrado com sucesso");
    } catch (error) {
      print(error);

      if (error is PlatformException) {
        print("Error Code ${error.code}");

        return ApiResponse.error(
            msg: "Erro ao criar um participante.\n\n Este e-mail já foi usado em nosso cadastro.");
      }

      return ApiResponse.error(msg: "Não foi possível criar um participante.");
    }
  }    
}
