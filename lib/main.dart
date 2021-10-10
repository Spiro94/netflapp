import 'package:flutter/material.dart';

import 'app.dart';
import 'core/dependency_injection/dependency_injection.dart';

void main() async {
  await initDependencies();
  runApp(const MyApp());
}
