import 'package:flutter/foundation.dart';
import 'package:kaizen/BadThing.dart';
import 'package:kaizen/GoodThing.dart';

class Workday {
  final DateTime date;
  final int rating;
  final List<GoodThing> goodThings;
  final List<BadThing> badThings;

  Workday({required this.date, required this.rating, required this.goodThings, required this.badThings});
  
  @override
  bool operator ==(Object other) {
    return other is Workday && other.date == date && other.rating == rating && listEquals(other.goodThings, goodThings) && listEquals(other.badThings, badThings);
    
  }
}