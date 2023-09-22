
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../screens/base_screen.dart';
import '../screens/login_view.dart';

class AuthStateChanges extends StatelessWidget {
  const AuthStateChanges({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const BaseScreen();
        } else {
          return const LoginView();
        }
      },
    );
  }
}
