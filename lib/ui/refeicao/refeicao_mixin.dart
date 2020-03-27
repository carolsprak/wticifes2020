import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:wticifes_app/controllers/refeicao/refeicao_controller.dart';
import 'package:wticifes_app/helpers/dados_evento.dart';

mixin RefeicaoMixin {

  BuildContext context;
  Future<DataSnapshot> refeicoesPorAno = RefeicaoController().getRefeicaoPorAno(ANO_EVENTO);  
  List listaRefeicoes = List();

 Widget diaRefeicao(String dia) {

        return FutureBuilder(
          initialData: false,
          future: RefeicaoController().getRefeicaoPorAno(ANO_EVENTO),
          builder: (context, snapshot) {
            refeicoesPorAno.then(
              (DataSnapshot dados) {
                listaRefeicoes = List();
                List<dynamic> refeicoes = dados.value;                    
                refeicoes.forEach((refeicao) {              
                  if (refeicao["dia"] == dia){                
                    listaRefeicoes.add(refeicao);                
                  }      
              });          
            });

            return ListView.builder(                
                shrinkWrap: true,
                itemCount: listaRefeicoes.length,
                itemBuilder: (BuildContext context, int index) {                
                    return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[                                                    
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text("Data: ${listaRefeicoes[index]["data"]} | Horário: ${listaRefeicoes[index]["horario"]}",
                             style: TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo[600])),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text("Cardápio:",
                             style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text("${listaRefeicoes[index]["cardapio"]}",
                             style: TextStyle(),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text("Sobremesa:"
                            , style: TextStyle(fontWeight: FontWeight.bold),),
                          ), 
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text("${listaRefeicoes[index]["sobremesa"]}"
                            , style: TextStyle(),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text("Valor:\n${listaRefeicoes[index]["valor"]}"
                            , style: TextStyle(fontWeight: FontWeight.bold),),
                          )     
                          ],
                      ),
                    ),
                    );
                });            
      }
      
    );
      
  }

  

}