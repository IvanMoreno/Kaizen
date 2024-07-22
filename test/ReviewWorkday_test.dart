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
    var mockView = MockWorkdayNavigation();

    await ReviewOf([DemoDay], mockView).Previous();

    expect(mockView.ShownWorkday, DemoDay);
  });

  test('Display two days ago', () async {
    var mockView = MockWorkdayNavigation();

    var sut = ReviewOf([DemoDay, AnotherDemoDay, DemoDay], mockView);
    await sut.Previous();
    await sut.Previous();

    expect(mockView.ShownWorkday, AnotherDemoDay);
  });

  test('Avoid reviewing non worked day', () async {
    var mockView = MockWorkdayNavigation();

    var sut = ReviewOf([DemoDay], mockView);
    await sut.Previous();
    await sut.Previous();

    expect(mockView.ShownWorkday, DemoDay);
  });
  
  test('Review next workday', ()
  async {
    var mockView = MockWorkdayNavigation();

    var sut = ReviewOf([DemoDay, AnotherDemoDay, DemoDay], mockView);
    await sut.Previous();
    await sut.Previous();
    await sut.Next();
    
    expect(mockView.ShownWorkday, DemoDay);
  });
}

ReviewWorkday ReviewOf(List<Workday> workdays, MockWorkdayNavigation mockView) {
  var mock = MockRepository();
  mock.History = workdays;
  return ReviewWorkday(mock, mockView);
}