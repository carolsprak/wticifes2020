import 'package:flutter/material.dart';
import 'package:wticifes_app/ui/ajuda/ajuda_screen.dart';
import 'package:wticifes_app/ui/menu/menu_screen.dart';
import 'package:wticifes_app/ui/refeicao/refeicao_mixin.dart';

class RefeicaoScreen extends StatefulWidget {
  @override
  _RefeicaoScreenState createState() => _RefeicaoScreenState();
    
}

class _RefeicaoScreenState extends State<RefeicaoScreen> 
with RefeicaoMixin, SingleTickerProviderStateMixin<RefeicaoScreen> {

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
              
          title: Text('Cardápio do Restaurante'),
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
                      text: "Dia 01", icon: Icon(Icons.fastfood)),            
                    Tab(text: "Dia 02",icon: Icon(Icons.fastfood)),
                    Tab(text: "Dia 03",icon: Icon(Icons.fastfood)),
                  ])          
        ),
        body: TabBarView(children: [
                  diaRefeicao("1"),
                  diaRefeicao("2"),
                  diaRefeicao("3")
                  ]),  
        drawer: MenuScreen(),
       
    ));
  }

  

}
