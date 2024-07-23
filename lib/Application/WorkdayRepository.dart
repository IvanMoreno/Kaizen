import 'package:kaizen/Domain/Workday.dart';

abstract class WorkdaysRepository {
  Future<void> Save(Workday today);
  Future<List<Workday>> Load();
}
