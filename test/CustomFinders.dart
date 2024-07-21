import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

extension CustomFinders on WidgetTester {
  bool ExistsListWithKey(String key) =>
      widgetList<ListView>(find.byKey(ValueKey(key))).isNotEmpty;

  Future<void> SelectDropdownOption({required String dropdownKey, required String option})
  async{
    var ratingDropdown = find.byKey(ValueKey(dropdownKey));
    await tap(ratingDropdown);
    await pumpAndSettle();
    var firstRating = find.text(option).last;
    await tap(firstRating);
    await pumpAndSettle();
  }
}