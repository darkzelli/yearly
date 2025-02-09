import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Image.asset('lib/assets/yearlylogoanimation.gif', width: 200, height: 200,),
    );
  }
}
