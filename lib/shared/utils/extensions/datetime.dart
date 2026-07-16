extension ExtDatetime on DateTime {
  String toDateString() {
    return '${_getPadded(month)}/${_getPadded(day)}/$year';
  }

  String toTimeString() {
    return '${_getPadded(hour)}:${_getPadded(minute)}';
  }

  String toDateTimeString() {
    return '${toDateString()} - ${toTimeString()}';
  }

  String _getPadded(int val) => val.toString().padLeft(2, '0');
}
