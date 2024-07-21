import 'package:kaizen/Repository.dart';
import 'package:kaizen/Workday.dart';

class MockRepository implements WorkdaysRepository {
  var LastSubmission;

  @override
  void Save(Workday today) => LastSubmission = today;
}