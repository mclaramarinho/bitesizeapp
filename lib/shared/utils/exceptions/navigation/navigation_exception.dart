import 'package:adhd_app/shared/utils/exceptions/base_exception.dart';

abstract class NavigationException extends BaseException {
  const NavigationException({required super.message});
}
// TODO - localize

class RouteDoesNotExist extends NavigationException {
  const RouteDoesNotExist()
    : super(message: 'The account already exists for that email.');
}
