import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kaizen/BadThingField.dart';
import 'package:kaizen/GoodThingField.dart';
import 'package:kaizen/ProposedSolutionField.dart';
import 'package:kaizen/WorkdayFormulary.dart';

// [] Rate day
// [] Assign today's date
// [] Introduce good thing
// [] Introduce bad thing
//    [] Introduce solution to bad thing
// [] Save workday in repository

void main() {
  testWidgets('All formulary fields are empty by default',
      (WidgetTester tester) async {
    await tester
        .pumpWidget(EmbedInApp(WorkdayFormulary(() => DateTime(2024, 7, 1))));

    expect(find.text("No Rating"), findsOne);
    expect(find.text("July 01, 2024"), findsOne);
    expect(tester.ExistsListWithKey("AllGoodThings"), isTrue);
    expect(FirstWidget<GoodThingField>().Content, isEmpty);
    expect(tester.ExistsListWithKey("AllBadThings"), isTrue);
    expect(find.byType(BadThingField), findsNothing);
  });

  testWidgets('Upload filled formulary to repository',
      (WidgetTester tester) async {
    
    await tester
        .pumpWidget(EmbedInApp(WorkdayFormulary(() => DateTime(2024, 7, 1))));

    var ratingDropdown = find.byKey(const ValueKey("RatingDropdown"));
    await tester.tap(ratingDropdown);
    await tester.pumpAndSettle();
    var firstRating = find.text("I").last;
    await tester.tap(firstRating);
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(GoodThingField).first, "something good");
    
    await tester.tap(find.byKey(const Key("AddBadThing")));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(BadThingField).first, "something bad");
    await tester.enterText(find.byType(ProposedSolutionField).first, "a solution");
  });
}

MaterialApp EmbedInApp(Widget widget) =>
    MaterialApp(home: Scaffold(body: widget));

T FirstWidget<T>() => find.byType(T).evaluate().single.widget as T;

extension CustomFinders on WidgetTester {
  bool ExistsListWithKey(String key) =>
      widgetList<ListView>(find.byKey(ValueKey(key))).isNotEmpty;
}
