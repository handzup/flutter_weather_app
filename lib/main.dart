import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'internal/application.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(Application());
}
