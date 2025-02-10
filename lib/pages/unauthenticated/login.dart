import 'package:flutter/material.dart';
import 'package:yearly/auth/auth_service.dart';
class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final authService = AuthService();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();


  void logIn() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    try {
      authService.signInWithEmailPassword(email, password);
    } catch (e) {
      if(mounted){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: $e"),)
        );
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}