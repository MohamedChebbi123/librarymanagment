import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'editprofileforuser_widget.dart' show EditprofileforuserWidget;
import 'package:flutter/material.dart';

class EditprofileforuserModel
    extends FlutterFlowModel<EditprofileforuserWidget> {
  ///  Local state fields for this page.

  List<UsersRow> profileRows = [];
  void addToProfileRows(UsersRow item) => profileRows.add(item);
  void removeFromProfileRows(UsersRow item) => profileRows.remove(item);
  void removeAtIndexFromProfileRows(int index) => profileRows.removeAt(index);
  void insertAtIndexInProfileRows(int index, UsersRow item) =>
      profileRows.insert(index, item);
  void updateProfileRowsAtIndex(int index, Function(UsersRow) updateFn) =>
      profileRows[index] = updateFn(profileRows[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Query Rows] action in editprofileforuser widget.
  List<UsersRow>? loadedProfileRows;
  // State field(s) for UserProfileUsernameField widget.
  FocusNode? userProfileUsernameFieldFocusNode;
  TextEditingController? userProfileUsernameFieldTextController;
  String? Function(BuildContext, String?)?
      userProfileUsernameFieldTextControllerValidator;
  String? _userProfileUsernameFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'fth1y9i3' /* Enter your username */,
      );
    }

    if (val.length < 3) {
      return FFLocalizations.of(context).getText(
        '95g9w7wc' /* Username must have at least 3 ... */,
      );
    }

    return null;
  }

  // State field(s) for UserProfilePhoneField widget.
  FocusNode? userProfilePhoneFieldFocusNode;
  TextEditingController? userProfilePhoneFieldTextController;
  String? Function(BuildContext, String?)?
      userProfilePhoneFieldTextControllerValidator;
  String? _userProfilePhoneFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'vpbhf75g' /* Enter your phone number */,
      );
    }

    if (val.length < 8) {
      return FFLocalizations.of(context).getText(
        'kgb1lrjl' /* Enter a valid phone number */,
      );
    }

    return null;
  }

  // State field(s) for UserProfileLanguageField widget.
  String? userProfileLanguageFieldValue;
  FormFieldController<String>? userProfileLanguageFieldValueController;
  // State field(s) for UserProfilePasswordField widget.
  late FocusNode userProfilePasswordFieldPasswordVisibilityFocusNode;
  FocusNode? userProfilePasswordFieldFocusNode;
  TextEditingController? userProfilePasswordFieldTextController;
  late bool userProfilePasswordFieldVisibility;
  String? Function(BuildContext, String?)?
      userProfilePasswordFieldTextControllerValidator;
  // Stores action output result for [Backend Call - Update Row(s)] action in UserProfileSaveButton widget.
  List<UsersRow>? rows;

  @override
  void initState(BuildContext context) {
    userProfileUsernameFieldTextControllerValidator =
        _userProfileUsernameFieldTextControllerValidator;
    userProfilePhoneFieldTextControllerValidator =
        _userProfilePhoneFieldTextControllerValidator;
    userProfilePasswordFieldPasswordVisibilityFocusNode = FocusNode();
    userProfilePasswordFieldVisibility = false;
  }

  @override
  void dispose() {
    userProfileUsernameFieldFocusNode?.dispose();
    userProfileUsernameFieldTextController?.dispose();

    userProfilePhoneFieldFocusNode?.dispose();
    userProfilePhoneFieldTextController?.dispose();

    userProfilePasswordFieldFocusNode?.dispose();
    userProfilePasswordFieldTextController?.dispose();
    userProfilePasswordFieldPasswordVisibilityFocusNode.dispose();
  }
}
