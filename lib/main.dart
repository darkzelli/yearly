import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:yearly/auth/auth_gate.dart';

void main() async{
  await dotenv.load(fileName: '.env');
  await Supabase.initialize(anonKey: dotenv.env['SUPABASE_ANON_KEY']!, url: "https://pygzcugpeaxbpotnpkrk.supabase.co");
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme:  ThemeData(
              colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white)
            ),
        home: Scaffold(
            body: AuthGate())
        );
  }
}
