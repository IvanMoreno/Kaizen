import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kaizen/Domain/KaizenDomain.dart';
import 'package:kaizen/Infrastructure/Navigation.dart';

import 'MockRepository.dart';
import 'ReviewWorkday_test.dart';
import 'WidgetTestsAPI.dart';
import 'WorkdayFormularyFilling.dart';

void main() {
  testWidgets('Review previously filled workday', (WidgetTester tester) async {
    await tester.pumpWidget(
        EmbedInApp(NavigationWidget(() => DateTime(2024, 6, 3), MockRepository())));

    await tester.FillWith(DemoDay);
    await tester.tap(find.byKey(const Key("ReviewPreviousDay")));
    await tester.pumpAndSettle();

    expect(find.text(DemoDay.rating.ToRomanNumeral()), findsOne);
    expect(find.text("June 03, 2024"), findsOne);
    expect(find.text(DemoDay.goodThings.first.cause), findsOne);
    expect(find.text(DemoDay.badThings.first.issue), findsOne);
    expect(find.text(DemoDay.badThings.first.proposedSolution), findsOne);
  });
}