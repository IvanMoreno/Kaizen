// [] Display previous workday
// [] Display next workday
// [] If there are no workday next, fill formulary

import 'package:flutter_test/flutter_test.dart';
import 'package:kaizen/Domain/KaizenDomain.dart';
import 'package:kaizen/Infrastructure/KaizenInfrastructure.dart';

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

class ReviewWorkday {
  final WorkdaysRepository repository;
  final WorkdayView view;
  
  ReviewWorkday(this.repository, this.view);

  Future<void> Previous() async {
    view.Review((await repository.Load())[0]);
  }
}

abstract class WorkdayView
{
  void Review(Workday workday);
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