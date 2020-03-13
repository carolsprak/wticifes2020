import 'package:flutter/material.dart';
import 'package:wticifes_app/models/participante/participante.dart';
import 'package:wticifes_app/ui/participante/participante_screen.dart';
import 'package:wticifes_app/controllers/login/login_controller.dart';
import 'package:wticifes_app/helpers/utils.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';

mixin LoginMixin {
  BuildContext context;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Participante participante = Participante("", "", "", "", "", "", false);

  final TextEditingController _email_controller = new TextEditingController();
  final TextEditingController _senha_controller = new TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  Widget buildBody() {
    return StreamBuilder<bool>(
      initialData: false,
      builder: (context, snapshot) {
        return Center(
            child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Flexible(
                        flex: 2,
                        fit: FlexFit.loose,
                        child: TextFormField(
                          maxLength: 200,
                          decoration: InputDecoration(
                            hintText: 'E-mail',
                          ),
                          controller: _email_controller,
                          keyboardType: TextInputType.text,
                          validator: (val) => val == "" ? val : null,
                        )),
                    Flexible(
                        flex: 2,
                        fit: FlexFit.loose,
                        child: TextFormField(
                          maxLength: 20,
                          decoration: InputDecoration(
                            hintText: 'Senha',
                          ),
                          controller: _senha_controller,
                          keyboardType: TextInputType.text,
                          validator: (val) => val == "" ? val : null,
                        )),
                    Flexible(
                        flex: 2,
                        fit: FlexFit.loose,
                        child: FlatButton(
                          padding: EdgeInsets.all(10.0),
                          onPressed: () {
                            LoginController()
                                .verificarAutenticacao(formKey, participante);
                            debugPrint(participante.email);
                          },
                          textColor: Colors.white70,
                          color: Colors.orangeAccent,
                          child: Text('Entrar'),
                        )),
                    Flexible(
                      flex: 1,
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FlatButton(
                              onPressed: () =>
                                  ParticipanteScreen().cadastrar(context),
                              textColor: Colors.orange,
                              child: Text("Cadastre-se ")),
                          Text(
                            " | ",
                            style: TextStyle(color: Colors.orange),
                          ),
                          FlatButton(
                              onPressed: () => Text("Esquecer"),
                              textColor: Colors.orange,
                              child: Text(" Esqueceu a senha?"))
                        ],
                      )),
                    )
                  ],
                )));
      },
    );
  }

  void _formataParticipante() {
    participante = Participante(
        "",
        _email_controller.text,
        "",
        "",
        Utils.textToMd5(_senha_controller.text),
        "",
        false);
  }
}
