import 'package:flutter/material.dart';
import 'package:kaizen/Application/KaizenApplication.dart';
import 'package:kaizen/Infrastructure/KaizenInfrastructure.dart';

class NavigationWidget extends StatefulWidget {
  final DateTime Function() today;
  final WorkdaysRepository repository;
  
  const NavigationWidget(this.today, this.repository, {super.key});

  @override
  State<NavigationWidget> createState() => _NavigationWidgetState();
}

class _NavigationWidgetState extends State<NavigationWidget> {
  @override
  Widget build(BuildContext context) {
    return WorkdayFormulary(widget.today, widget.repository);
  }
}