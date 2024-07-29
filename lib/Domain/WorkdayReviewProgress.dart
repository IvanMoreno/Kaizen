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
    if(index == -1) index = fromWorkdays.length;
    
    index--;    
  }
  
  Workday Next(List<Workday> fromWorkdays)
  {
    assert(!DidFinished(fromWorkdays));
    
    return fromWorkdays[++index];
  }
  
  void NextNew(List<Workday> fromWorkdays) {
    assert(!DidFinished(fromWorkdays));
    
    index++;
  }
  
  Workday Current(List<Workday> list) => list[index];

  bool DidFinished(List<Workday> fromWorkdays) => index == fromWorkdays.length || index == -1;
}