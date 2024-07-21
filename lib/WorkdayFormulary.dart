import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kaizen/BadThing.dart';
import 'package:kaizen/BadThingEntry.dart';
import 'package:kaizen/GoodThing.dart';
import 'package:kaizen/GoodThingField.dart';
import 'package:kaizen/Repository.dart';
import 'package:kaizen/Workday.dart';

class WorkdayFormulary extends StatefulWidget {
  final DateTime Function() today;
  final WorkdaysRepository repository;

  const WorkdayFormulary(this.today, this.repository, {super.key});

  @override
  State<WorkdayFormulary> createState() => _WorkdayFormularyState();
}

class _WorkdayFormularyState extends State<WorkdayFormulary> {
  final List<BadThingEntry> _allBadThings = List.empty(growable: true);
  String rating = "0";
  
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
        value: rating,
        items: const [
          DropdownMenuItem(value: "0", child: Text("No Rating")),
          DropdownMenuItem(value: "1", child: Text("I")),
          DropdownMenuItem(value: "2", child: Text("II")),
          DropdownMenuItem(value: "3", child: Text("III")),
          DropdownMenuItem(value: "4", child: Text("IV")),
          DropdownMenuItem(value: "5", child: Text("V")),
        ],
        onChanged: (selection) => rating = selection!);
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
          itemBuilder: (context, index) {
            return _allBadThings[index];
          },
        ),
      );

  Widget EndWorkday() => ElevatedButton(
      key: const Key("EndWorkday"), onPressed: () => widget.repository.Save(Today()), child: const Text("End"));

  Workday Today() => Workday(date: widget.today(), rating: int.parse(rating), goodThings: [GoodThing("something good")], badThings: [BadThing(issue: "something bad", proposedSolution: "a solution")]);
}
