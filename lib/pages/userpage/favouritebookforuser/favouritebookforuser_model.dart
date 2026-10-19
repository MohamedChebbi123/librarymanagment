import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'favouritebookforuser_widget.dart' show FavouritebookforuserWidget;
import 'package:flutter/material.dart';

class FavouritebookforuserModel
    extends FlutterFlowModel<FavouritebookforuserWidget> {
  ///  Local state fields for this page.

  List<BooksRow> bookRows = [];
  void addToBookRows(BooksRow item) => bookRows.add(item);
  void removeFromBookRows(BooksRow item) => bookRows.remove(item);
  void removeAtIndexFromBookRows(int index) => bookRows.removeAt(index);
  void insertAtIndexInBookRows(int index, BooksRow item) =>
      bookRows.insert(index, item);
  void updateBookRowsAtIndex(int index, Function(BooksRow) updateFn) =>
      bookRows[index] = updateFn(bookRows[index]);

  List<FavoritesRow> favoriteRows = [];
  void addToFavoriteRows(FavoritesRow item) => favoriteRows.add(item);
  void removeFromFavoriteRows(FavoritesRow item) => favoriteRows.remove(item);
  void removeAtIndexFromFavoriteRows(int index) => favoriteRows.removeAt(index);
  void insertAtIndexInFavoriteRows(int index, FavoritesRow item) =>
      favoriteRows.insert(index, item);
  void updateFavoriteRowsAtIndex(int index, Function(FavoritesRow) updateFn) =>
      favoriteRows[index] = updateFn(favoriteRows[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in favouritebookforuser widget.
  List<FavoritesRow>? loadedFavRows;
  // Stores action output result for [Backend Call - Query Rows] action in favouritebookforuser widget.
  List<BooksRow>? loadedFavBooks;
  // Stores action output result for [Backend Call - Delete Row(s)] action in FavFavOnButton widget.
  List<FavoritesRow>? rows;
  // Stores action output result for [Backend Call - Query Rows] action in FavFavOnButton widget.
  List<FavoritesRow>? favFavReload;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
