import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../screens/auth_screen.dart';

class SignOutManager {
  void delogare(BuildContext context) async {
    await FirebaseAuth.instance.signOut().then((value) =>
        Navigator.of(context).pushReplacementNamed(AuthScreen.routeName));
  }
}
