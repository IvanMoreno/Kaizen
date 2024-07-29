import 'package:kaizen/Domain/KaizenDomain.dart';

class WorkdayReviewProgress
{
  int index = -1;
  
  Workday Previous(List<Workday> fromWorkdays)
  {
    if(index == -1) index = fromWorkdays.length;
    if(index == 0) return fromWorkdays[0];
    
    return fromWorkdays[--index];
  }
  
  void PreviousNew(List<Workday> fromWorkdays)
  {
    if(index == fromWorkdays.length - 1) return;

    index++;
  }
  
  Workday Next(List<Workday> fromWorkdays)
  {
    assert(!DidFinish(fromWorkdays));
    
    return fromWorkdays[++index];
  }
  
  void NextNew(List<Workday> fromWorkdays) {
    assert(!DidFinish(fromWorkdays));
    
    index--;
  }
  
  Workday Current(List<Workday> list) => list.reversed.elementAt(index);

  bool DidFinish(List<Workday> fromWorkdays) => index < 0;
}