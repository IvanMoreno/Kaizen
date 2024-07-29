import 'dart:convert';
import 'package:kaizen/Application/WorkdayRepository.dart';
import 'package:kaizen/Domain/Workday.dart';
import 'package:kaizen/Infrastructure/WorkdaySerializer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalRepository implements WorkdaysRepository {
  SharedPreferences? preferences;
  List<Workday> allWorkdays = List.empty(growable: true);

  @override
  Future<void> Save(Workday today) async {
    preferences ??= await SharedPreferences.getInstance();
    if(allWorkdays.isEmpty) {
      allWorkdays = await Load();
    }
    
    allWorkdays.add(today);
    preferences!.setString('history', jsonEncode(WorkdaySerializer.ToJsonAll(allWorkdays)));
  }

  @override
  Future<List<Workday>> Load() async {
    preferences ??= await SharedPreferences.getInstance();
    if(allWorkdays.isEmpty && preferences!.containsKey('history')) {
      return WorkdaySerializer.FromJsonAll(jsonDecode(preferences!.getString('history')!));
    }
    
    return allWorkdays;
  }
}
