import 'package:flutter/material.dart';
import 'package:kaizen/Application/KaizenApplication.dart';
import 'package:kaizen/Domain/Workday.dart';
import 'package:kaizen/Infrastructure/KaizenInfrastructure.dart';
import 'package:kaizen/Infrastructure/WorkdayReview.dart';

class NavigationWidget extends StatefulWidget implements WorkdayNavigation {
  final DateTime Function() today;
  final WorkdaysRepository repository;
  late ReviewWorkday reviewWorkday;
  late WorkdayFormulary formulary;
  
  Workday? beingReviewed;

  NavigationWidget(this.today, this.repository, {super.key}) {
    reviewWorkday = ReviewWorkday(repository, this);
    formulary = WorkdayFormulary(today, repository);
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
        Previous(),
        Next(),
        Content()
      ],
    );
  }

  ElevatedButton Previous() {
    return ElevatedButton(
          key: const Key("Previous"),
          onPressed: () => setState(() {
            widget.reviewWorkday.Previous();
          }),
          child: const Text("<"));
  }

  ElevatedButton Next() {
    return ElevatedButton(
        key: const Key("Next"),
        onPressed: () => setState(() {
          widget.beingReviewed = null;
        }),
        child: const Text(">"));
  }
  
  Widget Content() {
    return widget.beingReviewed == null
      ? widget.formulary
      : WorkdayReview(widget.beingReviewed!);
  }
}
