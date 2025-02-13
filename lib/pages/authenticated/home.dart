import 'package:flutter/material.dart';
import 'package:yearly/auth/auth_service.dart';



class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final authService = AuthService();

  void logOut(){
    authService.signOut();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final currentEmail = authService.getCurrentEmail();
    return  Center(
      child: Column(
        children:[
          Text(currentEmail ?? 'No Email'), 
          GestureDetector(
            onTap: logOut,
            child: Container(
              color: Colors.red,
              child: const Text('Log Out'),
            ),
          )
        ]
      ),
    );
  }
}
