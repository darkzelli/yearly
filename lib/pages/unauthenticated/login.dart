import 'package:flutter/material.dart';
import 'package:yearly/auth/auth_service.dart';
import 'package:yearly/pages/unauthenticated/signup.dart';
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
    final screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: 30, horizontal: screenWidth * .06),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(44, 132, 255, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Welcome back!",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700, color: Color.fromRGBO(44, 132, 255, 1), ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text("We are happy to see you here again! Enter your email and password to get started.",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.grey[400]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.grey, width: 1.0)
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.grey, width: 1.0)
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: GestureDetector(
                    onTap: () => logIn(),
                    child: Container(
                      width: screenWidth * .9,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(44, 132, 255, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(child: Text("Log In", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700),)),
                    ),
                  )
                ),
                Text("Forgot your password?", style: TextStyle(color: Color.fromRGBO(44, 132, 255, 1), fontSize: 18, fontWeight: FontWeight.w700),),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Row(
                    children: [
                      Expanded(child: Divider(thickness: 2)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "or",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Expanded(child: Divider(thickness: 2)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: GestureDetector(
                    onTap: () => Navigator.popAndPushNamed(context, '/signup'),
                    child: Container(
                      width: screenWidth * .9,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(child: Text("Create an Account", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700),)),
                    ),
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}