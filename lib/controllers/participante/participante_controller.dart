import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:wticifes_app/models/participante/participante.dart';

class ParticipanteController extends StatefulWidget {
  @override
  _ParticipanteControllerState createState() => _ParticipanteControllerState.instance;

  adicionarParticipante(GlobalKey<FormState> formKey, Participante participante) {
    return createState()._adicionarParticipante(formKey, participante);
  }
}

class _ParticipanteControllerState extends State<ParticipanteController> {

  final FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference databaseReference;

  static _ParticipanteControllerState _instance;

  _ParticipanteControllerState._(){}

  static _ParticipanteControllerState get instance => _instance = _instance??_ParticipanteControllerState._();


  @override
  void initState() {
    super.initState();
  }

  void _adicionarParticipante(GlobalKey<FormState> formKey, Participante participante) {
    final FormState form = formKey.currentState;
    databaseReference = database.reference().child('participante');

    if (form.validate()) {
      form.save();
      form.reset();

      //Salvar dados firebase
      databaseReference.push().set(participante.toJson());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
