import 'package:flutter/material.dart';

class ProposedSolutionField extends StatelessWidget {
  String get Content => myController.value.text;
  final myController = TextEditingController();

  ProposedSolutionField({super.key});

  @override
  Widget build(BuildContext context) => TextField(decoration: const InputDecoration(
    border: OutlineInputBorder(),
    hintText: 'Propose a solution...',
  ),controller: myController);
}