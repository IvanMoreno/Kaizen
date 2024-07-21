import 'package:flutter/material.dart';
import 'package:kaizen/Infrastructure/BadThingField.dart';
import 'package:kaizen/Infrastructure/ProposedSolutionField.dart';

class BadThingEntry extends StatelessWidget {
  String get Content => badThing.Content;
  String get Solution => solution.Content;

  final badThing = BadThingField();
  final solution = ProposedSolutionField();

  BadThingEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        badThing,
        solution,
      ],
    );
  }
}