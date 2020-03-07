import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserManagement {
  storeNewUser(BuildContext context, AuthResult user) {
    Firestore.instance
        .collection('/users')
        .add({
          'email': user.user.email,
          'uid': user.user.uid,
        })
        .then((value) {
          Navigator.of(context).pop();
          Navigator.of(context).pushReplacementNamed('/homepage');
        })
        .catchError((e) {});
  }
}
