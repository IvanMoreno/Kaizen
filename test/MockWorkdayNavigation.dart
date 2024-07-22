import 'package:kaizen/Application/KaizenApplication.dart';
import 'package:kaizen/Domain/KaizenDomain.dart';

class MockWorkdayNavigation implements WorkdayNavigation {
  Workday? ShownWorkday;

  @override
  void Review(Workday workday) => ShownWorkday = workday;
}