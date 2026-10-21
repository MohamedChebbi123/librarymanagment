// Automatic FlutterFlow imports
import '/flutter_flow/ff_builtin_enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import 'package:flutter/material.dart' hide RepeatMode;
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/auth/supabase_auth/auth_util.dart';
import '/flutter_flow/nav/nav.dart';

Future<bool> loginWithEmail(
  BuildContext context,
  String email,
  String password,
) async {
  GoRouter.of(context).prepareAuthEvent();
  final user = await authManager.signInWithEmail(context, email, password);
  return user != null;
}
