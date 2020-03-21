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

  Widget buildBody(BuildContext context, GlobalKey<ScaffoldState> globalKey) {
      
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
                        child:  FlatButton(
                   padding: EdgeInsets.all(10.0),
                  textColor: Colors.white70,
                          color: Colors.orangeAccent,
                          child: Text('Entrar'),
                  onPressed: () => _onClickLogin(globalKey, context),
                  
                )
              
             ),
                        
                       
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

  void _onClickLogin(GlobalKey<ScaffoldState> globalKey, BuildContext context) async {
    _formataParticipante();
    
    if (formKey.currentState.validate()) {
      ApiResponse response =
        await LoginController().verificarLogin(formKey, participante);

      if(response != null  && response.ok){
        popMsg(globalKey, "Você realizou login com sucesso!");

        Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) {
      return AtividadeScreen();
    }));

      } else if(response != null && response.msg != null){
        popMsg(globalKey, response.msg);
      } else {
        popMsg(globalKey, "Não foi possível realizar o login");
      }
      
    } else {
      popMsg(globalKey,"Preencha os campos em branco.");
      
    }
  }

   SnackBar popMsg(GlobalKey<ScaffoldState> globalKey, String msg) {
                  final snackBar = SnackBar(
                          content: Text(msg));
                        globalKey.currentState.showSnackBar(snackBar);
                  return snackBar;
  }  
  
}
