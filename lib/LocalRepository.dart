import 'package:kaizen/Repository.dart';
import 'package:kaizen/Workday.dart';

class LocalRepository implements WorkdaysRepository
{
  @override
  void Save(Workday today) {
    throw UnimplementedError();
  }
  
}