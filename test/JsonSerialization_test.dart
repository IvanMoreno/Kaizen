import 'package:flutter_test/flutter_test.dart';
import 'package:kaizen/Infrastructure/WorkdaySerializer.dart';
import 'WorkdayFactory.dart';

main() {
  test('Encode and decode workday to json', () {
    expect(WorkdaySerializer.FromJson(WorkdaySerializer.ToJson(DemoDay)), DemoDay);
    expect(WorkdaySerializer.FromJson(WorkdaySerializer.ToJson(AnotherDemoDay)), AnotherDemoDay);
  });
}