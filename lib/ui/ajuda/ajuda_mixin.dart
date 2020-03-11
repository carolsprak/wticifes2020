import 'package:flutter/material.dart';

class Ajuda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          backgroundColor: Colors.orangeAccent,
          title: Text("Ajuda"),
          centerTitle: false,
        ),
        body: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(20.0),),
            Text("Para realizar o cadastro no aplicativo, tem que ter realizado a inscrição no evento.")
          ],
        )
    );
  }
}
