import 'package:kaizen/Application/KaizenApplication.dart';

class ReviewWorkday {
  final WorkdaysRepository repository;
  final WorkdayNavigation view;
  int index = -1;

  ReviewWorkday(this.repository, this.view);

  Future<void> Previous() async {
    if(index == -1) index = (await repository.Load()).length;
    if (index <= 0) {
      return;
    }

    view.Review((await repository.Load())[--index]);
  }

  Future<void> Next() async {
    if (index == -1 || (await repository.Load()).length <= index + 1) {
      view.ExitReview();
      index = -1;
      return;
    }

    view.Review((await repository.Load())[--index]);
  }
}
