import 'package:flutter/material.dart';
import 'package:wticifes_app/ui/ajuda/ajuda_screen.dart';
import 'package:wticifes_app/ui/atividade/atividade_mixin.dart';
import 'package:wticifes_app/ui/menu/menu_screen.dart';

class AtividadeScreen extends StatefulWidget {
  @override
  _AtividadeScreenState createState() => _AtividadeScreenState();

}

class _AtividadeScreenState extends State<AtividadeScreen> with AtividadeMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Programação'),
          backgroundColor: Colors.orangeAccent,
          actions: <Widget>[  
            IconButton(
              icon: Icon(Icons.help),
              onPressed: () => AjudaScreen().abrirAjuda(context),
            ),
          ],
        ),
            body: Container(
              padding: EdgeInsets.all(30.0),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[                  
                  Flexible(flex: 2, child: buildBody()),
                ],
              ),
            ),
            drawer: MenuScreen(),
       
    );
  }

}
