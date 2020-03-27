import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:wticifes_app/firebase/firebase_service.dart';
import 'package:wticifes_app/helpers/dados_evento.dart';

class SalaController extends StatefulWidget {
  @override
  _SalaControllerState createState() => _SalaControllerState.instance;

  Future<DataSnapshot> getSalasPorAno(String ano) async {
    return await createState()._getSalasPorAno(ano);
  }
}

class _SalaControllerState extends State<SalaController> {

  FirebaseService firebaseService;
  
  static _SalaControllerState _instance;

  _SalaControllerState._(){}

  static _SalaControllerState get instance => _instance = _instance??_SalaControllerState._();


  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }

  Future<DataSnapshot> _getSalasPorAno(String ano) async {  
    firebaseService = FirebaseService();  
    return await firebaseService.getDados("sala").orderByChild("ano_evento").equalTo(ano).once();         
  }
  
}