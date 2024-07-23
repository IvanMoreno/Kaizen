import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:kaizen/Domain/KaizenDomain.dart';
import 'WorkdayFactory.dart';

main() {
  test('Encode and decode workday to json', () {
    expect(WorkdaySerializer.FromJson(WorkdaySerializer.ToJson(DemoDay)), DemoDay);
    expect(WorkdaySerializer.FromJson(WorkdaySerializer.ToJson(AnotherDemoDay)), AnotherDemoDay);
  });
}

class WorkdaySerializer {
  static Map<String, dynamic> ToJson(Workday day) => {
        'day': day.date.day,
        'month': day.date.month,
        'year': day.date.year,
        'rating': day.rating,
        'goodThings': day.goodThings.map((x) => x.cause).toList(),
        'badThings': day.badThings.map((x) => (x.issue, x.proposedSolution)).toList()
      };

  static Workday FromJson(Map<String, dynamic> json) {
    return Workday(date: DateTime(json['year'], json['month'], json['day']), 
        rating: json['rating'], goodThings: GoodThings(json), 
        badThings: BadThings(json));
  }

  static List<GoodThing> GoodThings(Map<String, dynamic> json) 
    => (json['goodThings'] as List<String>).map((x) => GoodThing(x)).toList();

  static List<BadThing> BadThings(Map<String, dynamic> json) 
    => (json['badThings'] as List<(String,String)>).map((x) => BadThing(issue: x.$1, proposedSolution: x.$2)).toList();
}
