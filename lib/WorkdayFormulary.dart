import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WorkdayFormulary extends StatefulWidget {
  const WorkdayFormulary({super.key});

  @override
  State<WorkdayFormulary> createState() => _WorkdayFormularyState();
}

class _WorkdayFormularyState extends State<WorkdayFormulary> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        key: const Key("RatingDropdown"),
        items: const [DropdownMenuItem(child: Text("I"))],
        onChanged: (_) {});
  }
}
