import 'package:kaizen/Domain/KaizenDomain.dart';

Workday get DemoDay =>
    Workday(date: DateTime(2024, 7, 1), rating: 1, goodThings: [
      GoodThing("something good")
    ], badThings: [
      BadThing(issue: "something bad", proposedSolution: "a solution")
    ]);