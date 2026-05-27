import 'package:flutter/material.dart';

extension ExtWidget on Widget {
  Widget onTap(GestureTapCallback callback) {
    return GestureDetector(
      onTap: callback,
      child: this,
    );
  }
}