import 'package:flutter/material.dart';
import 'package:yearly/pages/unauthenticated/on_board_screening.dart';

class UnauthenticatedController extends StatefulWidget {
  const UnauthenticatedController({super.key});

  @override
  State<UnauthenticatedController> createState() => _UnauthenticatedControllerState();
}

class _UnauthenticatedControllerState extends State<UnauthenticatedController> {
  @override
  Widget build(BuildContext context) {
    return Center(child: OnBoardScreening(),);
  }
}