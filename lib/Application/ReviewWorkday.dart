import 'package:kaizen/Application/KaizenApplication.dart';

class ReviewWorkday {
  final WorkdaysRepository repository;
  final WorkdayView view;

  ReviewWorkday(this.repository, this.view);

  Future<void> Previous() async {
    view.Review((await repository.Load())[0]);
  }
}