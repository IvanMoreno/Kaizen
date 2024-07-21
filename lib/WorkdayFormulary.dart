import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kaizen/BadThingEntry.dart';
import 'package:kaizen/GoodThingField.dart';
import 'package:kaizen/Repository.dart';

class WorkdayFormulary extends StatefulWidget {
  final DateTime Function() today;

  const WorkdayFormulary(this.today, WorkdaysRepository mockRepository, {super.key});

  @override
  State<WorkdayFormulary> createState() => _WorkdayFormularyState();
}

class _WorkdayFormularyState extends State<WorkdayFormulary> {
  List<BadThingEntry> _allBadThings = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Date(),
        Rating(),
        AllGoodThings(),
        AllBadThings(),
        AddBadThingButton(),
        EndWorkday()
      ],
    );
  }

  Widget AddBadThingButton() => FloatingActionButton(
      key: const Key("AddBadThing"),
      onPressed: () => setState(() {
            _allBadThings.add(BadThingEntry());
          }),
      child: const Text("+"));

  Widget Rating() {
    return DropdownButton<String>(
        key: const Key("RatingDropdown"),
        value: "0",
        items: const [
          DropdownMenuItem(value: "0", child: Text("No Rating")),
          DropdownMenuItem(value: "1", child: Text("I"))
        ],
        onChanged: (_) {});
  }

  Widget Date() => Text(FormattedDate());

  String FormattedDate() => DateFormat("MMMM dd, yyyy").format(widget.today());

  Widget AllGoodThings() => Expanded(
          child: ListView(
        key: const Key("AllGoodThings"),
        children: [GoodThingField()],
      ));

  Widget AllBadThings() => Expanded(
        child: ListView.builder(
          key: const Key("AllBadThings"),
          itemCount: _allBadThings.length,
          itemBuilder: (context, index){
            return _allBadThings[index];
          },
        ),
      );

  Widget EndWorkday() => ElevatedButton(key: Key("EndWorkday"),onPressed: (){}, child: const Text("End"));
}
