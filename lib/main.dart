import 'dart:io';

import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:nrbtv/src/ui/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Stripe.publishableKey =
  //     "pk_test_51P07tbGCHxnGqewS4PNwuO0Hv48LngXBCgMjUXGtvbrdR01hIbdTIC7AAfW6raprdPhj6ZVl7eJxkDlfSqfknq6F00y99vHAq8";
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

// TODO: Remove it for production CODE !!!
  HttpOverrides.global = AppHttpOverrides();

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  runApp(const App());
}

// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(
//   RemoteMessage message,
// ) async {
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );

//   // unawaited(firebaseService.showNotification(message));
// }
