import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:wticifes_app/controllers/transporte/transporte_controller.dart';
import 'package:wticifes_app/helpers/dados_evento.dart';

mixin TransporteMixin {

  BuildContext context;
  Future<DataSnapshot> transportesPorAno = TransporteController().getTransportePorAno(ANO_EVENTO);  
  List listaTransportes = List();

 Widget diaTransporte(String dia) {

        return FutureBuilder(
          initialData: false,
          future: TransporteController().getTransportePorAno(ANO_EVENTO),
          builder: (context, snapshot) {
            transportesPorAno.then(
              (DataSnapshot dados) {
                listaTransportes = List();
                List<dynamic> transportes = dados.value;                    
                transportes.forEach((transporte) {              
                  if (transporte["dia"] == dia){                
                    listaTransportes.add(transporte);                
                  }      
              });          
            });

            return ListView.builder(                
                shrinkWrap: true,
                itemCount: listaTransportes.length,
                itemBuilder: (BuildContext context, int index) {                
                    return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[                          
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text("Partida: ${listaTransportes[index]["horario_saida"]} - Chegada: ${listaTransportes[index]["horario_chegada"]}  (Linha ${listaTransportes[index]["linha"]})",
                             style: TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo[600])),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text("Partida: ${listaTransportes[index]["local_saida"]} \nChegada: ${listaTransportes[index]["local_chegada"]}",
                             style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text("Intinerário do Percurso: \n${listaTransportes[index]["intinerario"]}"
                            , style: TextStyle(fontStyle: FontStyle.italic),),
                          ),      
                          ],
                      ),
                    ),
                    );
                });            
      }
      
    );
      
  }

  

}