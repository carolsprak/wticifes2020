
import 'package:flutter/material.dart';
import 'package:wticifes_app/firebase/firebase_service.dart';
import 'package:wticifes_app/helpers/utils.dart';
import 'package:wticifes_app/models/participante/participante.dart';

class ParticipanteController extends StatefulWidget {
  @override
  _ParticipanteControllerState createState() => _ParticipanteControllerState.instance;

  adicionarParticipante(GlobalKey<FormState> formKey, Participante participante) {
    return createState()._adicionarParticipante(formKey, participante);
  }

  bool verificarAutenticacao(GlobalKey<FormState> formKey, Participante participante) {
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

  void _adicionarParticipante(GlobalKey<FormState> formKey, Participante participante) {
    final FormState form = formKey.currentState;

    if (form.validate()) {
      form.save();
      form.reset();

    firebaseService.cadastrar(participante);
    }
  }

  bool _verificarAutenticacao(GlobalKey<FormState> formKey, Participante participante) {
    final FormState form = formKey.currentState;
    //databaseReference = database.reference().child('participante');
    Participante participanteLogin;

    if (form.validate()) {
      form.save();
      form.reset();

      _recuperarParticipantes();

      /*if (participanteLogin.senha == participante.senha) {
        return true;
      }*/
    }
    return false;
  }

  void _recuperarParticipantes(){

  //  databaseReference = database.reference();
  //  Query query2 = databaseReference.child('participante').orderByChild('email').equalTo('carolsprak@email.com');

  //  debugPrint(query2.onValue.first.toString());

  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
