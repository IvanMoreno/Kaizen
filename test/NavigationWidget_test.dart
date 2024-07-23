import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kaizen/Domain/KaizenDomain.dart';
import 'package:kaizen/Infrastructure/KaizenInfrastructure.dart';
import 'package:kaizen/Infrastructure/Navigation.dart';

import 'MockRepository.dart';
import 'WidgetTestsAPI.dart';
import 'WorkdayFactory.dart';
import 'WorkdayFormularyFilling.dart';

void main() {
  testWidgets('Review previously filled workday', (WidgetTester tester) async {
    await tester.pumpWidget(EmbedInApp(NavigationWidget(() => DateTime(2024, 6, 3), MockRepository())));

    await tester.FillWith(DemoDay);
    await tester.tap(find.byKey(const Key("Previous")));
    await tester.pumpAndSettle();

    expect(find.text(DemoDay.rating.ToRomanNumeral()), findsOne);
    expect(find.text("June 03, 2024"), findsOne);

    for (var goodThing in DemoDay.goodThings) {
      expect(find.text(goodThing.cause), findsOne);
    }

    for (var badThing in DemoDay.badThings) {
      expect(find.text(badThing.issue), findsOne);
      expect(find.text(badThing.proposedSolution), findsOne);
    }
  });

  testWidgets('Navigate back to formulary keeping the progress', (WidgetTester tester) async {
    await tester.pumpWidget(EmbedInApp(NavigationWidget(() => DateTime(2024, 6, 3), MockRepository())));

    await tester.FillWith(DemoDay);
    await tester.tap(find.byKey(const Key("Previous")),warnIfMissed: false);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key("Next")));
    await tester.pumpAndSettle();

    expect(find.text(DemoDay.rating.ToRomanNumeral()), findsOne);
    expect(FirstWidget<GoodThingField>().Content, isNotEmpty);
    expect(FirstWidget<BadThingField>().Content, isNotEmpty);
  },skip: true);
}
