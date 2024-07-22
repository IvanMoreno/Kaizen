import 'package:kaizen/Application/KaizenApplication.dart';

class ReviewWorkday {
  final WorkdaysRepository repository;
  final WorkdayView view;
  int index = -1;
  
  ReviewWorkday(this.repository, this.view);

  Future<void> Previous() async {
    view.Review((await repository.Load())[++index]);
  }
}