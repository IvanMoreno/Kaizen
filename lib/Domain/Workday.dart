import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:kaizen/Domain/BadThing.dart';
import 'package:kaizen/Domain/GoodThing.dart';

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
  
  @override
  String toString() {
    return "${DateFormat("MMMM dd, yyyy").format(date)} - Rating: $rating - good things: $goodThings - bad things: $badThings";    
  }
}