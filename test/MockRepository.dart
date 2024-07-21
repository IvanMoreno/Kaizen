import 'package:kaizen/Infrastructure/Repository.dart';
import 'package:kaizen/Domain/Workday.dart';

class MockRepository implements WorkdaysRepository {
  var LastSubmission;

  @override
  void Save(Workday today) => LastSubmission = today;
}