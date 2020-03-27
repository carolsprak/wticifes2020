import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:wticifes_app/firebase/firebase_service.dart';

class TransporteController extends StatefulWidget {
  @override
  _TransporteControllerState createState() => _TransporteControllerState.instance;

  Future<DataSnapshot> getTransportePorAno(String ano) async {
    return await createState()._getTransportePorAno(ano);
  }
}

class _TransporteControllerState extends State<TransporteController> {

  FirebaseService firebaseService;
  
  static _TransporteControllerState _instance;

  _TransporteControllerState._(){}

  static _TransporteControllerState get instance => _instance = _instance??_TransporteControllerState._();


  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }

  Future<DataSnapshot> _getTransportePorAno(String ano) async {  
    firebaseService = FirebaseService();  
    return await firebaseService.getDados("transporte").orderByChild("ano_evento").equalTo(ano).once();         
  }
  
}