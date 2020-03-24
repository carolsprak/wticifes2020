import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wticifes_app/helpers/api_response.dart';
import 'package:wticifes_app/models/participante/participante.dart';
import 'package:firebase_database/firebase_database.dart';

String firebaseUserUid;

class FirebaseService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference databaseReference;

  Future<ApiResponse> login(String email, String senha) async {
    try {
      // Login no Firebase
      AuthResult result =
      await _auth.signInWithEmailAndPassword(email: email, password: senha);
      final FirebaseUser fUser = result.user;
      
      // Salva no Firestore
      saveUser(fUser);

      // Resposta genérica
      return ApiResponse.ok();
    } catch (error) {
      print("Firebase error $error");
      return ApiResponse.error(msg: "Não foi possível fazer o login");
    }
  }

  Future<ApiResponse> loginGoogle() async {
    try {
      // Login com o Google
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;

      print("Google User: ${googleUser.email}");

      // Credenciais para o Firebase
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Login no Firebase
      AuthResult result = await _auth.signInWithCredential(credential);
      final FirebaseUser fUser = result.user;
      print("Firebase Nome: ${fUser.displayName}");
      print("Firebase Email: ${fUser.email}");
      //print("Firebase Foto: ${fUser.photoUrl}");

      // Cria um usuario do app
      final user = Participante(
        fUser.displayName,
        fUser.email,
        "",
        "",
        "",
        "",
        false
      );
      user.save();

      // Salva no Firestore
      saveUser(fUser);

      // Resposta genérica
      return ApiResponse.ok();
    } catch (error) {
      print("Firebase error $error");
      return ApiResponse.error(msg: "Não foi possível fazer o login");
    }
  }

  // salva o usuario na collection de usuarios logados
  void saveUser(FirebaseUser fUser) async {
    if (fUser != null) {
      firebaseUserUid = fUser.uid;
      DocumentReference refUser =
      Firestore.instance.collection("login").document(firebaseUserUid);
      refUser.setData({
        'nome' : fUser.displayName,
        'email': fUser.email,
      });
    }
  }

  Future<ApiResponse> cadastrar(Participante participante, GlobalKey<FormState> formKey) async {
    try {
      // Usuario do Firebase
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: participante.email, password: participante.senha);
      final FirebaseUser fUser = result.user;
      print("Firebase Nome: ${fUser.displayName}");
      print("Firebase Email: ${fUser.email}");
      //print("Firebase Foto: ${fUser.photoUrl}");

      // Dados para atualizar o usuário
      final userUpdateInfo = UserUpdateInfo();
      userUpdateInfo.displayName = participante.nome;
     // userUpdateInfo.photoUrl =
      //"https://s3-sa-east-1.amazonaws.com/livetouch-temp/livrows/foto.png";

      fUser.updateProfile(userUpdateInfo);

      //Salvar dados firebase
      databaseReference = database.reference().child('participante');
      databaseReference.push().set(participante.toJson());

      formKey.currentState.save();
      formKey.currentState.reset();

      // Resposta genérica
      return ApiResponse.ok(msg: "Participante cadastrado com sucesso");
    } catch (error) {
      print(error);

      if (error is PlatformException) {
        print("Error Code ${error.code}");

        return ApiResponse.error(
            msg: "Erro ao criar um participante.\n\n Este e-mail já foi usado em nosso cadastro.");
      }

      return ApiResponse.error(msg: "Não foi possível criar um participante.");
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }
}
