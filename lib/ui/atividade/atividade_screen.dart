import 'package:flutter/material.dart';
import 'package:wticifes_app/ui/ajuda/ajuda_screen.dart';
import 'package:wticifes_app/ui/atividade/atividade_mixin.dart';
import 'package:wticifes_app/ui/menu/menu_screen.dart';

class AtividadeScreen extends StatefulWidget {
  @override
  _AtividadeScreenState createState() => _AtividadeScreenState();
    
}

class _AtividadeScreenState extends State<AtividadeScreen> 
with AtividadeMixin, SingleTickerProviderStateMixin<AtividadeScreen> {

  @override
  void initState() {
    super.initState();   
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
          length: 3,
          child: Scaffold(
        appBar: AppBar(  
              
          title: Text('Programação'),
          backgroundColor: Colors.orangeAccent,
          actions: <Widget>[  
            IconButton(
              icon: Icon(Icons.help),
              onPressed: () => AjudaScreen().abrirAjuda(context),
            ), 
          ],
          bottom: TabBar(            
                    indicatorColor: Colors.blueAccent,
                    unselectedLabelColor: Colors.blueGrey,                    
                    isScrollable: false,
                    tabs: [
                    Tab(                      
                      text: "Dia 01", icon: Icon(Icons.today)),            
                    Tab(text: "Dia 02",icon: Icon(Icons.today)),
                    Tab(text: "Dia 03",icon: Icon(Icons.today)),
                  ])
        ),
        body: TabBarView(children: [
                  diaEvento("1"),
                  diaEvento("2"),
                  diaEvento("3"),
                  ]), 
        drawer: MenuScreen(),
       
    ));
  }

  

}
