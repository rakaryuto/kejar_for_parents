import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetWaktu extends StatelessWidget {
  final String docId;
  const GetWaktu({Key? key, required this.docId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference notifs =
        FirebaseFirestore.instance.collection('notifications');

    return FutureBuilder<DocumentSnapshot>(
        future: notifs.doc(docId).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Text("${data['waktu']}",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 11,
                    fontWeight: FontWeight.bold));
          }
          return Text("loading");
        }));
  }
}
