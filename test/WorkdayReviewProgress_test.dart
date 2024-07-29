import 'package:flutter_test/flutter_test.dart';
import 'package:kaizen/Domain/WorkdayReviewProgress.dart';
import 'WorkdayFactory.dart';

main()
{
  test('Workday review is finished by default', ()
  {
    expect(WorkdayReviewProgress().DidFinished([]), isTrue);
    expect(WorkdayReviewProgress().DidFinished([DemoDay]), isTrue);
  });
}