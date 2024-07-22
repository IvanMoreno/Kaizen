import 'package:kaizen/Domain/Workday.dart';

abstract class WorkdaysRepository {
  void Save(Workday today);
  Future<List<Workday>> Load();
}
