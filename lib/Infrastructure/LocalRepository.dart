import 'package:kaizen/Application/WorkdayRepository.dart';
import 'package:kaizen/Domain/Workday.dart';

class LocalRepository implements WorkdaysRepository
{
  @override
  void Save(Workday today) {
    throw UnimplementedError();
  }

  @override
  Future<List<Workday>> Load() {
    throw UnimplementedError();
  }
}