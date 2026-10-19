import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'browsebooksforuser_model.dart';
export 'browsebooksforuser_model.dart';

class BrowsebooksforuserWidget extends StatefulWidget {
  const BrowsebooksforuserWidget({super.key});

  static String routeName = 'browsebooksforuser';
  static String routePath = '/browsebooksforuser';

  @override
  State<BrowsebooksforuserWidget> createState() =>
      _BrowsebooksforuserWidgetState();
}

class _BrowsebooksforuserWidgetState extends State<BrowsebooksforuserWidget> {
  late BrowsebooksforuserModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BrowsebooksforuserModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.loadedUserBooks = await BooksTable().queryRows(
        queryFn: (q) => q.order('created_at', ascending: true),
      );
      _model.bookRows = _model.loadedUserBooks!.toList().cast<BooksRow>();
      safeSetState(() {});
      _model.loadedUserFavorites = await FavoritesTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'user_id',
          currentUserUid,
        ),
      );
      _model.favoriteRows =
          _model.loadedUserFavorites!.toList().cast<FavoritesRow>();
      safeSetState(() {});
    });

    _model.userBookSearchFieldTextController ??= TextEditingController();
    _model.userBookSearchFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            buttonSize: 40.0,
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 24.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Books',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.playfairDisplay(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          actions: [
            FlutterFlowIconButton(
              buttonSize: 40.0,
              icon: Icon(
                Icons.favorite,
                color: Colors.white,
                size: 24.0,
              ),
              onPressed: () async {
                context.pushNamed(FavouritebookforuserWidget.routeName);
              },
            ),
          ],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                  child: TextFormField(
                    controller: _model.userBookSearchFieldTextController,
                    focusNode: _model.userBookSearchFieldFocusNode,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.userBookSearchFieldTextController',
                      Duration(milliseconds: 2000),
                      () async {
                        _model.searchQuery =
                            _model.userBookSearchFieldTextController.text;
                        safeSetState(() {});
                      },
                    ),
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Search by title, author or category',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      filled: true,
                      prefixIcon: Icon(
                        Icons.search,
                      ),
                    ),
                    style: TextStyle(),
                    validator: _model.userBookSearchFieldTextControllerValidator
                        .asValidator(context),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment:
                          (FFMainAxisAlignment.start).flutterValue,
                      crossAxisAlignment:
                          (FFCrossAxisAlignment.center).flutterValue,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        if (_model.categoryFilter == 'All')
                          FFButtonWidget(
                            onPressed: () {
                              print('UserCategoryChip0On pressed ...');
                            },
                            text: 'All',
                            options: FFButtonOptions(
                              height: 36.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: TextStyle(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                        if (!(_model.categoryFilter == 'All'))
                          FFButtonWidget(
                            onPressed: () async {
                              _model.categoryFilter = 'All';
                              safeSetState(() {});
                            },
                            text: 'All',
                            options: FFButtonOptions(
                              height: 36.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Colors.transparent,
                              textStyle: TextStyle(
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                        if (_model.categoryFilter == 'Informatique')
                          FFButtonWidget(
                            onPressed: () {
                              print('UserCategoryChip1On pressed ...');
                            },
                            text: 'Informatique',
                            options: FFButtonOptions(
                              height: 36.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: TextStyle(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                        if (!(_model.categoryFilter == 'Informatique'))
                          FFButtonWidget(
                            onPressed: () async {
                              _model.categoryFilter = 'Informatique';
                              safeSetState(() {});
                            },
                            text: 'Informatique',
                            options: FFButtonOptions(
                              height: 36.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Colors.transparent,
                              textStyle: TextStyle(
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                        if (_model.categoryFilter == 'Sciences')
                          FFButtonWidget(
                            onPressed: () {
                              print('UserCategoryChip2On pressed ...');
                            },
                            text: 'Sciences',
                            options: FFButtonOptions(
                              height: 36.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: TextStyle(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                        if (!(_model.categoryFilter == 'Sciences'))
                          FFButtonWidget(
                            onPressed: () async {
                              _model.categoryFilter = 'Sciences';
                              safeSetState(() {});
                            },
                            text: 'Sciences',
                            options: FFButtonOptions(
                              height: 36.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Colors.transparent,
                              textStyle: TextStyle(
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                        if (_model.categoryFilter == 'Littérature')
                          FFButtonWidget(
                            onPressed: () {
                              print('UserCategoryChip3On pressed ...');
                            },
                            text: 'Littérature',
                            options: FFButtonOptions(
                              height: 36.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: TextStyle(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                        if (!(_model.categoryFilter == 'Littérature'))
                          FFButtonWidget(
                            onPressed: () async {
                              _model.categoryFilter = 'Littérature';
                              safeSetState(() {});
                            },
                            text: 'Littérature',
                            options: FFButtonOptions(
                              height: 36.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Colors.transparent,
                              textStyle: TextStyle(
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                        if (_model.categoryFilter == 'Histoire')
                          FFButtonWidget(
                            onPressed: () {
                              print('UserCategoryChip4On pressed ...');
                            },
                            text: 'Histoire',
                            options: FFButtonOptions(
                              height: 36.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: TextStyle(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                        if (!(_model.categoryFilter == 'Histoire'))
                          FFButtonWidget(
                            onPressed: () async {
                              _model.categoryFilter = 'Histoire';
                              safeSetState(() {});
                            },
                            text: 'Histoire',
                            options: FFButtonOptions(
                              height: 36.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Colors.transparent,
                              textStyle: TextStyle(
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                        if (_model.categoryFilter == 'Économie')
                          FFButtonWidget(
                            onPressed: () {
                              print('UserCategoryChip5On pressed ...');
                            },
                            text: 'Économie',
                            options: FFButtonOptions(
                              height: 36.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: TextStyle(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                        if (!(_model.categoryFilter == 'Économie'))
                          FFButtonWidget(
                            onPressed: () async {
                              _model.categoryFilter = 'Économie';
                              safeSetState(() {});
                            },
                            text: 'Économie',
                            options: FFButtonOptions(
                              height: 36.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Colors.transparent,
                              textStyle: TextStyle(
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                      ].divide(SizedBox(width: 8.0)),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Builder(
                    builder: (context) {
                      final bookRow = _model.bookRows.toList();

                      return ListView.separated(
                        padding: EdgeInsets.zero,
                        primary: false,
                        scrollDirection: Axis.vertical,
                        itemCount: bookRow.length,
                        separatorBuilder: (_, __) => SizedBox(height: 0.0),
                        itemBuilder: (context, bookRowIndex) {
                          final bookRowItem = bookRow[bookRowIndex];
                          return Visibility(
                            visible: ((String? f, String? q, String? t,
                                        String? a, String? c) {
                                  return ((f ?? 'All') == 'All' || f == c) &&
                                      ((q ?? '').trim().isEmpty ||
                                          [t, a, c].any((s) => (s ?? '')
                                              .toLowerCase()
                                              .contains((q ?? '')
                                                  .trim()
                                                  .toLowerCase())));
                                }(
                                    _model.categoryFilter,
                                    _model.searchQuery,
                                    bookRowItem.title,
                                    bookRowItem.author,
                                    bookRowItem.category)) ??
                                true,
                            child: Container(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 12.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 16.0,
                                        color: Color(0x12000000),
                                        offset: Offset(
                                          0.0,
                                          6.0,
                                        ),
                                        spreadRadius: 0.0,
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(16.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          (FFMainAxisAlignment.start)
                                              .flutterValue,
                                      crossAxisAlignment:
                                          (FFCrossAxisAlignment.start)
                                              .flutterValue,
                                      textBaseline: TextBaseline.alphabetic,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Color(0x1F1B4D3E),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: CachedNetworkImage(
                                              fadeInDuration:
                                                  Duration(milliseconds: 500),
                                              fadeOutDuration:
                                                  Duration(milliseconds: 500),
                                              imageUrl: ((String? v) {
                                                return (v ?? '');
                                              }(bookRowItem.coverUrl)),
                                              width: 60.0,
                                              height: 90.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                (FFMainAxisAlignment.start)
                                                    .flutterValue,
                                            crossAxisAlignment:
                                                (FFCrossAxisAlignment.start)
                                                    .flutterValue,
                                            textBaseline:
                                                TextBaseline.alphabetic,
                                            children: [
                                              Text(
                                                bookRowItem.title,
                                                maxLines: 2,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontStyle,
                                                        ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Text(
                                                ((String? v) {
                                                  return (v ?? '').isEmpty
                                                      ? 'Unknown author'
                                                      : v!;
                                                }(bookRowItem.author)),
                                                maxLines: 1,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Text(
                                                ((String? v) {
                                                  return (v ?? '').isEmpty
                                                      ? 'Uncategorized'
                                                      : v!;
                                                }(bookRowItem.category)),
                                                maxLines: 1,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .labelMedium
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontStyle,
                                                    ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Text(
                                                ((String? v) {
                                                  return (v ?? '').isEmpty
                                                      ? 'No description available.'
                                                      : v!;
                                                }(bookRowItem.description)),
                                                maxLines: 2,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodySmall
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .fontStyle,
                                                    ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ].divide(SizedBox(height: 4.0)),
                                          ),
                                        ),
                                        if (((List<FavoritesRow>? r, int? id) {
                                              return (r ?? [])
                                                  .any((f) => f.bookId == id);
                                            }(_model.favoriteRows.toList(),
                                                bookRowItem.id)) ??
                                            true)
                                          FlutterFlowIconButton(
                                            buttonSize: 42.0,
                                            icon: Icon(
                                              Icons.favorite,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              size: 26.0,
                                            ),
                                            onPressed: () async {
                                              await FavoritesTable().delete(
                                                matchingRows: (rows) => rows
                                                    .eqOrNull(
                                                      'user_id',
                                                      currentUserUid,
                                                    )
                                                    .eqOrNull(
                                                      'book_id',
                                                      bookRowItem.id,
                                                    ),
                                              );
                                              _model.userFavReload =
                                                  await FavoritesTable()
                                                      .queryRows(
                                                queryFn: (q) => q.eqOrNull(
                                                  'user_id',
                                                  currentUserUid,
                                                ),
                                              );
                                              _model.favoriteRows = _model
                                                  .userFavReload!
                                                  .toList()
                                                  .cast<FavoritesRow>();
                                              safeSetState(() {});
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Removed from favourites',
                                                    style: TextStyle(),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                ),
                                              );

                                              safeSetState(() {});
                                            },
                                          ),
                                        if (!((List<FavoritesRow>? r, int? id) {
                                          return (r ?? [])
                                              .any((f) => f.bookId == id);
                                        }(_model.favoriteRows.toList(),
                                            bookRowItem.id)))
                                          FlutterFlowIconButton(
                                            buttonSize: 42.0,
                                            icon: Icon(
                                              Icons.favorite_border,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 26.0,
                                            ),
                                            onPressed: () async {
                                              _model.rows2 =
                                                  await FavoritesTable()
                                                      .insert({
                                                'user_id': currentUserUid,
                                                'book_id': bookRowItem.id,
                                              });
                                              _model.userFavReload2 =
                                                  await FavoritesTable()
                                                      .queryRows(
                                                queryFn: (q) => q.eqOrNull(
                                                  'user_id',
                                                  currentUserUid,
                                                ),
                                              );
                                              _model.favoriteRows = _model
                                                  .userFavReload2!
                                                  .toList()
                                                  .cast<FavoritesRow>();
                                              safeSetState(() {});
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Added to favourites',
                                                    style: TextStyle(),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                ),
                                              );

                                              safeSetState(() {});
                                            },
                                          ),
                                      ].divide(SizedBox(width: 16.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
