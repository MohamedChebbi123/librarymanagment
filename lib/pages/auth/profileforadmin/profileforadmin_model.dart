import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profileforadmin_widget.dart' show ProfileforadminWidget;
import 'package:flutter/material.dart';

class ProfileforadminModel extends FlutterFlowModel<ProfileforadminWidget> {
  ///  Local state fields for this page.

  List<UsersRow> adminRows = [];
  void addToAdminRows(UsersRow item) => adminRows.add(item);
  void removeFromAdminRows(UsersRow item) => adminRows.remove(item);
  void removeAtIndexFromAdminRows(int index) => adminRows.removeAt(index);
  void insertAtIndexInAdminRows(int index, UsersRow item) =>
      adminRows.insert(index, item);
  void updateAdminRowsAtIndex(int index, Function(UsersRow) updateFn) =>
      adminRows[index] = updateFn(adminRows[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in profileforadmin widget.
  List<UsersRow>? loadedAdminRows;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
