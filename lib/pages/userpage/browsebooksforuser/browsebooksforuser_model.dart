import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'browsebooksforuser_widget.dart' show BrowsebooksforuserWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
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

  List<FavoritesRow> favoriteRows = [];
  void addToFavoriteRows(FavoritesRow item) => favoriteRows.add(item);
  void removeFromFavoriteRows(FavoritesRow item) => favoriteRows.remove(item);
  void removeAtIndexFromFavoriteRows(int index) => favoriteRows.removeAt(index);
  void insertAtIndexInFavoriteRows(int index, FavoritesRow item) =>
      favoriteRows.insert(index, item);
  void updateFavoriteRowsAtIndex(int index, Function(FavoritesRow) updateFn) =>
      favoriteRows[index] = updateFn(favoriteRows[index]);

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

  TutorialCoachMark? browsebookspageController;
  // Stores action output result for [Backend Call - Query Rows] action in browsebooksforuser widget.
  List<BooksRow>? pagedFirstLoad;
  // Stores action output result for [Backend Call - Query Rows] action in browsebooksforuser widget.
  List<FavoritesRow>? loadedUserFavorites;
  // State field(s) for UserBookSearchField widget.
  FocusNode? userBookSearchFieldFocusNode;
  TextEditingController? userBookSearchFieldTextController;
  String? Function(BuildContext, String?)?
      userBookSearchFieldTextControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in UserBookSearchField widget.
  List<BooksRow>? pagedSearch;
  // Stores action output result for [Backend Call - Query Rows] action in UserCategoryChip0Off widget.
  List<BooksRow>? pagedChip0;
  // Stores action output result for [Backend Call - Query Rows] action in UserCategoryChip1Off widget.
  List<BooksRow>? pagedChip1;
  // Stores action output result for [Backend Call - Query Rows] action in UserCategoryChip2Off widget.
  List<BooksRow>? pagedChip2;
  // Stores action output result for [Backend Call - Query Rows] action in UserCategoryChip3Off widget.
  List<BooksRow>? pagedChip3;
  // Stores action output result for [Backend Call - Query Rows] action in UserCategoryChip4Off widget.
  List<BooksRow>? pagedChip4;
  // Stores action output result for [Backend Call - Query Rows] action in UserCategoryChip5Off widget.
  List<BooksRow>? pagedChip5;
  // Stores action output result for [Backend Call - Insert Row] action in UserBookBuyButton widget.
  BoughtBooksRow? rows;
  // Stores action output result for [Backend Call - Update Row(s)] action in UserBookBuyButton widget.
  List<BooksRow>? rows2;
  // Stores action output result for [Backend Call - Query Rows] action in UserBookBuyButton widget.
  List<BooksRow>? booksAfterBuy;
  // Stores action output result for [Backend Call - Delete Row(s)] action in UserBookFavRemoveButton widget.
  List<FavoritesRow>? rows3;
  // Stores action output result for [Backend Call - Query Rows] action in UserBookFavRemoveButton widget.
  List<FavoritesRow>? userFavReload;
  // Stores action output result for [Backend Call - Insert Row] action in UserBookFavAddButton widget.
  FavoritesRow? rows4;
  // Stores action output result for [Backend Call - Query Rows] action in UserBookFavAddButton widget.
  List<FavoritesRow>? userFavReload2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    browsebookspageController?.finish();
    userBookSearchFieldFocusNode?.dispose();
    userBookSearchFieldTextController?.dispose();
  }
}
