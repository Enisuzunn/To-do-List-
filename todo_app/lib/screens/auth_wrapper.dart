import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_screen.dart';
import 'home_screen.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // Loading durumu
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        
        // Kullanıcı giriş yapmışsa home screen'e git
        if (snapshot.hasData && snapshot.data != null) {
          return const HomeScreen();
        }
        
        // Kullanıcı giriş yapmamışsa login screen'e git
        return const LoginScreen();
      },
    );
  }
}
