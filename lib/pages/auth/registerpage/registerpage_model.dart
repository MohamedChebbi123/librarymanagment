import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'registerpage_widget.dart' show RegisterpageWidget;
import 'package:flutter/material.dart';

class RegisterpageModel extends FlutterFlowModel<RegisterpageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for UsernameField widget.
  FocusNode? usernameFieldFocusNode;
  TextEditingController? usernameFieldTextController;
  String? Function(BuildContext, String?)? usernameFieldTextControllerValidator;
  String? _usernameFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'jw8mwvwx' /* Enter a username */,
      );
    }

    if (val.length < 3) {
      return FFLocalizations.of(context).getText(
        '22zu9qy4' /* Username must have at least 3 ... */,
      );
    }

    return null;
  }

  // State field(s) for EmailField widget.
  FocusNode? emailFieldFocusNode;
  TextEditingController? emailFieldTextController;
  String? Function(BuildContext, String?)? emailFieldTextControllerValidator;
  String? _emailFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'j0b5g887' /* Enter your email address */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'suhr81va' /* Enter a valid email address */,
      );
    }
    return null;
  }

  // State field(s) for PhoneField widget.
  FocusNode? phoneFieldFocusNode;
  TextEditingController? phoneFieldTextController;
  String? Function(BuildContext, String?)? phoneFieldTextControllerValidator;
  String? _phoneFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '72to9d7t' /* Enter your phone number */,
      );
    }

    if (val.length < 8) {
      return FFLocalizations.of(context).getText(
        'ogod5fve' /* Enter a valid phone number */,
      );
    }

    return null;
  }

  // State field(s) for PasswordField widget.
  FocusNode? passwordFieldFocusNode;
  TextEditingController? passwordFieldTextController;
  late bool passwordFieldVisibility;
  String? Function(BuildContext, String?)? passwordFieldTextControllerValidator;
  String? _passwordFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'euafthya' /* Enter a password */,
      );
    }

    if (val.length < 6) {
      return FFLocalizations.of(context).getText(
        'gvpnygp0' /* Password must have at least 6 ... */,
      );
    }

    return null;
  }

  // State field(s) for LanguageField widget.
  String? languageFieldValue;
  FormFieldController<String>? languageFieldValueController;

  @override
  void initState(BuildContext context) {
    usernameFieldTextControllerValidator =
        _usernameFieldTextControllerValidator;
    emailFieldTextControllerValidator = _emailFieldTextControllerValidator;
    phoneFieldTextControllerValidator = _phoneFieldTextControllerValidator;
    passwordFieldVisibility = false;
    passwordFieldTextControllerValidator =
        _passwordFieldTextControllerValidator;
  }

  @override
  void dispose() {
    usernameFieldFocusNode?.dispose();
    usernameFieldTextController?.dispose();

    emailFieldFocusNode?.dispose();
    emailFieldTextController?.dispose();

    phoneFieldFocusNode?.dispose();
    phoneFieldTextController?.dispose();

    passwordFieldFocusNode?.dispose();
    passwordFieldTextController?.dispose();
  }
}
