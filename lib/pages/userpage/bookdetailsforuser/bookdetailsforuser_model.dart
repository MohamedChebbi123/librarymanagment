import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'bookdetailsforuser_widget.dart' show BookdetailsforuserWidget;
import 'package:flutter/material.dart';

class BookdetailsforuserModel
    extends FlutterFlowModel<BookdetailsforuserWidget> {
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

  // Stores action output result for [Backend Call - Query Rows] action in bookdetailsforuser widget.
  List<BooksRow>? loadedDetailBook;
  // Stores action output result for [Backend Call - Query Rows] action in bookdetailsforuser widget.
  List<FavoritesRow>? loadedDetailFavs;
  // Stores action output result for [Backend Call - Insert Row] action in UserBookDetailsBuyButton widget.
  BoughtBooksRow? rows;
  // Stores action output result for [Backend Call - Update Row(s)] action in UserBookDetailsBuyButton widget.
  List<BooksRow>? rows2;
  // Stores action output result for [Backend Call - Query Rows] action in UserBookDetailsBuyButton widget.
  List<BooksRow>? detailBookAfterBuy;
  // Stores action output result for [Backend Call - Insert Row] action in UserBookDetailsFavAddButton widget.
  FavoritesRow? rows3;
  // Stores action output result for [Backend Call - Query Rows] action in UserBookDetailsFavAddButton widget.
  List<FavoritesRow>? detailFavsAfterAdd;
  // Stores action output result for [Backend Call - Delete Row(s)] action in UserBookDetailsFavRemoveButton widget.
  List<FavoritesRow>? rows4;
  // Stores action output result for [Backend Call - Query Rows] action in UserBookDetailsFavRemoveButton widget.
  List<FavoritesRow>? detailFavsAfterRemove;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
