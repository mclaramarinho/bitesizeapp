// TODO (docs)
abstract class ConnectivityService {
  // Exposes a stream of online/offline status changes
  Stream<bool?> get onConnectivityChanged;
}
