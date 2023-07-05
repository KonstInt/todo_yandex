import 'package:to_do_yandex/data/api/service/shared_prefs_service.dart';

class SharedPrefsApiUtil {
  final SharedPrefsService _sharedPrefsService;
  SharedPrefsApiUtil(this._sharedPrefsService);
  Future<int> getRemoteRevision() async {
    return await _sharedPrefsService.getRemoteRevision();
  }

  Future<bool> setRemoteRevision(int revision) async {
    return await _sharedPrefsService.setRemoteRevision(revision);
  }

  Future<int> getLocalRevision() async {
    return await _sharedPrefsService.getLocalRevision();
  }

  Future<bool> setLocalRevision(int revision) async {
    return await _sharedPrefsService.setLocalRevision(revision);
  }

  Future<Map<String, int>> getUnSynchronizedDeleted() async {
    return await _sharedPrefsService.getUnSynchronizedDeleted();
  }

  Future<bool> setUnSynchronizedDeleted(Map<String, int> deletedItems) async {
    return await _sharedPrefsService.setUnSynchronizedDeleted(deletedItems);
  }
}
