import 'package:flutter/material.dart';
import 'package:wticifes_app/controllers/login/validador.dart';
import 'package:wticifes_app/controllers/participante/participante_controller.dart';
import 'package:wticifes_app/models/participante/participante.dart';

class LoginController extends StatefulWidget {
  @override
  _LoginControllerState createState() => _LoginControllerState.instance;

  bool verificarAutenticacao(
      GlobalKey<FormState> formKey, Participante participante) {
    return createState()._verificarAutenticacao(formKey, participante);
  }
}

class _LoginControllerState extends State<LoginController> with Validador {
  static _LoginControllerState _instance;

  _LoginControllerState._() {}

  static _LoginControllerState get instance =>
      _instance = _instance ?? _LoginControllerState._();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  bool _verificarAutenticacao(GlobalKey<FormState> formKey, participante) {
    return ParticipanteController().verificarAutenticacao(formKey, participante);
  }
}
