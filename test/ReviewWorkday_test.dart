// [x] Display previous workday
// [] Display next workday
// [] If there are no workday next, fill formulary

import 'package:flutter_test/flutter_test.dart';
import 'package:kaizen/Application/KaizenApplication.dart';
import 'package:kaizen/Domain/KaizenDomain.dart';

import 'MockRepository.dart';
import 'WorkdayFactory.dart';

main() {
  test('Display previous workday', () async {
    var mock = MockRepository();
    mock.History = [DemoDay];
    var mockView = MockWorkdayView();

    await ReviewWorkday(mock, mockView).Previous();

    expect(mockView.ShownWorkday, DemoDay);
  });

  test('Display two days ago', () async {
    var mock = MockRepository();
    mock.History = [DemoDay, AnotherDemoDay, DemoDay];
    var mockView = MockWorkdayView();

    var sut = ReviewWorkday(mock, mockView);
    await sut.Previous();
    await sut.Previous();

    expect(mockView.ShownWorkday, AnotherDemoDay);
  });
}

class MockWorkdayView implements WorkdayView {
  Workday? ShownWorkday;

  @override
  void Review(Workday workday) => ShownWorkday = workday;
}