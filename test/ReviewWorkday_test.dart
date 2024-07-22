// [x] Display previous workday
// [] Display next workday
// [] If there are no workday next, fill formulary

import 'package:flutter_test/flutter_test.dart';
import 'package:kaizen/Application/KaizenApplication.dart';
import 'package:kaizen/Domain/KaizenDomain.dart';

import 'MockRepository.dart';

main() {
  test('Display previous workday', () async {
    var mock = MockRepository();
    mock.LastSubmission = DemoDay;
    var mockView = MockWorkdayView();

    await ReviewWorkday(mock, mockView).Previous();

    expect(mockView.ShownWorkday, DemoDay);
  });
}

class MockWorkdayView implements WorkdayView {
  Workday? ShownWorkday;

  @override
  void Review(Workday workday) => ShownWorkday = workday;
}

Workday get DemoDay =>
    Workday(date: DateTime(2024, 7, 1), rating: 1, goodThings: [
      GoodThing("something good")
    ], badThings: [
      BadThing(issue: "something bad", proposedSolution: "a solution")
    ]);