import 'package:flutter/material.dart';
import 'package:wticifes_app/ui/ajuda/ajuda_screen.dart';
import 'package:wticifes_app/ui/agenda/agenda_mixin.dart';
import 'package:wticifes_app/ui/menu/menu_screen.dart';

class AgendaScreen extends StatefulWidget {
  @override
  _AgendaScreenState createState() => _AgendaScreenState();
    
}

class _AgendaScreenState extends State<AgendaScreen> 
with AgendaMixin, SingleTickerProviderStateMixin<AgendaScreen> {

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
              
          title: Text('Atividades Agendadas'),
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
                  diaUm(),
                  diaDois(),
                  diaTres()
                  ]), 
        drawer: MenuScreen(),
       
    ));
  }

  

}
