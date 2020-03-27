import 'package:flutter/material.dart';
import 'package:wticifes_app/ui/ajuda/ajuda_screen.dart';
import 'package:wticifes_app/ui/menu/menu_screen.dart';
import 'package:wticifes_app/ui/transporte/transporte_mixin.dart';

class TransporteScreen extends StatefulWidget {
  @override
  _TransporteScreenState createState() => _TransporteScreenState();
    
}

class _TransporteScreenState extends State<TransporteScreen> 
with TransporteMixin, SingleTickerProviderStateMixin<TransporteScreen> {

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
              
          title: Text('Informações de Transporte'),
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
                      text: "Dia 01", icon: Icon(Icons.directions_bus)),            
                    Tab(text: "Dia 02",icon: Icon(Icons.directions_bus)),
                    Tab(text: "Dia 03",icon: Icon(Icons.directions_bus)),
                  ])          
        ),
        body: TabBarView(children: [
                  diaTransporte("1"),
                  diaTransporte("2"),
                  diaTransporte("3")
                  ]),  
        drawer: MenuScreen(),
       
    ));
  }

  

}
