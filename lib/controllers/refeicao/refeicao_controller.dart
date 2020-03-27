import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:wticifes_app/firebase/firebase_service.dart';

class RefeicaoController extends StatefulWidget {
  @override
  _RefeicaoControllerState createState() => _RefeicaoControllerState.instance;

  Future<DataSnapshot> getRefeicaoPorAno(String ano) async {
    return await createState()._getRefeicaoPorAno(ano);
  }
}

class _RefeicaoControllerState extends State<RefeicaoController> {

  FirebaseService firebaseService;
  
  static _RefeicaoControllerState _instance;

  _RefeicaoControllerState._(){}

  static _RefeicaoControllerState get instance => _instance = _instance??_RefeicaoControllerState._();


  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }

  Future<DataSnapshot> _getRefeicaoPorAno(String ano) async {  
    firebaseService = FirebaseService();  
    return await firebaseService.getDados("refeicao").orderByChild("ano_evento").equalTo(ano).once();         
  }
  
}