import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kaizen/BadThing.dart';
import 'package:kaizen/BadThingField.dart';
import 'package:kaizen/GoodThing.dart';
import 'package:kaizen/GoodThingField.dart';
import 'package:kaizen/ProposedSolutionField.dart';
import 'package:kaizen/Workday.dart';
import 'package:kaizen/WorkdayFormulary.dart';

import 'CustomFinders.dart';
import 'MockRepository.dart';

// [] Rate day
// [] Assign today's date
// [] Introduce good thing
// [] Introduce bad thing
//    [] Introduce solution to bad thing
// [] Save workday in repository

void main() {
  testWidgets('All formulary fields are empty by default',
      (WidgetTester tester) async {
    await tester.pumpWidget(EmbedInApp(
        WorkdayFormulary(() => DateTime(2024, 7, 1), MockRepository())));

    expect(find.text("No Rating"), findsOne);
    expect(find.text("July 01, 2024"), findsOne);
    expect(tester.ExistsListWithKey("AllGoodThings"), isTrue);
    expect(FirstWidget<GoodThingField>().Content, isEmpty);
    expect(tester.ExistsListWithKey("AllBadThings"), isTrue);
    expect(find.byType(BadThingField), findsNothing);
  });

  testWidgets('Upload filled formulary to repository',
      (WidgetTester tester) async {
    
    var mock = MockRepository();
    await tester.pumpWidget(
        EmbedInApp(WorkdayFormulary(() => DateTime(2024, 7, 1), mock)));

    await tester.SelectDropdownOption(dropdownKey: "RatingDropdown", option: "I");
    
    await tester.enterText(find.byType(GoodThingField).first, "something good");

    await tester.FillBadThing(issue: "something bad", proposedSolution: "a solution");

    await tester.tap(find.byKey(const Key("EndWorkday")));

    expect(
        mock.LastSubmission,
        Workday(date: DateTime(2024, 7, 1), rating: 1, goodThings: [
          GoodThing("something good")
        ], badThings: [
          BadThing(issue: "something bad", proposedSolution: "a solution")
        ]));
  });
}

MaterialApp EmbedInApp(Widget widget) =>
    MaterialApp(home: Scaffold(body: widget));

T FirstWidget<T>() => find.byType(T).evaluate().single.widget as T;

extension WorkdayFormularyFilling on WidgetTester
{
  Future<void> FillBadThing({required String issue, required String proposedSolution})
  async {
    await tap(find.byKey(const Key("AddBadThing")));
    await pumpAndSettle();
    await enterText(find.byType(BadThingField).first, issue);
    await enterText(
        find.byType(ProposedSolutionField).first, proposedSolution);
  }
}