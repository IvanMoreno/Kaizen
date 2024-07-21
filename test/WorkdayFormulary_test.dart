import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kaizen/BadThingField.dart';
import 'package:kaizen/GoodThingField.dart';
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
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: WorkdayFormulary(() => DateTime(2024, 7, 1)))));

    expect(find.text("No Rating"), findsOne);
    expect(find.text("July 01, 2024"), findsOne);
    expect(tester.ExistsListWithKey("AllGoodThings"), isTrue);
    expect(
        ((find.byType(GoodThingField).evaluate().single).widget
                as GoodThingField)
            .Content,
        isEmpty);

    expect(tester.ExistsListWithKey("AllBadThings"), isTrue);
    expect(find.byType(BadThingField), findsNothing);
  });
}

extension CustomFinders on WidgetTester {
  bool ExistsListWithKey(String key) =>
      widgetList<ListView>(find.byKey(ValueKey(key))).isNotEmpty;
}
