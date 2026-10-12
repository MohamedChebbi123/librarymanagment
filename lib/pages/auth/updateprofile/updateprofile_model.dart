import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'updateprofile_widget.dart' show UpdateprofileWidget;
import 'package:flutter/material.dart';

class UpdateprofileModel extends FlutterFlowModel<UpdateprofileWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for ProfileUsernameField widget.
  FocusNode? profileUsernameFieldFocusNode;
  TextEditingController? profileUsernameFieldTextController;
  String? Function(BuildContext, String?)?
      profileUsernameFieldTextControllerValidator;
  String? _profileUsernameFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter your username';
    }

    if (val.length < 3) {
      return 'Username must have at least 3 characters';
    }

    return null;
  }

  // State field(s) for ProfilePhoneField widget.
  FocusNode? profilePhoneFieldFocusNode;
  TextEditingController? profilePhoneFieldTextController;
  String? Function(BuildContext, String?)?
      profilePhoneFieldTextControllerValidator;
  String? _profilePhoneFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter your phone number';
    }

    if (val.length < 8) {
      return 'Enter a valid phone number';
    }

    return null;
  }

  // State field(s) for ProfileLanguageField widget.
  String? profileLanguageFieldValue;
  FormFieldController<String>? profileLanguageFieldValueController;
  // State field(s) for ProfilePasswordField widget.
  FocusNode? profilePasswordFieldFocusNode;
  TextEditingController? profilePasswordFieldTextController;
  late bool profilePasswordFieldVisibility;
  String? Function(BuildContext, String?)?
      profilePasswordFieldTextControllerValidator;
  // Stores action output result for [Backend Call - Update Row(s)] action in SaveProfileButton widget.
  List<UsersRow>? rows;

  @override
  void initState(BuildContext context) {
    profileUsernameFieldTextControllerValidator =
        _profileUsernameFieldTextControllerValidator;
    profilePhoneFieldTextControllerValidator =
        _profilePhoneFieldTextControllerValidator;
    profilePasswordFieldVisibility = false;
  }

  @override
  void dispose() {
    profileUsernameFieldFocusNode?.dispose();
    profileUsernameFieldTextController?.dispose();

    profilePhoneFieldFocusNode?.dispose();
    profilePhoneFieldTextController?.dispose();

    profilePasswordFieldFocusNode?.dispose();
    profilePasswordFieldTextController?.dispose();
  }
}
