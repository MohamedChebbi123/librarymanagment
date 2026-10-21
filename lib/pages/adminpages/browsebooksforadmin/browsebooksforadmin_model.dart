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

  bool? isLoading = false;

  bool? hasMore = false;

  List<BooksRow> allRows = [];
  void addToAllRows(BooksRow item) => allRows.add(item);
  void removeFromAllRows(BooksRow item) => allRows.remove(item);
  void removeAtIndexFromAllRows(int index) => allRows.removeAt(index);
  void insertAtIndexInAllRows(int index, BooksRow item) =>
      allRows.insert(index, item);
  void updateAllRowsAtIndex(int index, Function(BooksRow) updateFn) =>
      allRows[index] = updateFn(allRows[index]);

  int? pageIndex = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in browsebooksforadmin widget.
  List<BooksRow>? pagedFirstLoad;
  // State field(s) for BookSearchField widget.
  FocusNode? bookSearchFieldFocusNode;
  TextEditingController? bookSearchFieldTextController;
  String? Function(BuildContext, String?)?
      bookSearchFieldTextControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in BookSearchField widget.
  List<BooksRow>? pagedSearch;
  // Stores action output result for [Backend Call - Query Rows] action in CategoryChip0Off widget.
  List<BooksRow>? pagedChip0;
  // Stores action output result for [Backend Call - Query Rows] action in CategoryChip1Off widget.
  List<BooksRow>? pagedChip1;
  // Stores action output result for [Backend Call - Query Rows] action in CategoryChip2Off widget.
  List<BooksRow>? pagedChip2;
  // Stores action output result for [Backend Call - Query Rows] action in CategoryChip3Off widget.
  List<BooksRow>? pagedChip3;
  // Stores action output result for [Backend Call - Query Rows] action in CategoryChip4Off widget.
  List<BooksRow>? pagedChip4;
  // Stores action output result for [Backend Call - Query Rows] action in CategoryChip5Off widget.
  List<BooksRow>? pagedChip5;
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
