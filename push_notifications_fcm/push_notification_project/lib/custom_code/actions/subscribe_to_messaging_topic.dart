// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_messaging/firebase_messaging.dart';

/// Safe to make this function non-blocking
Future subscribeToMessagingTopic(String topic) async {
  try {
    await FirebaseMessaging.instance.subscribeToTopic(topic);
  } catch (e, stacktrace) {
    print(e);
    print(stacktrace);
  }
}
