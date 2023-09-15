import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logic_app/app.dart';
import 'package:logic_app/utils/dev_http_overrides.dart';

void main() {
  HttpOverrides.global = DevHttpOverrides();
  runApp(const ProviderScope(child: App()));
}
