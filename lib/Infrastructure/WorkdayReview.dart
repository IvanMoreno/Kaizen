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
    return Column(children: [
      Date(),
      Rating(),
      AllGoodThings(),
      AllBadThings()
    ],);
  }

  Widget Date() => Text(FormattedDate());
  String FormattedDate() => DateFormat("MMMM dd, yyyy").format(widget.toBeDisplayed.date);
  Widget Rating() => Text(widget.toBeDisplayed.rating.ToRomanNumeral());
  Widget AllGoodThings() => Column(children: widget.toBeDisplayed.goodThings.map((good) => Text(good.cause)).toList(),);

  Widget AllBadThings() {
    return Column(
      children: [
        Text(widget.toBeDisplayed.badThings.first.issue),
        Text(widget.toBeDisplayed.badThings.first.proposedSolution),
      ],
    );
  }
}