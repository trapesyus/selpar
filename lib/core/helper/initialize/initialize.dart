import 'package:flutter/material.dart';

class Initialize {
  Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
  }
}
