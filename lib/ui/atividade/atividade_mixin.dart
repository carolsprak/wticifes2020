import 'package:flutter/material.dart';

mixin AtividadeMixin {
   
  Widget diaUm() {

    return StreamBuilder<bool>(
      initialData: false,
      builder: (context, snapshot) {
        return DefaultTabController(
      length: 3,
      child: Scaffold(          
        backgroundColor: Color(0xffE0E7EE),
          body: TabBarView(            
            children: [
              salaUm(1),              
              salaDois(1),
              salaTres(1)
              ],
          ),
          bottomNavigationBar: 
            TabBar(
              unselectedLabelColor: Color(0xff5A80B9),
              indicatorColor: Color(0xffFF6600),
              labelColor: Color(0xffFF6600),
              tabs: [
                Tooltip( message: "Sala Jacumã", child: Tab(text:  "Jacumã")),
                Tooltip(message: "Sala Tabatinga", child: Tab(text: "Tabatinga")),
                Tooltip(message: "Sala Tambaba", child: Tab(text: "Tambaba")),
        ])
        ));
      }
    );

  }
  
  Widget diaDois() {

    return StreamBuilder<bool>(
      initialData: false,
      builder: (context, snapshot) {
        return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Color(0xffE0E7EE),
          body: TabBarView(          
            children: [
              salaUm(2),              
              salaDois(2)
              ],
          ),
          bottomNavigationBar: 
            TabBar(
              unselectedLabelColor: Color(0xff5A80B9),
              indicatorColor: Color(0xffFF6600),
              labelColor: Color(0xffFF6600),
              tabs: [
                Tooltip( message: "Sala Jacumã", child: Tab(text:  "Jacumã")),
                Tooltip(message: "Sala Tabatinga", child: Tab(text: "Tabatinga"))
        ])
        ));
      }
    );

  }
  
  Widget diaTres() {

    return StreamBuilder<bool>(
      initialData: false,
      builder: (context, snapshot) {
        return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Color(0xffE0E7EE),
          body: TabBarView(
            children: [
              salaUm(3),              
              salaDois(3),              
              ],
          ),
          bottomNavigationBar: 
            TabBar(
              unselectedLabelColor: Color(0xff5A80B9),
              indicatorColor: Color(0xffFF6600),
              labelColor: Color(0xffFF6600),
              tabs: [
                Tooltip( message: "Sala Jacumã", child: Tab(text:  "Jacumã")),
                Tooltip(message: "Sala Tabatinga", child: Tab(text: "Tabatinga"))                
        ])
        ));
      }
    );

  }

  Widget salaUm(int i) {
    return StreamBuilder<bool>(
      initialData: false,
      builder: (context, snapshot) {
        return Container(color: Colors.white,
        child: Text('Sala 1', textAlign: TextAlign.center , style: TextStyle(fontSize: 20),),);
      }
    );

  } 
  
  Widget salaDois(int i) {
    return StreamBuilder<bool>(
      initialData: false,
      builder: (context, snapshot) {
        return Container(color: Colors.white,
        child: Text('Sala 2', textAlign: TextAlign.center , style: TextStyle(fontSize: 20),),);
      }
    );
  } 

  Widget salaTres(int i) {
    return StreamBuilder<bool>(
      initialData: false,
      builder: (context, snapshot) {
        return Container(color: Colors.white,
        child: Text('Sala 3', textAlign: TextAlign.center , style: TextStyle(fontSize: 20),),);
      }
    );
  } 
}