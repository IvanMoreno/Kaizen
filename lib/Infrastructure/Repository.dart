import 'package:kaizen/Domain/Workday.dart';

abstract class WorkdaysRepository
{
  void Save(Workday today);
}