import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kaizen/Domain/KaizenDomain.dart';
import 'package:kaizen/Infrastructure/KaizenInfrastructure.dart';

import 'CustomFinders.dart';

extension WorkdayFormularyFilling on WidgetTester {
  Future<void> FillBadThing({required String issue, required String proposedSolution}) async {
    await tap(find.byKey(const Key("AddBadThing")));
    await pumpAndSettle();
    await enterText(find.byType(BadThingField).last, issue);
    await enterText(find.byType(ProposedSolutionField).last, proposedSolution);
  }

  Future<void> FillSeveralGoodThings(List<String> causes) async {
    await enterText(find.byType(GoodThingField).first, causes.first);

    for (int i = 1; i < causes.length; i++) {
      await tap(find.byKey(const Key("AddGoodThing")));
      await pumpAndSettle();
      await enterText(find.byType(GoodThingField).last, causes[i]);
    }
  }

  Future<void> FillWith(Workday when) async {
    await SelectDropdownOption(dropdownKey: "RatingDropdown", option: when.rating.ToRomanNumeral());
    await FillSeveralGoodThings(when.goodThings.map((goodThing) => goodThing.cause).toList());
    for (var badThing in when.badThings) {
      await FillBadThing(issue: badThing.issue, proposedSolution: badThing.proposedSolution);
    }
    await tap(find.byKey(const Key("EndWorkday")));
  }
}
