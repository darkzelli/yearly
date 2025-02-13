import 'package:flutter/material.dart';
import 'package:yearly/auth/auth_service.dart';
import 'package:yearly/pages/unauthenticated/login.dart';
class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final authService = AuthService();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();


  void signUp() async {
    final email = _emailController.text;
    final password = _passwordController.text;
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
                    child: Text("Create an Account",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700, color: Color.fromRGBO(44, 132, 255, 1), ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text("Get started creating your account by entering in your email and a password below.",
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
                  padding: const EdgeInsets.only(top: 25),
                  child: TextField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Confirm Password",
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
                    onTap: () => signUp(),
                    child: Container(
                      width: screenWidth * .9,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(44, 132, 255, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(child: Text("Create an Account", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700),)),
                    ),
                  )
                ),
                GestureDetector(
                  onTap: () => Navigator.popAndPushNamed(context, '/login'),
                  child: RichText(text: TextSpan(
                    children: <TextSpan>[
                    TextSpan(text: "Already have an account? ", style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0), fontSize: 18)),
                    TextSpan(text: "Log In", style: TextStyle(color: Color.fromRGBO(44, 132, 255, 1), fontSize: 18, fontWeight: FontWeight.w700)),
                ])),
                )
                
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}