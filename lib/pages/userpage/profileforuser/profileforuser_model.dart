import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profileforuser_widget.dart' show ProfileforuserWidget;
import 'package:flutter/material.dart';

class ProfileforuserModel extends FlutterFlowModel<ProfileforuserWidget> {
  ///  Local state fields for this page.

  List<UsersRow> profileRows = [];
  void addToProfileRows(UsersRow item) => profileRows.add(item);
  void removeFromProfileRows(UsersRow item) => profileRows.remove(item);
  void removeAtIndexFromProfileRows(int index) => profileRows.removeAt(index);
  void insertAtIndexInProfileRows(int index, UsersRow item) =>
      profileRows.insert(index, item);
  void updateProfileRowsAtIndex(int index, Function(UsersRow) updateFn) =>
      profileRows[index] = updateFn(profileRows[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in profileforuser widget.
  List<UsersRow>? loadedMyProfileRows;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
