import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kejar_for_parents/views/authenticate/sign_in.dart';
import 'package:kejar_for_parents/views/home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.userChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot);
              return Home();
            } else {
              return SignIn();
            }
          }),
    );
  }
}
