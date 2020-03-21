
import 'package:flutter/material.dart';
import 'package:wticifes_app/firebase/firebase_service.dart';
import 'package:wticifes_app/helpers/api_response.dart';
import 'package:wticifes_app/helpers/utils.dart';
import 'package:wticifes_app/models/participante/participante.dart';

class ParticipanteController extends StatefulWidget {
  @override
  _ParticipanteControllerState createState() => _ParticipanteControllerState.instance;

  Future<ApiResponse> adicionarParticipante(GlobalKey<FormState> formKey, Participante participante) {
    return createState()._adicionarParticipante(formKey, participante);
  }

  Future<ApiResponse> verificarAutenticacao(GlobalKey<FormState> formKey, Participante participante) async {
    return createState()._verificarAutenticacao(formKey, participante);
  }
}

class _ParticipanteControllerState extends State<ParticipanteController> {

  FirebaseService firebaseService = FirebaseService();

  Future<List<dynamic>> _participantes;

  static _ParticipanteControllerState _instance;

  _ParticipanteControllerState._(){}

  static _ParticipanteControllerState get instance => _instance = _instance??_ParticipanteControllerState._();


  @override
  void initState() {
    super.initState();
  }

  Future<ApiResponse> _adicionarParticipante(GlobalKey<FormState> formKey, Participante participante) async {
         
    ApiResponse response = await firebaseService.cadastrar(participante, formKey);
    return response; 
    
  }

  Future<ApiResponse> _verificarAutenticacao(GlobalKey<FormState> formKey, Participante participante) async {
    final FormState form = formKey.currentState;

    if (form.validate()) {
      form.save();
      form.reset();
      return firebaseService.login(participante.email, participante.senha);
    } else {
      return null;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
