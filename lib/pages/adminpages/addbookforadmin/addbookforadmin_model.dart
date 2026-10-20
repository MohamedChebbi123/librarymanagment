import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'addbookforadmin_widget.dart' show AddbookforadminWidget;
import 'package:flutter/material.dart';

class AddbookforadminModel extends FlutterFlowModel<AddbookforadminWidget> {
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
      return FFLocalizations.of(context).getText(
        'mmgvo4r3' /* Enter the book title */,
      );
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
      return FFLocalizations.of(context).getText(
        'javw65mj' /* Enter the ISBN */,
      );
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
      return FFLocalizations.of(context).getText(
        'jqbbnh2f' /* Enter the author */,
      );
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
  // State field(s) for BookPriceField widget.
  FocusNode? bookPriceFieldFocusNode;
  TextEditingController? bookPriceFieldTextController;
  String? Function(BuildContext, String?)?
      bookPriceFieldTextControllerValidator;
  String? _bookPriceFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'up5av81z' /* Enter the price */,
      );
    }

    return null;
  }

  // State field(s) for BookCountField widget.
  FocusNode? bookCountFieldFocusNode;
  TextEditingController? bookCountFieldTextController;
  String? Function(BuildContext, String?)?
      bookCountFieldTextControllerValidator;
  String? _bookCountFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ejrb40jt' /* Enter the number of copies */,
      );
    }

    return null;
  }

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
    bookPriceFieldTextControllerValidator =
        _bookPriceFieldTextControllerValidator;
    bookCountFieldTextControllerValidator =
        _bookCountFieldTextControllerValidator;
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

    bookPriceFieldFocusNode?.dispose();
    bookPriceFieldTextController?.dispose();

    bookCountFieldFocusNode?.dispose();
    bookCountFieldTextController?.dispose();
  }
}
