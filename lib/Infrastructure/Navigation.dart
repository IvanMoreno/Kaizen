import 'package:flutter/material.dart';
import 'package:kaizen/Application/KaizenApplication.dart';
import 'package:kaizen/Domain/Workday.dart';
import 'package:kaizen/Infrastructure/KaizenInfrastructure.dart';

class NavigationWidget extends StatefulWidget implements WorkdayView {
  final DateTime Function() today;
  final WorkdaysRepository repository;
  late ReviewWorkday reviewWorkday;
  Workday? beingReviewed;

  NavigationWidget(this.today, this.repository, {super.key}) {
    reviewWorkday = ReviewWorkday(repository, this);
  }

  @override
  State<NavigationWidget> createState() => _NavigationWidgetState();

  @override
  void Review(Workday workday) => beingReviewed = workday;
}

class _NavigationWidgetState extends State<NavigationWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ElevatedButton(
            key: const Key("ReviewPreviousDay"),
            onPressed: () => setState(() {
              widget.reviewWorkday.Previous();
            }),
            child: const Text("<")),
        Content()
      ],
    );
  }

  Widget Content() => widget.beingReviewed == null
      ? WorkdayFormulary(widget.today, widget.repository)
      : Center();
}
