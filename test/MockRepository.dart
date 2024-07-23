import 'package:kaizen/Domain/KaizenDomain.dart';
import 'package:kaizen/Application/WorkdayRepository.dart';
import 'package:kaizen/Domain/Workday.dart';

class MockRepository implements WorkdaysRepository {
  Workday? LastSubmission;
  List<Workday> History = List.empty(growable: true);

  @override
  Future<void> Save(Workday today) async {
    LastSubmission = today;
    History.add(today);
  }

  @override
  Future<List<Workday>> Load() async {
    return History;
  }
}