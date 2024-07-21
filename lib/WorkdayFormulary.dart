import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WorkdayFormulary extends StatefulWidget {
  final DateTime Function() today;
  
  const WorkdayFormulary(this.today, {super.key});

  @override
  State<WorkdayFormulary> createState() => _WorkdayFormularyState();
}

class _WorkdayFormularyState extends State<WorkdayFormulary> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        key: const Key("RatingDropdown"),
        items: const [DropdownMenuItem(child: Text("No Rating"))],
        onChanged: (_) {});
  }
}
