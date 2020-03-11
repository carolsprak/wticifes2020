import 'package:flutter/material.dart';

import 'ajuda_mixin.dart';


class AjudaScreen extends StatefulWidget {
  @override
  _AjudaScreenState createState() => _AjudaScreenState();

  Future abrirAjuda(BuildContext context) async {
    return _AjudaScreenState()._abrirAjuda(context);
  }
}

class _AjudaScreenState extends State<AjudaScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future _abrirAjuda(BuildContext context) async {
    Map resultado = await Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) {
      return new Ajuda();

    }));
  }
}


