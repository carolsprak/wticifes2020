import 'package:flutter/material.dart';

mixin BaseComponents {

  BuildContext context;

  Widget buildBody(Widget child) {
    return Stack(children: <Widget>[
      LayoutBuilder(builder: (context, constraints) {
        return Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        );
      }),
      child,

    ]);
  }

}