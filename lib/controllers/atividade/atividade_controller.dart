import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:wticifes_app/firebase/firebase_service.dart';

class AtividadeController extends StatefulWidget {
  @override
  _AtividadeControllerState createState() => _AtividadeControllerState.instance;

  Future<DataSnapshot> getAtividadesPorAno(String ano) async {
    return await createState()._getAtividadesPorAno(ano);
  }
}

class _AtividadeControllerState extends State<AtividadeController> {

  FirebaseService firebaseService;
  
  static _AtividadeControllerState _instance;

  _AtividadeControllerState._(){}

  static _AtividadeControllerState get instance => _instance = _instance??_AtividadeControllerState._();


  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }

  Future<DataSnapshot> _getAtividadesPorAno(String ano) async {
    firebaseService = FirebaseService();  
    return await firebaseService.getDados("atividade").orderByChild("ano_evento").equalTo(ano).once();
  }   

}