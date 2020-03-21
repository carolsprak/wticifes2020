import 'package:flutter/material.dart';
import 'package:wticifes_app/ui/base_component.dart';
import 'package:wticifes_app/ui/login/login_mixin.dart';
import 'package:wticifes_app/ui/ajuda/ajuda_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with LoginMixin {
  final globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'WTICIFES 2020',
        home: Scaffold(
          key: globalKey,
          appBar: AppBar(
            title: Text('WTICIFES 2020'),
            backgroundColor: Colors.orangeAccent,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.help),
                onPressed: () => AjudaScreen().abrirAjuda(context),
              ),
            ],
          ),
          body: Container(
            padding: EdgeInsets.all(30.0),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                    flex: 1,
                    child: Center(
                        child: Image.asset("assets/wticifes.png",
                            width: 150.0, height: 150.0))),
                Flexible(flex: 2, child: buildBody(context, globalKey)),
              ],
            ),
          ),
        ));
  }
}
