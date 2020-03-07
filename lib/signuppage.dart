import 'package:auth_form/services/usermanagement.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup Page'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              onChanged: (value) {
                setState(() {
                  _email = value;
                });
              },
              decoration: InputDecoration(hintText: 'E-mail'),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  _password = value;
                });
              },
              decoration: InputDecoration(hintText: 'Password'),
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () {
                FirebaseAuth.instance
                  .createUserWithEmailAndPassword(
                    email: _email, password: _password,)
                  .then((signedInUser) {
                    UserManagement().storeNewUser(context, signedInUser);
                  })
                  .catchError((e) {
                    print(e);
                  });
              },
              child: Text('Signup'),
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}