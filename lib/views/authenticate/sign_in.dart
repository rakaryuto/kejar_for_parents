import 'package:flutter/material.dart';
import 'package:kejar_for_parents/models/user.dart';
import 'package:kejar_for_parents/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kejar_for_parents/views/home/home.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  //text controller
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  //fungsi untuk visibility password
  bool isHidden = true;
  void toggePasswordView() {
    setState(() {
      isHidden = !isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/cover.jpg'),
                fit: BoxFit.cover)),
        padding: EdgeInsets.fromLTRB(16, 123, 16, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Logo Kejar.id
              Container(
                  height: 100,
                  width: 326,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/logo.png'),
                          fit: BoxFit.fill))),

              SizedBox(height: 180),

              Column(
                children: [
                  //Input Email
                  Container(
                    padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                    width: 360,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Colors.black54),
                        color: Colors.white),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Email"),
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 24),

                  //Input Password
                  Container(
                    padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                    width: 360,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Colors.black54),
                        color: Colors.white),
                    child: TextField(
                      obscureText: isHidden,
                      controller: _passwordController,
                      decoration: InputDecoration(
                          suffixIcon: InkWell(
                              onTap: toggePasswordView,
                              child: Icon(isHidden
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                          border: InputBorder.none,
                          hintText: "Password"),
                      style: TextStyle(fontSize: 16),
                    ),
                  ),

                  //Login Button
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 22, 0, 18),
                    width: 360,
                    height: 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.black54,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      print("start sign in as ${_emailController.text}");
                      dynamic result = await _auth.signInEmailPass(
                          _emailController.text, _passwordController.text);
                      if (result == null) {
                        print("Sign in error");
                      } else {
                        UserClass(uid: result.uid);
                        print("Signed in");
                      }
                      print(result);
                    },
                    child: Text(
                      "Masuk",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue[800],
                        onSurface: Colors.blue[200],
                        fixedSize: Size(360, 48)),
                  ),
                  SizedBox(height: 16),

                  //Text Bantuan CS
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Untuk bantuan, hubungi CS Kejar.id "),

                      //Direct Link untuk CS
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "di sini",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[800]),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
