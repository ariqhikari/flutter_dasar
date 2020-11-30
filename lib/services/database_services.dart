import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  static CollectionReference productCollection =
      FirebaseFirestore.instance.collection("products");

  static Future<void> createOrUpdateProduct(String id,
      {String name, int price}) async {
    await productCollection.doc(id).set({
      "nama": name,
      "harga": price,
    }, SetOptions(merge: true));
  }

  static Future<DocumentSnapshot> getProduct(String id) async {
    return await productCollection.doc(id).get();
  }

  static Future<void> deleteProduct(String id) async {
    await productCollection.doc(id).delete();
  }
}
