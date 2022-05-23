import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../widgets/inregistrare/auth_form.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  static const String routeName = "/logare";

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  var _auth;
  bool _isloading = false;

  void _submitAuthForm(String email, String password, bool isLogin) async {
    _auth = FirebaseAuth.instance;

    UserCredential authResult;
    try {
      setState(() {
        _isloading = true;
      });
      if (isLogin) {
        authResult = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        authResult = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        await FirebaseFirestore.instance
            .collection('utilizatori')
            .doc(authResult.user?.uid)
            .set({'telefon': "071111111"});
      }
      setState(() {
        _isloading = false;
      });
    } on PlatformException catch (err) {
      setState(() {
        _isloading = false;
      });
      String? message =
          'A aparut o eroare! Va rugăm verificați ce ați introdus!';

      if (err.message != null) {
        message = err.message;
      }

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message!)));
    } catch (err) {
      print(err.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: AuthForm(_submitAuthForm, _isloading),
    );
  }
}
