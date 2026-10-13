import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'bowsebooksforadmin_widget.dart' show BowsebooksforadminWidget;
import 'package:flutter/material.dart';

class BowsebooksforadminModel
    extends FlutterFlowModel<BowsebooksforadminWidget> {
  ///  Local state fields for this page.

  List<BooksRow> bookRows = [];
  void addToBookRows(BooksRow item) => bookRows.add(item);
  void removeFromBookRows(BooksRow item) => bookRows.remove(item);
  void removeAtIndexFromBookRows(int index) => bookRows.removeAt(index);
  void insertAtIndexInBookRows(int index, BooksRow item) =>
      bookRows.insert(index, item);
  void updateBookRowsAtIndex(int index, Function(BooksRow) updateFn) =>
      bookRows[index] = updateFn(bookRows[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in bowsebooksforadmin widget.
  List<BooksRow>? loadedBooks;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
