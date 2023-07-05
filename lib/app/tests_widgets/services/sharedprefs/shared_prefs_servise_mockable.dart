import 'package:mockito/mockito.dart';
import 'package:to_do_yandex/data/api/service/shared_prefs_service.dart';

class MockSharedPrefsService extends Mock implements SharedPrefsService {
  MockSharedPrefsService();
  Map<String, int> prefs = {};
  int revision = 0;
  @override
  Future<int> getRemoteRevision() async {
    return 0;
  }

  @override
  Future<bool> setRemoteRevision(int revision) async {
    this.revision = revision;
    return true;
  }

  @override
  Future<int> getLocalRevision() async {
    return revision;
  }

  @override
  Future<bool> setLocalRevision(int revision) async {
    this.revision = revision;
    return true;
  }

  @override
  Future<Map<String, int>> getUnSynchronizedDeleted() async {
    return prefs;
  }

  @override
  Future<bool> setUnSynchronizedDeleted(Map<String, int> deletedItems) async {
    prefs = deletedItems;
    return true;
  }
}
