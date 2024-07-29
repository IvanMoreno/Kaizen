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
  
  test('Start process after reviewing previous workday', ()
  {
    var sut = WorkdayReviewProgress();
    
    sut.Previous([DemoDay]);
    
    expect(sut.DidFinished([DemoDay]), isFalse);
  });
}