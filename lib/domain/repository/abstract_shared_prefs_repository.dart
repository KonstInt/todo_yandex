abstract class AbstractSharedPrefsRepository {
  Future<int> getRemoteRevision();
  Future<bool> setRemoteRevision(int revision);
  Future<int> getLocalRevision();
  Future<bool> setLocalRevision(int revision);
  Future<Map<String, int>> getUnSynchronizedDeleted();
  Future<bool> setUnSynchronizedDeleted(Map<String, int> deletedItems);
}
