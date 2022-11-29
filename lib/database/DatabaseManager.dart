import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final auth = FirebaseAuth.instance.currentUser;
final uid = auth?.uid;
final db = FirebaseFirestore.instance;

class DatabaseManager {
  Future getUserName() async {
    final users = db.collection('users');
    var snapshot = await users.doc('${uid}').get();
    Map<String, dynamic>? data = snapshot.data();
    var name = data?['name'];
    return name;
  }

  final CollectionReference notifList = db.collection('notifications');

  Future getNotifList() async {
    List itemList = [];

    try {
      await notifList.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          itemList.add(element.reference);
        });
      });
      return itemList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
