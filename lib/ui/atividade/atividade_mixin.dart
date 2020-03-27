import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:wticifes_app/controllers/atividade/atividade_controller.dart';
import 'package:wticifes_app/controllers/sala/sala_controller.dart';
import 'package:wticifes_app/helpers/dados_evento.dart';

mixin AtividadeMixin {

  Future<DataSnapshot> salasPorAno = SalaController().getSalasPorAno(ANO_EVENTO);  
  List listaSalas = List();

  Future<DataSnapshot> atividadesPorAno = AtividadeController().getAtividadesPorAno(ANO_EVENTO);  
  List listaAtividades = List();

  Widget diaEvento(String dia) {      

    return FutureBuilder(      
      initialData: false,
      future: SalaController().getSalasPorAno(ANO_EVENTO),
      builder: (context, snapshot) {
        salasPorAno.then(
          (DataSnapshot dados) {
            List<dynamic> salas = dados.value;            
            salas.forEach((sala) {
              listaSalas.add(sala);              
          });
        });
      
        return DefaultTabController(
      length: 2,
      child: Scaffold(          
        backgroundColor: Color(0xffE0E7EE),
          body: TabBarView(            
            children: [
              atividadeSala("1", dia, ANO_EVENTO),              
              atividadeSala("2", dia, ANO_EVENTO)              
              ],
          ),
          bottomNavigationBar: 
            TabBar(
              unselectedLabelColor: Color(0xff5A80B9),
              indicatorColor: Color(0xffFF6600),
              labelColor: Color(0xffFF6600),
              tabs: [
                Tooltip(message: "Sala ${listaSalas.length > 1 ? listaSalas[0]["nome"] : ""}", child: Tab(text: "${listaSalas.length > 1 ? listaSalas[0]["nome"] : ""}")),
                Tooltip(message: "Sala ${listaSalas.length > 1 ? listaSalas[1]["nome"] : ""}", child: Tab(text: "${listaSalas.length > 1 ? listaSalas[1]["nome"] : ""}"))
        ])
        ));
      }       
    );
    

  }

  Widget atividadeSala(String sala, String dia, String ano) {   

    debugPrint("DIA $dia SALA $sala");    

    return FutureBuilder(
      initialData: false,
      future: AtividadeController().getAtividadesPorAno(ANO_EVENTO),
      builder: (context, snapshot) {
        atividadesPorAno.then(
          (DataSnapshot dados) {
            listaAtividades = List();
            List<dynamic> atividades = dados.value;                    
            atividades.forEach((atividade) {              
              if (atividade["dia"] == dia && atividade["sala"] == sala){                
                listaAtividades.add(atividade);                
              }      
          });          
        });

        return ListView.builder(
            shrinkWrap: true,
            itemCount: listaAtividades.length,
            itemBuilder: (BuildContext context, int index) {                
                return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text("${listaAtividades[index]["horario"]}", style: TextStyle(color: Colors.indigo[600])),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text("${listaAtividades[index]["assunto"]}", style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text("${listaAtividades[index]["palestrantes"]}"),
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

 