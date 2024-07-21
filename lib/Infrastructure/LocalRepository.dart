import 'package:kaizen/Infrastructure/Repository.dart';
import 'package:kaizen/Domain/Workday.dart';

class LocalRepository implements WorkdaysRepository
{
  @override
  void Save(Workday today) {
    throw UnimplementedError();
  }
  
}