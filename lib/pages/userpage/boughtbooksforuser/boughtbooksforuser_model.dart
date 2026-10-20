import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'boughtbooksforuser_widget.dart' show BoughtbooksforuserWidget;
import 'package:flutter/material.dart';

class BoughtbooksforuserModel
    extends FlutterFlowModel<BoughtbooksforuserWidget> {
  ///  Local state fields for this page.

  List<BoughtBooksRow> boughtRows = [];
  void addToBoughtRows(BoughtBooksRow item) => boughtRows.add(item);
  void removeFromBoughtRows(BoughtBooksRow item) => boughtRows.remove(item);
  void removeAtIndexFromBoughtRows(int index) => boughtRows.removeAt(index);
  void insertAtIndexInBoughtRows(int index, BoughtBooksRow item) =>
      boughtRows.insert(index, item);
  void updateBoughtRowsAtIndex(int index, Function(BoughtBooksRow) updateFn) =>
      boughtRows[index] = updateFn(boughtRows[index]);

  List<BooksRow> bookRows = [];
  void addToBookRows(BooksRow item) => bookRows.add(item);
  void removeFromBookRows(BooksRow item) => bookRows.remove(item);
  void removeAtIndexFromBookRows(int index) => bookRows.removeAt(index);
  void insertAtIndexInBookRows(int index, BooksRow item) =>
      bookRows.insert(index, item);
  void updateBookRowsAtIndex(int index, Function(BooksRow) updateFn) =>
      bookRows[index] = updateFn(bookRows[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in boughtbooksforuser widget.
  List<BoughtBooksRow>? loadedBoughtRows;
  // Stores action output result for [Backend Call - Query Rows] action in boughtbooksforuser widget.
  List<BooksRow>? loadedBoughtBooks;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
