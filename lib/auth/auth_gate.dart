// Listens to auth changes
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yearly/pages/authenticated/authenticated_controller.dart';
import 'package:yearly/pages/unauthenticated/unauthenticated_controller.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      //Listens to auth state changes
      stream: Supabase.instance.client.auth.onAuthStateChange, 
      builder: (context, snapshot){
        //while loading
        if(snapshot.connectionState == ConnectionState.waiting) {
          return  Scaffold(
            body:Center(child: Image.asset('lib/assets/yearlylogoanimation.gif', width: 200, height: 200,))
          );
        }

        //Checks valid session
        final session = snapshot.hasData ? snapshot.data!.session : null;

        if(session != null){
          return AuthenticatedController();
        }else {
          return UnauthenticatedController();
        }
      }
    );
  }
}