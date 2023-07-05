import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/constants.dart';

class SharedPrefsService {
  Future<int> getRemoteRevision() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    int i = sharedPrefs.getInt(MyConstants.keyRemoteRevision) ?? 0;
    return i;
  }

  Future<bool> setRemoteRevision(int revision) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    Future<bool> b =
        sharedPrefs.setInt(MyConstants.keyRemoteRevision, revision);
    return b;
  }

  Future<int> getLocalRevision() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    int i = sharedPrefs.getInt(MyConstants.keyLocalRevision) ?? 0;
    return i;
  }

  Future<bool> setLocalRevision(int revision) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    Future<bool> b = sharedPrefs.setInt(MyConstants.keyLocalRevision, revision);
    return b;
  }

  Future<Map<String, int>> getUnSynchronizedDeleted() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final String stringResult =
        sharedPrefs.getString(MyConstants.keyUnSynchronized) ?? "";
    Map<String, int> result = {};
    if (stringResult.isNotEmpty) {
      Map<dynamic, dynamic> tmp = jsonDecode(stringResult);
      tmp.forEach((key, value) {
        result.addAll({key as String: value as int});
      });
    }
    return result;
  }

  Future<bool> setUnSynchronizedDeleted(Map<String, int> deletedItems) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.setString(MyConstants.keyUnSynchronized,
        deletedItems.isNotEmpty ? jsonEncode(deletedItems) : "");
  }
}
