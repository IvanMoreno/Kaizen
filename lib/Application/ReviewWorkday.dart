import 'package:kaizen/Application/KaizenApplication.dart';
import 'package:kaizen/Domain/WorkdayReviewProgress.dart';

class ReviewWorkday {
  final WorkdaysRepository repository;
  final WorkdayNavigation view;
  late WorkdayReviewProgress progress;

  ReviewWorkday(this.repository, this.view)
  {
    progress = WorkdayReviewProgress();
  }

  Future<void> Previous() async {
    progress.Previous(await repository.Load());
    view.Review(progress.Current(await repository.Load()));
  }

  Future<void> Next() async {
    if (progress.DidFinish(await repository.Load())) return;
    
    progress.Next(await repository.Load());
    
    if (progress.DidFinish(await repository.Load())) {
      view.ExitReview();
      return;
    }

    view.Review(progress.Current(await repository.Load()));
  }
}