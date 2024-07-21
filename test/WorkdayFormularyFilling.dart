import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kaizen/BadThingField.dart';
import 'package:kaizen/ProposedSolutionField.dart';

extension WorkdayFormularyFilling on WidgetTester
{
  Future<void> FillBadThing({required String issue, required String proposedSolution})
  async {
    await tap(find.byKey(const Key("AddBadThing")));
    await pumpAndSettle();
    await enterText(find.byType(BadThingField).last, issue);
    await enterText(
        find.byType(ProposedSolutionField).last, proposedSolution);
  }
}