import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wticifes_app/controllers/login/login_controller.dart';
import 'package:wticifes_app/controllers/participante/participante_controller.dart';
import 'package:wticifes_app/firebase/firebase_service.dart';
import 'package:wticifes_app/helpers/navigation.dart';
import 'package:wticifes_app/models/participante/participante.dart';
import 'package:wticifes_app/ui/agenda/agenda_screen.dart';
import 'package:wticifes_app/ui/atividade/atividade_screen.dart';
import 'package:wticifes_app/ui/login/login_screen.dart';
import 'package:wticifes_app/ui/transporte/transporte_screen.dart';

class MenuScreen extends StatelessWidget {
  
  UserAccountsDrawerHeader _header(FirebaseUser user) {
    return UserAccountsDrawerHeader(    
      decoration:  BoxDecoration(
        color: Colors.blueGrey,
    ),  
      accountName: Text(user.displayName ?? ""),
      accountEmail: Text(user.email),
      currentAccountPicture: 
          CircleAvatar(
              backgroundColor: Colors.blueGrey,
              radius: 50,
              backgroundImage: AssetImage('assets/wticifes.png')              
            )          
    );
  }

  @override
  Widget build(BuildContext context) {
    Future<FirebaseUser> future = FirebaseAuth.instance.currentUser();

    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            FutureBuilder<FirebaseUser>(
              future: future,
              builder: (context, snapshot) {
                FirebaseUser user = snapshot.data;

                return user != null ? _header(user) : Container();
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text("Programação"),              
              trailing: Icon(Icons.arrow_forward),
              onTap: () {                
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => 
                  AtividadeScreen()));
              },
            ),
            /*ListTile(
              leading: Icon(Icons.star),
              title: Text("Atividades Agendadas"),
              //subtitle: Text("mais informações..."),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {                
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => 
                  AgendaScreen()));
              },
            ),*/
            ListTile(
              leading: Icon(Icons.directions_bus),
              title: Text("Transporte"),
              //subtitle: Text("mais informações..."),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {                
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => 
                  TransporteScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.fastfood),
              title: Text("Refeição do Dia"),
              //subtitle: Text("mais informações..."),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                print("Item 3");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.event_note),
              title: Text("Notícias"),
              //subtitle: Text("mais informações..."),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                print("Item 4");
                Navigator.pop(context);
              },
            ),
            Divider(
              color: Colors.grey,
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Perfil"),
              //subtitle: Text("mais informações..."),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                print("Item 5");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Sair"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () => _onClickLogout(context),
            )
          ],
        ),
      ),
    );
  }

  _onClickLogout(BuildContext context) {
    Participante.clear();
    LoginController().logout();
    Navigator.pop(context);
    push(context, LoginScreen(), replace: true);
  }

 
}
