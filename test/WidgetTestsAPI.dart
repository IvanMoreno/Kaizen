import 'package:kaizen/Infrastructure/KaizenInfrastructure.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'MockRepository.dart';

WorkdayFormulary Formulary({DateTime? when, MockRepository? repository})
=> WorkdayFormulary(() => when ?? DateTime(2024, 6, 3), repository ?? MockRepository());

MaterialApp EmbedInApp(Widget widget) =>
    MaterialApp(home: Scaffold(body: widget));

T FirstWidget<T>() => find.byType(T).evaluate().first.widget as T;