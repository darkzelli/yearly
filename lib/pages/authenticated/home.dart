import 'package:flutter/material.dart';
import 'package:yearly/widgets/year_selector.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: YearSelector());
  }
}
