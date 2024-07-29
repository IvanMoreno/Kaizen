import 'package:flutter_test/flutter_test.dart';
import 'package:kaizen/Domain/WorkdayReviewProgress.dart';
import 'WorkdayFactory.dart';

main()
{
  test('Workday review is finished by default', ()
  {
    expect(CreateSut().DidFinish(), isTrue);
  });
  
  test('Start process after reviewing previous workday', ()
  {
    var sut = CreateSut();
    
    sut.Update([DemoDay]);
    sut.Previous();
    
    expect(sut.DidFinish(), isFalse);
  });
  
  test('Finish review process', ()
  {
    var sut = CreateSut();

    sut.Update([DemoDay]);
    sut.Previous();
    sut.Next();

    expect(sut.DidFinish(), isTrue);
  });
  
  test('Review a workday', ()
  {
    var sut = CreateSut();

    sut.Update([DemoDay]);
    sut.Previous();

    expect(sut.Current(), DemoDay);
  });

  test('Review the last workday', ()
  {
    var sut = CreateSut();

    sut.Update([AnotherDemoDay, DemoDay, DemoDay]);
    sut.Previous();
    sut.Previous();
    sut.Previous();

    expect(sut.Current(), AnotherDemoDay);
  });
  
  test('Review previous workday after adding one', ()
  {
    var sut = CreateSut();

    sut.Update([DemoDay]);
    sut.Previous();
    sut.Next();
    sut.Update([DemoDay, AnotherDemoDay]);
    sut.Previous();
    
    expect(sut.Current(), AnotherDemoDay);
  });
}

WorkdayReviewProgress CreateSut() => WorkdayReviewProgress();