import 'package:kaizen/Domain/KaizenDomain.dart';

class WorkdaySerializer {
  
  static Map<String, dynamic> ToJson(Workday day) => {
    'day': day.date.day,
    'month': day.date.month,
    'year': day.date.year,
    'rating': day.rating,
    'goodThings': day.goodThings.map((x) => x.cause).toList(),
    'badThings': day.badThings.map((x) => "${x.issue}@${x.proposedSolution}").toList()
  };

  static Workday FromJson(Map<String, dynamic> json) {
    return Workday(date: DateTime(json['year'], json['month'], json['day']),
        rating: json['rating'], goodThings: GoodThings(json),
        badThings: BadThings(json));
  }

  static List<GoodThing> GoodThings(Map<String, dynamic> json)
  => (json['goodThings'] as List<dynamic>).map((x) => GoodThing(x)).toList();

  static List<BadThing> BadThings(Map<String, dynamic> json)
  => (json['badThings'] as List<dynamic>).map((x) => BadThing(issue: x.split('@').first, proposedSolution: x.split('@').last)).toList();

  static List<Workday> FromJsonAll(Map<String, dynamic> json) 
  => (json['workdays'] as List<dynamic>).map((x) => x as Map<String, dynamic>).map(FromJson).toList();
  
  static Map<String, dynamic> ToJsonAll(List<Workday> list) =>
  {
    'workdays': list.map(ToJson).toList(),
  };
}
