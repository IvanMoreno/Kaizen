import 'package:flutter/material.dart';

class GoodThingField extends StatelessWidget {
  String get Content => myController.value.text;
  final myController = TextEditingController();
  
  GoodThingField({super.key});

  @override
  Widget build(BuildContext context) => TextField(controller: myController);
}