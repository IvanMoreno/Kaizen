import 'package:kaizen/Domain/KaizenDomain.dart';

Workday get DemoDay =>
    Workday(date: DateTime(2024, 7, 1), rating: 1, goodThings: [
      GoodThing("something good"),
      GoodThing("another good thing"),
    ], badThings: [
      BadThing(issue: "something bad", proposedSolution: "a solution"),
      BadThing(issue: "another bad thing", proposedSolution: "another solution")
    ]);

Workday get AnotherDemoDay =>
    Workday(date: DateTime(2024, 7, 2), rating: 2, goodThings: [
      GoodThing("incredible"),
    ], badThings: [
      BadThing(issue: "very bad", proposedSolution: "a solution"),
    ]);