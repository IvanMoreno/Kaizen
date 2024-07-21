import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WorkdayFormulary extends StatefulWidget {
  final DateTime Function() today;
  
  const WorkdayFormulary(this.today, {super.key});

  @override
  State<WorkdayFormulary> createState() => _WorkdayFormularyState();
}

class _WorkdayFormularyState extends State<WorkdayFormulary> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Date(),
        Rating(),
        AllGoodThings(),
      ],
    );
  }

  Widget Rating() {
    return DropdownButton<String>(
          key: const Key("RatingDropdown"),
          items: const [DropdownMenuItem(child: Text("No Rating"))],
          onChanged: (_) {});
  }

  Widget Date() => Text(FormattedDate());
  String FormattedDate() => DateFormat("MMMM dd, yyyy").format(widget.today());

  Widget AllGoodThings() => Expanded(child: ListView(key: const Key("AllGoodThings"),children: [Text("data")],));
}
