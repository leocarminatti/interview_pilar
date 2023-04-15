import 'package:interview_pilar/app/app_widget.dart';
import 'package:interview_pilar/locator.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();

  runApp(const App());
}
