import 'package:flutter/material.dart';

class BadThingField extends StatelessWidget {
  String get Content => myController.value.text;
  
  final myController = TextEditingController();
  
  BadThingField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter bad thing...',
        ),controller: myController),
      ],
    );
  }
}