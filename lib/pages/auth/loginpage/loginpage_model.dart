import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'loginpage_widget.dart' show LoginpageWidget;
import 'package:flutter/material.dart';

class LoginpageModel extends FlutterFlowModel<LoginpageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for LoginEmailField widget.
  FocusNode? loginEmailFieldFocusNode;
  TextEditingController? loginEmailFieldTextController;
  String? Function(BuildContext, String?)?
      loginEmailFieldTextControllerValidator;
  String? _loginEmailFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter your email address';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  // State field(s) for LoginPasswordField widget.
  FocusNode? loginPasswordFieldFocusNode;
  TextEditingController? loginPasswordFieldTextController;
  late bool loginPasswordFieldVisibility;
  String? Function(BuildContext, String?)?
      loginPasswordFieldTextControllerValidator;
  String? _loginPasswordFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter your password';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Query Rows] action in LoginButton widget.
  List<UsersRow>? userData;

  @override
  void initState(BuildContext context) {
    loginEmailFieldTextControllerValidator =
        _loginEmailFieldTextControllerValidator;
    loginPasswordFieldVisibility = false;
    loginPasswordFieldTextControllerValidator =
        _loginPasswordFieldTextControllerValidator;
  }

  @override
  void dispose() {
    loginEmailFieldFocusNode?.dispose();
    loginEmailFieldTextController?.dispose();

    loginPasswordFieldFocusNode?.dispose();
    loginPasswordFieldTextController?.dispose();
  }
}
