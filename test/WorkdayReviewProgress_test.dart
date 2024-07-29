import 'package:flutter_test/flutter_test.dart';
import 'package:kaizen/Domain/WorkdayReviewProgress.dart';
import 'WorkdayFactory.dart';

main()
{
  test('Workday review is finished by default', ()
  {
    expect(CreateSut().DidFinished([]), isTrue);
    expect(CreateSut().DidFinished([DemoDay]), isTrue);
  });
  
  test('Start process after reviewing previous workday', ()
  {
    var sut = CreateSut();
    
    sut.Previous([DemoDay]);
    
    expect(sut.DidFinished([DemoDay]), isFalse);
  });
  
  test('Finish review process', ()
  {
    var sut = CreateSut();

    sut.Previous([DemoDay]);
    sut.NextNew([DemoDay]);

    expect(sut.DidFinished([DemoDay]), isTrue);
  });
  
  test('Review a workday', ()
  {
    var sut = CreateSut();

    sut.Previous([DemoDay]);

    expect(sut.Current([DemoDay]), DemoDay);
  });

  test('Review the last workday', ()
  {
    var sut = CreateSut();

    sut.PreviousNew([AnotherDemoDay, DemoDay, DemoDay]);
    sut.PreviousNew([AnotherDemoDay, DemoDay, DemoDay]);
    sut.PreviousNew([AnotherDemoDay, DemoDay, DemoDay]);

    expect(sut.Current([AnotherDemoDay, DemoDay, DemoDay]), AnotherDemoDay);
  });
  
  test('Review previous workday after adding one', ()
  {
    var sut = CreateSut();

    sut.PreviousNew([DemoDay]);
    sut.NextNew([DemoDay]);
    sut.PreviousNew([DemoDay, AnotherDemoDay]);
    
    expect(sut.Current([DemoDay, AnotherDemoDay]), AnotherDemoDay);
  });
}

WorkdayReviewProgress CreateSut() => WorkdayReviewProgress();