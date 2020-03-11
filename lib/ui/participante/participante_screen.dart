import 'package:flutter/material.dart';
import 'package:wticifes_app/ui/participante/participante_cadastro.dart';
import 'package:wticifes_app/ui/participante/participante_mixin.dart';

class ParticipanteScreen extends StatefulWidget {
  @override
  _ParticipanteScreenState createState() => _ParticipanteScreenState();

  Future cadastrar(BuildContext context) async {
    return _ParticipanteScreenState()._cadastrar(context);
  }
}

class _ParticipanteScreenState extends State<ParticipanteScreen> {

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future _cadastrar(BuildContext context) async {
    Map resultado = await Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) {
      return new ParticipanteCadastro();
    }));
  }
}
