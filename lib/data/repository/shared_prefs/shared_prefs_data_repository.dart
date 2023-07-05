import 'package:to_do_yandex/data/api/shared_prefs_api_util.dart';
import 'package:to_do_yandex/domain/repository/abstract_shared_prefs_repository.dart';

class SharedPrefsDataRepository extends AbstractSharedPrefsRepository {
  final SharedPrefsApiUtil _sharedPrefsUtil;
  SharedPrefsDataRepository(this._sharedPrefsUtil);
  @override
  Future<int> getRemoteRevision() async {
    return _sharedPrefsUtil.getRemoteRevision();
  }

  @override
  Future<bool> setRemoteRevision(int revision) async {
    return _sharedPrefsUtil.setRemoteRevision(revision);
  }

  @override
  Future<int> getLocalRevision() async {
    return _sharedPrefsUtil.getLocalRevision();
  }

  @override
  Future<bool> setLocalRevision(int revision) async {
    return _sharedPrefsUtil.setLocalRevision(revision);
  }

  @override
  Future<Map<String, int>> getUnSynchronizedDeleted() async {
    return _sharedPrefsUtil.getUnSynchronizedDeleted();
  }

  @override
  Future<bool> setUnSynchronizedDeleted(Map<String, int> deletedItems) async {
    return _sharedPrefsUtil.setUnSynchronizedDeleted(deletedItems);
  }
}
