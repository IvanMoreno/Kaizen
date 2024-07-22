import 'package:kaizen/Domain/KaizenDomain.dart';
import 'package:kaizen/Infrastructure/Repository.dart';
import 'package:kaizen/Domain/Workday.dart';

class MockRepository implements WorkdaysRepository {
  Workday? LastSubmission;

  @override
  void Save(Workday today) => LastSubmission = today;

  @override
  Future<List<Workday>> Load() async {
    return [LastSubmission!];
  }
}