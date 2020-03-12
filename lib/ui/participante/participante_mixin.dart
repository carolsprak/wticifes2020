import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wticifes_app/controllers/participante/participante_controller.dart';
import 'package:wticifes_app/models/participante/participante.dart';

mixin ParticipanteMixin {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Participante participante = Participante("", "", "", "", "", "", false);

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
              child: Form(
            key: formKey,
            child: Column(children: <Widget>[
              Flexible(
                  child: TextFormField(
                maxLength: 300,
                decoration: InputDecoration(
                  hintText: 'Nome / Sobrenome',
                ),
                controller: _nome_controller,
                keyboardType: TextInputType.text,
                validator: (val) => val == "" ? val : null,
              )),
              Flexible(
                  child: TextFormField(
                maxLength: 200,
                decoration: InputDecoration(
                  hintText: 'E-mail',
                ),
                controller: _email_controller,
                keyboardType: TextInputType.emailAddress,
                validator: (val) => val == "" ? val : null,
              )),
              Flexible(
                  child: TextFormField(
                maxLength: 200,
                decoration: InputDecoration(
                  hintText: 'Sigla da Instituição',
                ),
                controller: _instituicao_controller,
                keyboardType: TextInputType.text,
                validator: (val) => val == "" ? val : null,
              )),
              Flexible(
                  child: TextFormField(
                maxLength: 200,
                decoration: InputDecoration(
                  hintText: 'Cargo',
                ),
                controller: _cargo_controller,
                keyboardType: TextInputType.text,
                validator: (val) => val == "" ? val : null,
              )),
              Flexible(
                  child: TextFormField(
                obscureText: true,
                maxLength: 20,
                decoration: InputDecoration(
                  hintText: 'Senha',
                ),
                keyboardType: TextInputType.text,
                controller: _senha_controller,
                validator: (val) => val == "" ? val : null,
              )),
              Flexible(
                  child: TextFormField(
                obscureText: true,
                maxLength: 20,
                decoration: InputDecoration(
                  hintText: 'Confirmar Senha',
                ),
                keyboardType: TextInputType.text,
                controller: _confirma_controller,
                validator: (val) => val == "" ? val : null,
              )),
              Flexible(
                  child: Row(children: <Widget>[
                Checkbox(
                    value: _noticia,
                    onChanged: (bool value) {
                      participante.aceita_noticias = value;
                    }),
                Text(
                  "Aceito receber informações sobre o  \n" +
                      "evento e parceiros.",
                  style: TextStyle(fontSize: 13.0),
                ),
              ])),
              Flexible(
                  child: FlatButton(
                padding: EdgeInsets.all(10.0),
                onPressed: () {
                  _formataParticipante();
                  ParticipanteController()
                      .adicionarParticipante(formKey, participante);
                },
                textColor: Colors.white70,
                color: Colors.orangeAccent,
                child: Text('Cadastrar'),
              )),
            ]),
          ));
        });
  }

  String textToMd5(String text) {
    return md5.convert(utf8.encode(text)).toString();
  }

  void _formataParticipante() {
    participante = Participante(
        _nome_controller.text,
        _email_controller.text,
        _instituicao_controller.text,
        _cargo_controller.text,
        textToMd5(_senha_controller.text),
        textToMd5(_confirma_controller.text),
        _noticia);
  }
}
