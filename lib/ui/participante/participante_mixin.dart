
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wticifes_app/controllers/participante/participante_controller.dart';
import 'package:wticifes_app/helpers/api_response.dart';
import 'package:wticifes_app/helpers/utils.dart';
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
 
  Widget buildBody(GlobalKey<ScaffoldState> globalKey) {
    
    this.context = context;
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
                onPressed: () => _onClickCadastrar(globalKey), 
                                textColor: Colors.white70,
                                color: Colors.orangeAccent,
                                child: Text('Cadastrar'),
                              )),
                            ]),
                          ));
                        });
                  }
                
                
                
                  bool _formataParticipante() {
                    if(_senha_controller.text != _confirma_controller.text){
                      return false;
                    } else {
                      participante = Participante(
                          _nome_controller.text,
                          _email_controller.text,
                          _instituicao_controller.text,
                          _cargo_controller.text,
                          Utils.textToMd5(_senha_controller.text),
                          Utils.textToMd5(_confirma_controller.text),
                          _noticia);
                      return true;
                    }
                  }
                
                  void _onClickCadastrar(GlobalKey<ScaffoldState> globalKey)  async {
                    
                    if(_formataParticipante()) {                     
                                       
                      if (formKey.currentState.validate()) {
                        ApiResponse response = await ParticipanteController()
                                      .adicionarParticipante(formKey, participante);
                        if (response != null ) {
                            popMsg(globalKey, response.msg);                         
                        } else {
                          popMsg(globalKey, "Não foi possível realizar o cadastro.");
                        }                                                
                      } else {
                          popMsg(globalKey, "Preencha os campos em branco.");
                      }
                    } else {
                      popMsg(globalKey, "A senha não foi confirmada com mesmo valor.");
                    }
                    
                }

                SnackBar popMsg(GlobalKey<ScaffoldState> globalKey, String msg) {
                  final snackBar = SnackBar(
                          content: Text(msg));
                        globalKey.currentState.showSnackBar(snackBar);
                  return snackBar;
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
