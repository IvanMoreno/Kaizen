// [x] Display previous workday
// [] Display next workday
// [] If there are no workday next, fill formulary

import 'package:flutter_test/flutter_test.dart';
import 'package:kaizen/Application/KaizenApplication.dart';
import 'package:kaizen/Domain/KaizenDomain.dart';

import 'MockRepository.dart';
import 'MockWorkdayNavigation.dart';
import 'WorkdayFactory.dart';

main() {
  test('Display previous workday', () async {
    var mock = MockRepository();
    mock.History = [DemoDay];
    var mockView = MockWorkdayNavigation();

    await ReviewWorkday(mock, mockView).Previous();

    expect(mockView.ShownWorkday, DemoDay);
  });

  test('Display two days ago', () async {
    var mock = MockRepository();
    mock.History = [DemoDay, AnotherDemoDay, DemoDay];
    var mockView = MockWorkdayNavigation();

    var sut = ReviewWorkday(mock, mockView);
    await sut.Previous();
    await sut.Previous();

    expect(mockView.ShownWorkday, AnotherDemoDay);
  });

  test('Avoid reviewing non worked day', () async {
    var mock = MockRepository();
    mock.History = [DemoDay];
    var mockView = MockWorkdayNavigation();

    var sut = ReviewWorkday(mock, mockView);
    await sut.Previous();
    await sut.Previous();

    expect(mockView.ShownWorkday, DemoDay);
  });
}