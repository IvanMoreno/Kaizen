import 'package:kaizen/Application/KaizenApplication.dart';
import 'package:kaizen/Domain/WorkdayReviewProgress.dart';

class ReviewWorkday {
  final WorkdaysRepository repository;
  final WorkdayNavigation view;
  late WorkdayReviewProgress progress;

  ReviewWorkday(this.repository, this.view) {
    progress = WorkdayReviewProgress();
  }

  Future<void> Previous() async {
    progress.Update(await repository.Load());
    progress.Previous();
    _Review();
  }

  Future<void> Next() async {
    if (progress.DidFinish()) return;

    progress.Update(await repository.Load());
    progress.Next();
    _Review();
  }

  void _Review() {
    if (progress.DidFinish()) {
      view.ExitReview();
      return;
    }

    view.Review(progress.Current());
  }
}
