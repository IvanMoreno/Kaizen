import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kaizen/Domain/KaizenDomain.dart';
import 'package:kaizen/Infrastructure/KaizenInfrastructure.dart';

import 'CustomFinders.dart';
import 'MockRepository.dart';
import 'WorkdayFormularyFilling.dart';

// [] Display hints in fields
// [] Display buttons intention

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

  testWidgets('Upload several good and bad things to repository',
          (WidgetTester tester) async {

        var mock = MockRepository();
        await tester.pumpWidget(
            EmbedInApp(WorkdayFormulary(() => DateTime(2024, 8, 3), mock)));

        await tester.SelectDropdownOption(dropdownKey: "RatingDropdown", option: "III");
        await tester.FillSeveralGoodThings(["a good thing", "another good thing"]);
        await tester.FillBadThing(issue: "a bad thing", proposedSolution: "one solution");
        await tester.FillBadThing(issue: "another bad thing", proposedSolution: "other solution");
        await tester.tap(find.byKey(const Key("EndWorkday")));

        expect(
            mock.LastSubmission,
            Workday(date: DateTime(2024, 8, 3), rating: 3, goodThings: [
              GoodThing("a good thing"),
              GoodThing("another good thing")
            ], badThings: [
              BadThing(issue: "a bad thing", proposedSolution: "one solution"),
              BadThing(issue: "another bad thing", proposedSolution: "other solution")
            ]));
      });
}

MaterialApp EmbedInApp(Widget widget) =>
    MaterialApp(home: Scaffold(body: widget));

T FirstWidget<T>() => find.byType(T).evaluate().single.widget as T;