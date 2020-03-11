import 'package:flutter/material.dart';

mixin ParticipanteMixin {
  BuildContext context;

  final TextEditingController _nome_controller = new TextEditingController();
  final TextEditingController _email_controller = new TextEditingController();
  final TextEditingController _instituicao_controller =
      new TextEditingController();
  final TextEditingController _cargo_controller = new TextEditingController();
  final TextEditingController _senha_controller = new TextEditingController();
  final TextEditingController _confirma_controller =
      new TextEditingController();
  bool _noticia = true;

  Widget buildBody() {
    return StreamBuilder<bool>(
        initialData: false,
        builder: (context, snapshot) {
          return Center(
              child: Container(
            height: MediaQuery.of(context).size.height * 0.6,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Flexible(
                      flex: 2,
                      fit: FlexFit.loose,
                      child: TextField(
                        maxLength: 300,
                        decoration: InputDecoration(
                          hintText: 'Nome / Sobrenome',
                        ),
                        controller: _nome_controller,
                        keyboardType: TextInputType.text,
                      )),
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
                        maxLength: 200,
                        decoration: InputDecoration(
                          hintText: 'Instituição (Sigla)',
                        ),
                        controller: _instituicao_controller,
                        keyboardType: TextInputType.text,
                      )),
                  Flexible(
                      flex: 2,
                      fit: FlexFit.loose,
                      child: TextField(
                        maxLength: 200,
                        decoration: InputDecoration(
                          hintText: 'Cargo',
                        ),
                        controller: _cargo_controller,
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
                      child: TextField(
                        maxLength: 20,
                        decoration: InputDecoration(
                          hintText: 'Confirmar Senha',
                        ),
                        controller: _confirma_controller,
                        keyboardType: TextInputType.text,
                      )),
                  Flexible(
                      flex: 2,
                      fit: FlexFit.loose,
                      child: Row(children: <Widget>[
                        Checkbox(
                            value: _noticia,
                            onChanged: (bool value) {
                              _noticia = value;
                            }),
                        Text(
                          "Aceito receber informações sobre o  \n" +
                              "evento e parceiros.",
                          style: TextStyle(fontSize: 13.0),
                        ),
                      ])),
                  Flexible(
                      flex: 5,
                      fit: FlexFit.loose,
                      child: FlatButton(
                        padding: EdgeInsets.all(10.0),
                        onPressed: () => Text("Entrar"),
                        textColor: Colors.white70,
                        color: Colors.orangeAccent,
                        child: Text('Cadastrar'),
                      )),
                ]),
          ));
        });
  }
}
