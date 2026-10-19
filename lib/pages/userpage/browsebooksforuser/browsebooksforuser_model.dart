import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'browsebooksforuser_widget.dart' show BrowsebooksforuserWidget;
import 'package:flutter/material.dart';

class BrowsebooksforuserModel
    extends FlutterFlowModel<BrowsebooksforuserWidget> {
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

  // Stores action output result for [Backend Call - Query Rows] action in browsebooksforuser widget.
  List<BooksRow>? loadedUserBooks;
  // State field(s) for UserBookSearchField widget.
  FocusNode? userBookSearchFieldFocusNode;
  TextEditingController? userBookSearchFieldTextController;
  String? Function(BuildContext, String?)?
      userBookSearchFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    userBookSearchFieldFocusNode?.dispose();
    userBookSearchFieldTextController?.dispose();
  }
}
