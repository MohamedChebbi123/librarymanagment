import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'bookdetailsforadmin_widget.dart' show BookdetailsforadminWidget;
import 'package:flutter/material.dart';

class BookdetailsforadminModel
    extends FlutterFlowModel<BookdetailsforadminWidget> {
  ///  Local state fields for this page.

  int? bookCount = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Update Row(s)] action in AdminStockMinusButton widget.
  List<BooksRow>? rows2;
  // Stores action output result for [Backend Call - Update Row(s)] action in AdminStockPlusButton widget.
  List<BooksRow>? rows3;
  // Stores action output result for [Backend Call - Delete Row(s)] action in BookDetailsDeleteButton widget.
  List<BooksRow>? rows;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
