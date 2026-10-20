import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'favoritebooksforuser_model.dart';
export 'favoritebooksforuser_model.dart';

class FavoritebooksforuserWidget extends StatefulWidget {
  const FavoritebooksforuserWidget({super.key});

  static String routeName = 'favoritebooksforuser';
  static String routePath = '/favoritebooksforuser';

  @override
  State<FavoritebooksforuserWidget> createState() =>
      _FavoritebooksforuserWidgetState();
}

class _FavoritebooksforuserWidgetState
    extends State<FavoritebooksforuserWidget> {
  late FavoritebooksforuserModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FavoritebooksforuserModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.loadedFavRows = await FavoritesTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'user_id',
          currentUserUid,
        ),
      );
      _model.favoriteRows = _model.loadedFavRows!.toList().cast<FavoritesRow>();
      safeSetState(() {});
      _model.loadedFavBooks = await BooksTable().queryRows(
        queryFn: (q) => q.order('created_at', ascending: true),
      );
      _model.bookRows = _model.loadedFavBooks!.toList().cast<BooksRow>();
      safeSetState(() {});
    });
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
            FFLocalizations.of(context).getText(
              '5epqaq6t' /* My favourites */,
            ),
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
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (((List<FavoritesRow>? r) {
                    return (r ?? []).isEmpty;
                  }(_model.favoriteRows.toList())) ??
                  true)
                Container(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 48.0, 24.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment:
                          (FFMainAxisAlignment.start).flutterValue,
                      crossAxisAlignment:
                          (FFCrossAxisAlignment.center).flutterValue,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0x1F1B4D3E),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Icon(
                              Icons.favorite_border,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 40.0,
                            ),
                          ),
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            'ft51ctrm' /* No favourites yet */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    font: GoogleFonts.playfairDisplay(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                  ),
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            'jpiskzld' /* Tap the heart on any book to s... */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                        ),
                        Container(
                          height: 8.0,
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            context
                                .pushNamed(BrowsebooksforuserWidget.routeName);
                          },
                          text: FFLocalizations.of(context).getText(
                            'bekgskpq' /* Browse books */,
                          ),
                          icon: Icon(
                            Icons.library_books,
                            size: 20.0,
                          ),
                          options: FFButtonOptions(
                            height: 52.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconColor: Colors.white,
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: TextStyle(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                        ),
                      ].divide(SizedBox(height: 12.0)),
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
                            visible: ((List<FavoritesRow>? r, int? id) {
                                  return (r ?? []).any((f) => f.bookId == id);
                                }(_model.favoriteRows.toList(),
                                    bookRowItem.id)) ??
                                true,
                            child: Container(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 12.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      BookdetailsforuserWidget.routeName,
                                      queryParameters: {
                                        'bookId': serializeParam(
                                          bookRowItem.id,
                                          ParamType.int,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
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
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
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
                                                  overflow:
                                                      TextOverflow.ellipsis,
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
                                                  overflow:
                                                      TextOverflow.ellipsis,
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
                                                  overflow:
                                                      TextOverflow.ellipsis,
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
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ].divide(SizedBox(height: 4.0)),
                                            ),
                                          ),
                                          if (((List<FavoritesRow>? r,
                                                      int? id) {
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
                                                _model.favFavReload =
                                                    await FavoritesTable()
                                                        .queryRows(
                                                  queryFn: (q) => q.eqOrNull(
                                                    'user_id',
                                                    currentUserUid,
                                                  ),
                                                );
                                                _model.favoriteRows = _model
                                                    .favFavReload!
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
                                        ].divide(SizedBox(width: 16.0)),
                                      ),
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
