import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kaizen/WorkdayFormulary.dart';

import 'package:kaizen/main.dart';

// [] Rate day
// [] Assign today's date
// [] Introduce good thing
// [] Introduce bad thing
//    [] Introduce solution to bad thing
// [] Save workday in repository

void main() {
  testWidgets('All formulary fields are empty by default', (WidgetTester tester) async {
    
    await tester.pumpWidget(const MaterialApp(home: Scaffold(body:WorkdayFormulary())));

    expect(find.byKey(const Key("RatingDropdown")), isEmpty);
  });
}
