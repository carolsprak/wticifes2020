import 'package:flutter/material.dart';
import 'package:wticifes_app/models/participante/participante.dart';
import 'package:wticifes_app/ui/atividade/atividade_screen.dart';
import 'package:wticifes_app/ui/participante/participante_screen.dart';
import 'package:wticifes_app/controllers/login/login_controller.dart';
import 'package:wticifes_app/helpers/utils.dart';
import 'package:wticifes_app/helpers/api_response.dart';

mixin LoginMixin {
  BuildContext context;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Participante participante = Participante("", "", "", "", "", "", false);

  final TextEditingController _email_controller = new TextEditingController();
  final TextEditingController _senha_controller = new TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  Widget buildBody(BuildContext context) {
    this.context = context;
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
                          obscureText: true,
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
                          onPressed: _onClickLogin,
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
    participante = Participante("", _email_controller.text, "", "",
        Utils.textToMd5(_senha_controller.text), "", false);
  }

  void _onClickLogin() async {
    _formataParticipante();
    AlertDialog alerta;

    ApiResponse response =
        await LoginController().verificarLogin(formKey, participante);

    if (response != null  && response.ok) {
      alerta = alertaMensagem("Você realizou login com sucesso!");
      showDialog(context: context, builder: (context) => alerta);

      //Navigator.of(context).pushReplacement(new MaterialPageRoute(
      //    builder: (BuildContext context) => AtividadeScreen()));
    } else if (response != null ) {
      alerta = alertaMensagem(response.msg);
      showDialog(context: context, builder: (context) => alerta);
    } else {
      alerta = alertaMensagem("Preencha todos os campos em branco.");
      showDialog(context: context, builder: (context) => alerta);
    }
  }

  AlertDialog alertaMensagem(String msg) {
    return  AlertDialog(
      content: Text(msg),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('OK'),
        )
      ],
    );
  }
}
