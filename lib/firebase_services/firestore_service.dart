import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference users =
  FirebaseFirestore.instance.collection('user');

  final CollectionReference product =
  FirebaseFirestore.instance.collection('product');

  Future<void> setDoc(
      {required Map<String, dynamic> model, required String uId,required CollectionReference collectionReference}) async {
    return await users.doc(uId).set(model);
  }

  Future<DocumentReference> addDoc(
      {required Map<String, dynamic> model}) async {
    return await users.add(model);
  }

  Future<void> deleteDoc({required String id}) async {
    return await users.doc(id).delete();
  }

  Future<void> editDoc(
      {required String id, required Map<String, dynamic> model}) async {
    return await users.doc(id).update(model);
  }

  Future<DocumentSnapshot> getDoc({required String uId}) async {
    return await users.doc(uId).get();
  }

  Stream<DocumentSnapshot> getDocSnapshot(
      {required String uId,
      required CollectionReference collectionReference}) async* {
    yield* users.doc(uId).snapshots();
  }

  Stream<QuerySnapshot<Object?>> getCollectionSnapshot() async* {
    yield* users.snapshots();
  }

  Future<QuerySnapshot> getCollection() async {
    return await users.get();
  }
}
