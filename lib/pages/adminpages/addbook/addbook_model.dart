import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'addbook_widget.dart' show AddbookWidget;
import 'package:flutter/material.dart';

class AddbookModel extends FlutterFlowModel<AddbookWidget> {
  ///  Local state fields for this page.

  int? publishYear;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for BookTitleField widget.
  FocusNode? bookTitleFieldFocusNode;
  TextEditingController? bookTitleFieldTextController;
  String? Function(BuildContext, String?)?
      bookTitleFieldTextControllerValidator;
  String? _bookTitleFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter the book title';
    }

    return null;
  }

  // State field(s) for BookIsbnField widget.
  FocusNode? bookIsbnFieldFocusNode;
  TextEditingController? bookIsbnFieldTextController;
  String? Function(BuildContext, String?)? bookIsbnFieldTextControllerValidator;
  String? _bookIsbnFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter the ISBN';
    }

    return null;
  }

  // State field(s) for BookAuthorField widget.
  FocusNode? bookAuthorFieldFocusNode;
  TextEditingController? bookAuthorFieldTextController;
  String? Function(BuildContext, String?)?
      bookAuthorFieldTextControllerValidator;
  String? _bookAuthorFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter the author';
    }

    return null;
  }

  // State field(s) for BookCategoryField widget.
  String? bookCategoryFieldValue;
  FormFieldController<String>? bookCategoryFieldValueController;
  // State field(s) for BookDescriptionField widget.
  FocusNode? bookDescriptionFieldFocusNode;
  TextEditingController? bookDescriptionFieldTextController;
  String? Function(BuildContext, String?)?
      bookDescriptionFieldTextControllerValidator;
  // State field(s) for BookCoverUrlField widget.
  FocusNode? bookCoverUrlFieldFocusNode;
  TextEditingController? bookCoverUrlFieldTextController;
  String? Function(BuildContext, String?)?
      bookCoverUrlFieldTextControllerValidator;
  // State field(s) for BookPublishYearField widget.
  FocusNode? bookPublishYearFieldFocusNode;
  TextEditingController? bookPublishYearFieldTextController;
  String? Function(BuildContext, String?)?
      bookPublishYearFieldTextControllerValidator;
  // Stores action output result for [Backend Call - Insert Row] action in AddBookButton widget.
  BooksRow? rows;

  @override
  void initState(BuildContext context) {
    bookTitleFieldTextControllerValidator =
        _bookTitleFieldTextControllerValidator;
    bookIsbnFieldTextControllerValidator =
        _bookIsbnFieldTextControllerValidator;
    bookAuthorFieldTextControllerValidator =
        _bookAuthorFieldTextControllerValidator;
  }

  @override
  void dispose() {
    bookTitleFieldFocusNode?.dispose();
    bookTitleFieldTextController?.dispose();

    bookIsbnFieldFocusNode?.dispose();
    bookIsbnFieldTextController?.dispose();

    bookAuthorFieldFocusNode?.dispose();
    bookAuthorFieldTextController?.dispose();

    bookDescriptionFieldFocusNode?.dispose();
    bookDescriptionFieldTextController?.dispose();

    bookCoverUrlFieldFocusNode?.dispose();
    bookCoverUrlFieldTextController?.dispose();

    bookPublishYearFieldFocusNode?.dispose();
    bookPublishYearFieldTextController?.dispose();
  }
}
