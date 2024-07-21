import 'package:flutter/material.dart';

class GoodThingField extends StatelessWidget {
  String get Content => myController.value.text;
  final myController = TextEditingController();
  
  GoodThingField({super.key});

  @override
  Widget build(BuildContext context) => TextField(decoration: const InputDecoration(
    border: OutlineInputBorder(),
    hintText: 'Enter good thing...',
  ),controller: myController);
}