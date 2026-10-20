import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'browsebooksforadmin_widget.dart' show BrowsebooksforadminWidget;
import 'package:flutter/material.dart';

class BrowsebooksforadminModel
    extends FlutterFlowModel<BrowsebooksforadminWidget> {
  ///  Local state fields for this page.

  List<BooksRow> bookRows = [];
  void addToBookRows(BooksRow item) => bookRows.add(item);
  void removeFromBookRows(BooksRow item) => bookRows.remove(item);
  void removeAtIndexFromBookRows(int index) => bookRows.removeAt(index);
  void insertAtIndexInBookRows(int index, BooksRow item) =>
      bookRows.insert(index, item);
  void updateBookRowsAtIndex(int index, Function(BooksRow) updateFn) =>
      bookRows[index] = updateFn(bookRows[index]);

  String? searchQuery = '';

  String? categoryFilter = 'All';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in browsebooksforadmin widget.
  List<BooksRow>? orderedBooks;
  // State field(s) for BookSearchField widget.
  FocusNode? bookSearchFieldFocusNode;
  TextEditingController? bookSearchFieldTextController;
  String? Function(BuildContext, String?)?
      bookSearchFieldTextControllerValidator;
  // Stores action output result for [Backend Call - Update Row(s)] action in BookStockMinusButton widget.
  List<BooksRow>? rows;
  // Stores action output result for [Backend Call - Query Rows] action in BookStockMinusButton widget.
  List<BooksRow>? booksAfterMinus;
  // Stores action output result for [Backend Call - Update Row(s)] action in BookStockPlusButton widget.
  List<BooksRow>? rows2;
  // Stores action output result for [Backend Call - Query Rows] action in BookStockPlusButton widget.
  List<BooksRow>? booksAfterPlus;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    bookSearchFieldFocusNode?.dispose();
    bookSearchFieldTextController?.dispose();
  }
}
