import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kaizen/Domain/KaizenDomain.dart';
import 'package:kaizen/Infrastructure/KaizenInfrastructure.dart';
import 'package:kaizen/Infrastructure/Navigation.dart';

import 'CustomFinders.dart';
import 'MockRepository.dart';
import 'ReviewWorkday_test.dart';
import 'WorkdayFormularyFilling.dart';

// [] Save workday locally
// [] Review yesterday workday

void main() {
  testWidgets('All formulary fields are empty by default',
      (WidgetTester tester) async {
    await tester.pumpWidget(EmbedInApp(
        Formulary(when:DateTime(2024, 7, 1))));

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
        EmbedInApp(Formulary(when:DateTime(2024, 7, 1), repository: mock)));

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
            EmbedInApp(Formulary(when: DateTime(2024, 8, 3), repository: mock)));

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
  
  testWidgets('Review previously filled workday', (WidgetTester tester) async {
    await tester.pumpWidget(
        EmbedInApp(NavigationWidget(() => DateTime(2024, 6, 3), MockRepository())));
    
    await tester.FillWith(DemoDay);
    await tester.tap(find.byKey(const Key("ReviewPreviousDay")));

    expect(find.text(DemoDay.rating.ToRomanNumeral()), findsOne);
    expect(find.text("June 03, 2024"), findsOne);
    expect(find.text(DemoDay.goodThings.first.cause), findsOne);
    expect(find.text(DemoDay.badThings.first.issue), findsOne);
    expect(find.text(DemoDay.badThings.first.proposedSolution), findsOne);
  });
}

WorkdayFormulary Formulary({DateTime? when, MockRepository? repository}) 
=> WorkdayFormulary(() => when ?? DateTime(2024, 6, 3), repository ?? MockRepository());

MaterialApp EmbedInApp(Widget widget) =>
    MaterialApp(home: Scaffold(body: widget));

T FirstWidget<T>() => find.byType(T).evaluate().single.widget as T;