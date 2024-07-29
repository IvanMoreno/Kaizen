import 'package:flutter_test/flutter_test.dart';
import 'package:kaizen/Domain/WorkdayReviewProgress.dart';
import 'WorkdayFactory.dart';

main()
{
  test('Workday review is finished by default', ()
  {
    expect(CreateSut().DidFinish([]), isTrue);
    expect(CreateSut().DidFinish([DemoDay]), isTrue);
  });
  
  test('Start process after reviewing previous workday', ()
  {
    var sut = CreateSut();
    
    sut.Previous([DemoDay]);
    
    expect(sut.DidFinish([DemoDay]), isFalse);
  });
  
  test('Finish review process', ()
  {
    var sut = CreateSut();

    sut.Previous([DemoDay]);
    sut.Next([DemoDay]);

    expect(sut.DidFinish([DemoDay]), isTrue);
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

    sut.Previous([AnotherDemoDay, DemoDay, DemoDay]);
    sut.Previous([AnotherDemoDay, DemoDay, DemoDay]);
    sut.Previous([AnotherDemoDay, DemoDay, DemoDay]);

    expect(sut.Current([AnotherDemoDay, DemoDay, DemoDay]), AnotherDemoDay);
  });
  
  test('Review previous workday after adding one', ()
  {
    var sut = CreateSut();

    sut.Previous([DemoDay]);
    sut.Next([DemoDay]);
    sut.Previous([DemoDay, AnotherDemoDay]);
    
    expect(sut.Current([DemoDay, AnotherDemoDay]), AnotherDemoDay);
  });
}

WorkdayReviewProgress CreateSut() => WorkdayReviewProgress();