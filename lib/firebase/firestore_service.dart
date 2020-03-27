import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {

  Future<QuerySnapshot> getDados(String database) async {
      return await Firestore.instance
        .collection(database)
        .getDocuments();
  }

  void updateDado(String database, String id, String campo, String  valor) async {
      try {
      Firestore.instance
          .collection(database)
          .document(id)
          .updateData({'$campo': '$valor'});
    } catch (e) {
      print(e.toString());
    }
  }

  void deleteDado(String database, String id) async {
      try {
      Firestore.instance
          .collection(database)
          .document(id)
          .delete();
    } catch (e) {
      print(e.toString());
    }
  }
   
}
