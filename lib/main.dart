import 'dart:io';

import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:nrbtv/src/ui/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

// TODO: Remove it for production CODE !!!
  HttpOverrides.global = AppHttpOverrides();

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  runApp(const App());
}

// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(
//   RemoteMessage message,1
// ) async {
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );

//   // unawaited(firebaseService.showNotification(message));
// }
