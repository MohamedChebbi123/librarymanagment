import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'editbookpageforadmin_widget.dart' show EditbookpageforadminWidget;
import 'package:flutter/material.dart';

class EditbookpageforadminModel
    extends FlutterFlowModel<EditbookpageforadminWidget> {
  ///  Local state fields for this page.

  int? publishYear;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for EditBookTitleField widget.
  FocusNode? editBookTitleFieldFocusNode;
  TextEditingController? editBookTitleFieldTextController;
  String? Function(BuildContext, String?)?
      editBookTitleFieldTextControllerValidator;
  String? _editBookTitleFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter the book title';
    }

    return null;
  }

  // State field(s) for EditBookIsbnField widget.
  FocusNode? editBookIsbnFieldFocusNode;
  TextEditingController? editBookIsbnFieldTextController;
  String? Function(BuildContext, String?)?
      editBookIsbnFieldTextControllerValidator;
  String? _editBookIsbnFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter the ISBN';
    }

    return null;
  }

  // State field(s) for EditBookAuthorField widget.
  FocusNode? editBookAuthorFieldFocusNode;
  TextEditingController? editBookAuthorFieldTextController;
  String? Function(BuildContext, String?)?
      editBookAuthorFieldTextControllerValidator;
  String? _editBookAuthorFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter the author';
    }

    return null;
  }

  // State field(s) for EditBookCategoryField widget.
  String? editBookCategoryFieldValue;
  FormFieldController<String>? editBookCategoryFieldValueController;
  // State field(s) for EditBookDescriptionField widget.
  FocusNode? editBookDescriptionFieldFocusNode;
  TextEditingController? editBookDescriptionFieldTextController;
  String? Function(BuildContext, String?)?
      editBookDescriptionFieldTextControllerValidator;
  // State field(s) for EditBookCoverUrlField widget.
  FocusNode? editBookCoverUrlFieldFocusNode;
  TextEditingController? editBookCoverUrlFieldTextController;
  String? Function(BuildContext, String?)?
      editBookCoverUrlFieldTextControllerValidator;
  // State field(s) for EditBookPublishYearField widget.
  FocusNode? editBookPublishYearFieldFocusNode;
  TextEditingController? editBookPublishYearFieldTextController;
  String? Function(BuildContext, String?)?
      editBookPublishYearFieldTextControllerValidator;
  // Stores action output result for [Backend Call - Update Row(s)] action in SaveBookButton widget.
  List<BooksRow>? rows;

  @override
  void initState(BuildContext context) {
    editBookTitleFieldTextControllerValidator =
        _editBookTitleFieldTextControllerValidator;
    editBookIsbnFieldTextControllerValidator =
        _editBookIsbnFieldTextControllerValidator;
    editBookAuthorFieldTextControllerValidator =
        _editBookAuthorFieldTextControllerValidator;
  }

  @override
  void dispose() {
    editBookTitleFieldFocusNode?.dispose();
    editBookTitleFieldTextController?.dispose();

    editBookIsbnFieldFocusNode?.dispose();
    editBookIsbnFieldTextController?.dispose();

    editBookAuthorFieldFocusNode?.dispose();
    editBookAuthorFieldTextController?.dispose();

    editBookDescriptionFieldFocusNode?.dispose();
    editBookDescriptionFieldTextController?.dispose();

    editBookCoverUrlFieldFocusNode?.dispose();
    editBookCoverUrlFieldTextController?.dispose();

    editBookPublishYearFieldFocusNode?.dispose();
    editBookPublishYearFieldTextController?.dispose();
  }
}
