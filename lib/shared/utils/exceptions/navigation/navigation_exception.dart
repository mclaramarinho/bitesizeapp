abstract class NavigationException implements Exception {
  String get message;
}

class RouteDoesNotExist implements NavigationException {
  final String _message;

  const RouteDoesNotExist({
    this._message = 'The account already exists for that email.',
  });

  @override
  String get message => _message;
}