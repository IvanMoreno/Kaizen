import 'package:kaizen/Application/KaizenApplication.dart';
import 'package:kaizen/Domain/KaizenDomain.dart';

class MockWorkdayNavigation implements WorkdayNavigation {
  Workday? ShownWorkday;
  bool DidExit = false;

  @override
  void Review(Workday workday) => ShownWorkday = workday;

  @override
  void ExitReview() => DidExit = true;
}