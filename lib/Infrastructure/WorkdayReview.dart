import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:kaizen/Domain/KaizenDomain.dart';

class WorkdayReview extends StatefulWidget
{
  final Workday toBeDisplayed;

  const WorkdayReview(this.toBeDisplayed, {super.key});

  @override
  State<WorkdayReview> createState() => _WorkdayReviewState();
}

class _WorkdayReviewState extends State<WorkdayReview> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      const SizedBox(height: 60,),
      Date(),
      Rating(),
      AllGoodThings(),
      const Text("--- BAD THINGS ---"),
      AllBadThings()
    ],);
  }

  Widget Date() => Text(FormattedDate());
  String FormattedDate() => DateFormat("MMMM dd, yyyy").format(widget.toBeDisplayed.date);
  Widget Rating() => Text(widget.toBeDisplayed.rating.ToRomanNumeral());
  Widget AllGoodThings() => Column(children: widget.toBeDisplayed.goodThings.map((good) => Text(good.cause)).toList(),);
  Widget AllBadThings() => Column(children: widget.toBeDisplayed.badThings.map(DisplayBadThing).toList(),);

  Widget DisplayBadThing(BadThing badThing) {
    return Column(
    children: [
      Text(badThing.issue),
      Text(badThing.proposedSolution,style: const TextStyle(fontWeight: FontWeight.bold)),
    ],
  );
  }
}