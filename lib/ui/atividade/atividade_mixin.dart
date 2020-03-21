import 'package:flutter/material.dart';

mixin AtividadeMixin {

  Widget buildBody() {
    return StreamBuilder<bool>(
      initialData: false,
      builder: (context, snapshot) {
        return Center(
          child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("Entrou"),
                  ])
        );
      });
  }

}