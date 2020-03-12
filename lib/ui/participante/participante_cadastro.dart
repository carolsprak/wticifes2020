import 'package:flutter/material.dart';
import 'package:wticifes_app/ui/participante/participante_mixin.dart';

class ParticipanteCadastro extends StatefulWidget {
  @override
  _ParticipanteCadastroState createState() => _ParticipanteCadastroState();
}

class _ParticipanteCadastroState extends State<ParticipanteCadastro> with ParticipanteMixin {

  @override
  Widget build(BuildContext context) {
     return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          title: Text("Cadastrar Participante"),
          centerTitle: false,
        ),
        body: Container(
            padding: EdgeInsets.all(30.0),
            color: Colors.white,
            child: Column(
              children: <Widget>[

                Flexible(flex: 1, child: buildBody()),
              ],
            )));
  }
}
