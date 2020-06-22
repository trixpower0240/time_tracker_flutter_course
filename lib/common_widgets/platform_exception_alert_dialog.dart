import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:time_tracker_flutter_course/common_widgets/platform_alert_dialog.dart';

class PlatformExceptionAlertDialog extends PlatformAlertDialog {
  PlatformExceptionAlertDialog({
    @required String title,
    @required PlatformException exception,
  }) : super(
          title: title,
          content: _message(exception),
          defaultActionText: 'OK',
        );

  static String _message(PlatformException exception) {
    return _errors[exception.code] ?? exception.message;
  }

  static Map<String, String> _errors = {
    'ERROR_WEAK_PASSWORD':
        'The password you are trying to use is weak, try another password',
    'ERROR_INVALID_EMAIL': 'The email you are trying to use is invalid',
    'ERROR_EMAIL_ALREADY_IN_USE': 'The email already exists',
    'ERROR_WRONG_PASSWORD': 'Wrong password, try again',
    'ERROR_USER_NOT_FOUND': 'User not found',
    'ERROR_USER_DISABLED': 'The user you are trying to use is disabled',
    'ERROR_TOO_MANY_REQUESTS': 'Too many submissions were received, try again',
    'ERROR_OPERATION_NOT_ALLOWED': 'Action requested is not allowed',
  };
}
