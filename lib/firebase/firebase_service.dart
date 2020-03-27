import 'package:firebase_database/firebase_database.dart';


class FirebaseService {
  final FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference databaseReference;
 
  DatabaseReference getDados(String databaseName) {
      databaseReference = database.reference().child(databaseName);
      return  databaseReference;
  }

  void gravaDados(String databaseName, dynamic modelo) {
      databaseReference = database.reference().child(databaseName);
      databaseReference.push().set(modelo.toJson());
  } 
    
}
