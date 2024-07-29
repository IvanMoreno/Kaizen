import 'package:kaizen/Domain/KaizenDomain.dart';

class WorkdayReviewProgress
{
  int index = -1;
  
  void Previous(List<Workday> fromWorkdays)
  {
    if(index == fromWorkdays.length - 1) return;

    index++;
  }
  
  void Next(List<Workday> fromWorkdays) {
    assert(!DidFinish(fromWorkdays));
    
    index--;
  }
  
  Workday Current(List<Workday> list) => list.reversed.elementAt(index);

  bool DidFinish(List<Workday> fromWorkdays) => index < 0;
}