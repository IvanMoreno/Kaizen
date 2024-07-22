import 'package:kaizen/Application/KaizenApplication.dart';

class ReviewWorkday {
  final WorkdaysRepository repository;
  final WorkdayNavigation view;
  int index = -1;
  
  ReviewWorkday(this.repository, this.view);

  Future<void> Previous() async {
    if((await repository.Load()).length <= index + 1)
      return;
      
    view.Review((await repository.Load())[++index]);
  }
}