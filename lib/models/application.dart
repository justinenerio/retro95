import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'application.freezed.dart';

@freezed
abstract class Application with _$Application {
  factory Application({
    int processId,
    String processName,
    String label,
    String image,
    bool selected,
    bool maximized,
    bool minimized,
  }) = _Application;
}
