import 'package:aplicatie_gestiune_rezervari/screens/admin_panel_screen.dart';
import 'package:aplicatie_gestiune_rezervari/screens/homepage_screen.dart';
import 'package:flutter/foundation.dart';
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
  // ignore: prefer_typing_uninitialized_variables
  var _auth;
  bool _isloading = false;

  void _submitAuthForm(String email, String password, String nume,
      String prenume, String telefon, bool isLogin) async {
    _auth = FirebaseAuth.instance;

    UserCredential authResult;
    try {
      setState(() {
        _isloading = true;
      });
      if (isLogin) {
        authResult = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        //TODO: aici sa afiseze admin screen pt admin
        if (authResult.user != null) {
          final user = await FirebaseFirestore.instance
              .collection("utilizatori")
              .doc(authResult.user?.uid)
              .get();
          if (user['esteAdmin'] && user['esteAdmin'] == true) {
            Navigator.of(context)
                .pushReplacementNamed(AdminPanelScreen.routeName);
          } else {
            Navigator.of(context)
                .pushReplacementNamed(HomepageScreen.routeName);
          }
        }
      } else {
        try {
          authResult = await _auth.createUserWithEmailAndPassword(
              email: email, password: password);

          await FirebaseFirestore.instance
              .collection('utilizatori')
              .doc(authResult.user?.uid)
              .set({
            'telefon': telefon,
            "esteAdmin": false,
            "email": authResult.user?.email,
            "nume": nume,
            "prenume": prenume,
          });
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content:
                  Text("Contul cu adresa $email a fost creat cu succes!!")));
        } on FirebaseAuthException catch (signUpError) {
          if (signUpError.code == 'email-already-in-use') {
            setState(() {
              _isloading = false;
            });
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                    "Contul cu adresa $email este folosită deja!! Vă rugăm alegeți o altă adresă de e-mail!!")));
          }
        }
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
      if (kDebugMode) {
        print(err.toString());
      }
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
