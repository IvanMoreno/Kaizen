import 'package:kaizen/Workday.dart';

abstract class WorkdaysRepository
{
  void Save(Workday today);
}