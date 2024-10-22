import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loyalty_card_web_app/src/common/firebase_options.dart';

import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(const MainApp());
}
