import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// TODO (docs)
extension ExtWidget on Widget {
  Widget onTap(GestureTapCallback callback) {
    return GestureDetector(onTap: callback, child: this);
  }
}

extension ExtTextSpan on TextSpan {
  TextSpan onTap(GestureTapCallback callback) {
    return TextSpan(
      text: text,
      style: style,
      children: children,
      recognizer: TapGestureRecognizer()..onTap = callback,
    );
  }
}
