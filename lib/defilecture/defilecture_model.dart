import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'defilecture_widget.dart' show DefilectureWidget;
import 'package:flutter/material.dart';

class DefilectureModel extends FlutterFlowModel<DefilectureWidget> {
  ///  Local state fields for this page.

  List<BooksRow> books = [];
  void addToBooks(BooksRow item) => books.add(item);
  void removeFromBooks(BooksRow item) => books.remove(item);
  void removeAtIndexFromBooks(int index) => books.removeAt(index);
  void insertAtIndexInBooks(int index, BooksRow item) =>
      books.insert(index, item);
  void updateBooksAtIndex(int index, Function(BooksRow) updateFn) =>
      books[index] = updateFn(books[index]);

  int? current = -1;

  List<String> options = [];
  void addToOptions(String item) => options.add(item);
  void removeFromOptions(String item) => options.remove(item);
  void removeAtIndexFromOptions(int index) => options.removeAt(index);
  void insertAtIndexInOptions(int index, String item) =>
      options.insert(index, item);
  void updateOptionsAtIndex(int index, Function(String) updateFn) =>
      options[index] = updateFn(options[index]);

  int? correct = -1;

  bool? answered = false;

  int? wrongMask = 0;

  int? score = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in defilecture widget.
  List<BooksRow>? defiBooks;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
