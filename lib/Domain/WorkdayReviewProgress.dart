import 'package:kaizen/Domain/KaizenDomain.dart';

class WorkdayReviewProgress
{
  int index = -1;
  List<Workday> history = List.empty();
  
  void Update(List<Workday> history)
  {
    this.history = history;
  }
  
  void Previous(List<Workday> fromWorkdays)
  {
    Update(fromWorkdays);
    PreviousNew();
  }
  
  void PreviousNew()
  {
    if(index == history.length - 1) return;
    
    index++;
  }
  
  void Next(List<Workday> fromWorkdays) {
    Update(fromWorkdays);
    NextNew();
  }
  
  void NextNew()
  {
    assert(!DidFinish());

    index--;
  }
  
  Workday Current(List<Workday> list) => list.reversed.elementAt(index);
  Workday CurrentNew() => history.reversed.elementAt(index);

  bool DidFinish() => index < 0;
}