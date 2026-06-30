import 'package:adhd_app/shared/services/network/connectivity/domain/connectivity_service.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

// TODO (docs)
@Injectable(as: ConnectivityService)
class ConnectivityServiceImpl implements ConnectivityService {
  final InternetConnection _internetConnection = InternetConnection();

  bool? wasOnline;

  @override
  Stream<bool?> get onConnectivityChanged {
    return _internetConnection.onStatusChange.map((status) {
      final isOnline = status == InternetStatus.connected;

      if (wasOnline == null) {
        wasOnline = isOnline;
        return null;
      }
      final prevWasOff = wasOnline;
      wasOnline = isOnline;
      if (isOnline != prevWasOff) return isOnline;
      return null;
    });
  }

  // One-off check for current status
  Future<bool> checkCurrentConnection() async {
    return await _internetConnection.hasInternetAccess;
  }
}
