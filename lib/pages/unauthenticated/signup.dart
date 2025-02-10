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
  final _confirmPasswordController = TextEditingController();


  void signUp() async {
    final email = _emailController.text;
    final password = _emailController.text;
    final confirmPassword = _confirmPasswordController.text;

    if( password != confirmPassword){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Passwords do not match")));
      return;
    }
    try {
      authService.signUpWithEmailPassword(email, password);

      Navigator.pop(context);
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