import 'package:kaizen/Domain/KaizenDomain.dart';

class WorkdayReviewProgress
{
  int index = -1;
  List<Workday> history = List.empty();
  
  void Update(List<Workday> history) => this.history = history;
  
  void Previous()
  {
    if(index == history.length - 1) return;
    
    index++;
  }
  
  void Next()
  {
    assert(!DidFinish());

    index--;
  }
  
  Workday Current() => history.reversed.elementAt(index);
  bool DidFinish() => index < 0;
}