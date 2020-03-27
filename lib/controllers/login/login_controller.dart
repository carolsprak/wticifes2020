import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wticifes_app/controllers/login/validador.dart';
import 'package:wticifes_app/helpers/api_response.dart';
import 'package:wticifes_app/models/participante/participante.dart';

class LoginController extends StatefulWidget {
  @override
  _LoginControllerState createState() => _LoginControllerState.instance;

  Future<ApiResponse> verificarLogin(
      GlobalKey<FormState> formKey, Participante participante) async {
    return createState()._verificarAutenticacao(formKey, participante);
  }

  Future<void> logout() async {
    return createState()._logout();
  }
}

class _LoginControllerState extends State<LoginController> with Validador {
  
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  static _LoginControllerState _instance;

  _LoginControllerState._() {}

  static _LoginControllerState get instance =>
      _instance = _instance ?? _LoginControllerState._();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
  
  Future<ApiResponse> _verificarAutenticacao(GlobalKey<FormState> formKey, Participante participante) async {
    final FormState form = formKey.currentState;

    if (form.validate()) {
      form.save();
      form.reset();
      return _login(participante);
    } else {
      return null;
    }

  }

  Future<ApiResponse> _login(Participante participante) async {
    try {
      // Login no Firebase      
      await _auth.signInWithEmailAndPassword(email: participante.email, password: participante.senha);
      
      // Resposta genérica
      return ApiResponse.ok();
    } catch (error) {
      print("Firebase error $error");
      return ApiResponse.error(msg: "Não foi possível fazer o login");
    }
  }

  Future<void> _logout() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }
}
