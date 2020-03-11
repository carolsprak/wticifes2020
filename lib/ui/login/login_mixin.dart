import 'package:flutter/material.dart';
import 'package:wticifes_app/ui/participante/participante_screen.dart';
import 'package:wticifes_app/blocs/login/login_bloc.dart';
import 'package:wticifes_app/helpers/utils.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';

mixin LoginMixin {
  BuildContext context;

  final TextEditingController _email_controller = new TextEditingController();
  final TextEditingController _senha_controller = new TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  Widget buildBody() {
    return StreamBuilder<bool>(
      initialData: false,
      builder: (context, snapshot) {
        return Center(
            child: Container(
                height: MediaQuery.of(context).size.height * 0.4,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Flexible(
                        flex: 2,
                        fit: FlexFit.loose,
                        child: TextField(
                          maxLength: 200,
                          decoration: InputDecoration(
                            hintText: 'E-mail',
                          ),
                          controller: _email_controller,
                          keyboardType: TextInputType.text,
                        )),
                    Flexible(
                        flex: 2,
                        fit: FlexFit.loose,
                        child: TextField(
                          maxLength: 20,
                          decoration: InputDecoration(
                            hintText: 'Senha',
                          ),
                          controller: _senha_controller,
                          keyboardType: TextInputType.text,
                        )),
                    Flexible(
                        flex: 2,
                        fit: FlexFit.loose,
                        child: FlatButton(
                          padding: EdgeInsets.all(10.0),
                          onPressed: () => Text("Entrar"),
                          textColor: Colors.white70,
                          color: Colors.orangeAccent,
                          child: Text('Entrar'),
                        )),
                    Flexible(
                      flex: 1,
                      child: Center( child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FlatButton(
                              onPressed: () => ParticipanteScreen().cadastrar(context),
                              textColor: Colors.orange,
                              child: Text("Cadastre-se ")),
                          Text(" | ", style: TextStyle(color: Colors.orange),),
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
}
