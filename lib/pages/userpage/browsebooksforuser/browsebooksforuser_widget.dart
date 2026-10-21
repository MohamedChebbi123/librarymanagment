import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/walkthroughs/browsebookspage.dart';
import '/index.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
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
      _model.isLoading = true;
      safeSetState(() {});
      _model.pagedFirstLoad = await BooksTable().queryRows(
        queryFn: (q) => q
            .orGroupOrNull(orFilterGroup([
              orFilterLeaf(
                  'title',
                  'ilike',
                  (String? q) {
                    return '%${(q ?? '').trim()}%';
                  }(_model.searchQuery)),
              orFilterLeaf(
                  'author',
                  'ilike',
                  (String? q) {
                    return '%${(q ?? '').trim()}%';
                  }(_model.searchQuery)),
              orFilterLeaf(
                  'category',
                  'ilike',
                  (String? q) {
                    return '%${(q ?? '').trim()}%';
                  }(_model.searchQuery)),
            ], isAnd: false))
            .orGroupOrNull(orFilterGroup([
              orFilterLeaf(
                  'category',
                  'ilike',
                  (String? f) {
                    return (f ?? 'All') == 'All' ? '%' : f!;
                  }(_model.categoryFilter)),
              orFilterLeaf(
                  'title',
                  'ilike',
                  (String? f) {
                    return (f ?? 'All') == 'All' ? '%' : '';
                  }(_model.categoryFilter)),
            ], isAnd: false))
            .order('created_at', ascending: true),
      );
      _model.allRows = _model.pagedFirstLoad!.toList().cast<BooksRow>();
      safeSetState(() {});
      _model.pageIndex = 0;
      safeSetState(() {});
      _model.bookRows = ((List<BooksRow>? a, int? p) {
        return (a ?? []).skip((p ?? 0) * 5).take(5).toList();
      }(_model.allRows.toList(), _model.pageIndex))
          .toList()
          .cast<BooksRow>();
      safeSetState(() {});
      _model.isLoading = false;
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
            FFLocalizations.of(context).getText(
              'rs6m2h3a' /* Books */,
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
          actions: [
            FlutterFlowIconButton(
              buttonSize: 40.0,
              icon: Icon(
                Icons.favorite,
                color: Colors.white,
                size: 24.0,
              ),
              onPressed: () async {
                context.pushNamed(FavoritebooksforuserWidget.routeName);
              },
            ),
            FlutterFlowIconButton(
              buttonSize: 40.0,
              icon: Icon(
                Icons.shopping_bag,
                color: Colors.white,
                size: 24.0,
              ),
              onPressed: () async {
                context.pushNamed(BoughtbooksforuserWidget.routeName);
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
                        _model.isLoading = true;
                        safeSetState(() {});
                        _model.pagedSearch = await BooksTable().queryRows(
                          queryFn: (q) => q
                              .orGroupOrNull(orFilterGroup([
                                orFilterLeaf(
                                    'title',
                                    'ilike',
                                    (String? q) {
                                      return '%${(q ?? '').trim()}%';
                                    }(_model.searchQuery)),
                                orFilterLeaf(
                                    'author',
                                    'ilike',
                                    (String? q) {
                                      return '%${(q ?? '').trim()}%';
                                    }(_model.searchQuery)),
                                orFilterLeaf(
                                    'category',
                                    'ilike',
                                    (String? q) {
                                      return '%${(q ?? '').trim()}%';
                                    }(_model.searchQuery)),
                              ], isAnd: false))
                              .orGroupOrNull(orFilterGroup([
                                orFilterLeaf(
                                    'category',
                                    'ilike',
                                    (String? f) {
                                      return (f ?? 'All') == 'All' ? '%' : f!;
                                    }(_model.categoryFilter)),
                                orFilterLeaf(
                                    'title',
                                    'ilike',
                                    (String? f) {
                                      return (f ?? 'All') == 'All' ? '%' : '';
                                    }(_model.categoryFilter)),
                              ], isAnd: false))
                              .order('created_at', ascending: true),
                        );
                        _model.allRows =
                            _model.pagedSearch!.toList().cast<BooksRow>();
                        safeSetState(() {});
                        _model.pageIndex = 0;
                        safeSetState(() {});
                        _model.bookRows = ((List<BooksRow>? a, int? p) {
                          return (a ?? []).skip((p ?? 0) * 5).take(5).toList();
                        }(_model.allRows.toList(), _model.pageIndex))
                            .toList()
                            .cast<BooksRow>();
                        safeSetState(() {});
                        _model.isLoading = false;
                        safeSetState(() {});

                        safeSetState(() {});
                      },
                    ),
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: FFLocalizations.of(context).getText(
                        '6dk1zq1x' /* Search by title, author or cat... */,
                      ),
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
                  ).addWalkthrough(
                    textFieldMd1bdcpt,
                    _model.browsebookspageController,
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
                            text: FFLocalizations.of(context).getText(
                              'rkskwwyh' /* All */,
                            ),
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
                              _model.isLoading = true;
                              safeSetState(() {});
                              _model.pagedChip0 = await BooksTable().queryRows(
                                queryFn: (q) => q
                                    .orGroupOrNull(orFilterGroup([
                                      orFilterLeaf(
                                          'title',
                                          'ilike',
                                          (String? q) {
                                            return '%${(q ?? '').trim()}%';
                                          }(_model.searchQuery)),
                                      orFilterLeaf(
                                          'author',
                                          'ilike',
                                          (String? q) {
                                            return '%${(q ?? '').trim()}%';
                                          }(_model.searchQuery)),
                                      orFilterLeaf(
                                          'category',
                                          'ilike',
                                          (String? q) {
                                            return '%${(q ?? '').trim()}%';
                                          }(_model.searchQuery)),
                                    ], isAnd: false))
                                    .orGroupOrNull(orFilterGroup([
                                      orFilterLeaf(
                                          'category',
                                          'ilike',
                                          (String? f) {
                                            return (f ?? 'All') == 'All'
                                                ? '%'
                                                : f!;
                                          }(_model.categoryFilter)),
                                      orFilterLeaf(
                                          'title',
                                          'ilike',
                                          (String? f) {
                                            return (f ?? 'All') == 'All'
                                                ? '%'
                                                : '';
                                          }(_model.categoryFilter)),
                                    ], isAnd: false))
                                    .order('created_at', ascending: true),
                              );
                              _model.allRows =
                                  _model.pagedChip0!.toList().cast<BooksRow>();
                              safeSetState(() {});
                              _model.pageIndex = 0;
                              safeSetState(() {});
                              _model.bookRows = ((List<BooksRow>? a, int? p) {
                                return (a ?? [])
                                    .skip((p ?? 0) * 5)
                                    .take(5)
                                    .toList();
                              }(_model.allRows.toList(), _model.pageIndex))
                                  .toList()
                                  .cast<BooksRow>();
                              safeSetState(() {});
                              _model.isLoading = false;
                              safeSetState(() {});

                              safeSetState(() {});
                            },
                            text: FFLocalizations.of(context).getText(
                              'fsbu19re' /* All */,
                            ),
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
                            text: FFLocalizations.of(context).getText(
                              'gbgiri74' /* Informatique */,
                            ),
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
                              _model.isLoading = true;
                              safeSetState(() {});
                              _model.pagedChip1 = await BooksTable().queryRows(
                                queryFn: (q) => q
                                    .orGroupOrNull(orFilterGroup([
                                      orFilterLeaf(
                                          'title',
                                          'ilike',
                                          (String? q) {
                                            return '%${(q ?? '').trim()}%';
                                          }(_model.searchQuery)),
                                      orFilterLeaf(
                                          'author',
                                          'ilike',
                                          (String? q) {
                                            return '%${(q ?? '').trim()}%';
                                          }(_model.searchQuery)),
                                      orFilterLeaf(
                                          'category',
                                          'ilike',
                                          (String? q) {
                                            return '%${(q ?? '').trim()}%';
                                          }(_model.searchQuery)),
                                    ], isAnd: false))
                                    .orGroupOrNull(orFilterGroup([
                                      orFilterLeaf(
                                          'category',
                                          'ilike',
                                          (String? f) {
                                            return (f ?? 'All') == 'All'
                                                ? '%'
                                                : f!;
                                          }(_model.categoryFilter)),
                                      orFilterLeaf(
                                          'title',
                                          'ilike',
                                          (String? f) {
                                            return (f ?? 'All') == 'All'
                                                ? '%'
                                                : '';
                                          }(_model.categoryFilter)),
                                    ], isAnd: false))
                                    .order('created_at', ascending: true),
                              );
                              _model.allRows =
                                  _model.pagedChip1!.toList().cast<BooksRow>();
                              safeSetState(() {});
                              _model.pageIndex = 0;
                              safeSetState(() {});
                              _model.bookRows = ((List<BooksRow>? a, int? p) {
                                return (a ?? [])
                                    .skip((p ?? 0) * 5)
                                    .take(5)
                                    .toList();
                              }(_model.allRows.toList(), _model.pageIndex))
                                  .toList()
                                  .cast<BooksRow>();
                              safeSetState(() {});
                              _model.isLoading = false;
                              safeSetState(() {});

                              safeSetState(() {});
                            },
                            text: FFLocalizations.of(context).getText(
                              'wilal4zp' /* Informatique */,
                            ),
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
                            text: FFLocalizations.of(context).getText(
                              '9jjxtfz5' /* Sciences */,
                            ),
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
                              _model.isLoading = true;
                              safeSetState(() {});
                              _model.pagedChip2 = await BooksTable().queryRows(
                                queryFn: (q) => q
                                    .orGroupOrNull(orFilterGroup([
                                      orFilterLeaf(
                                          'title',
                                          'ilike',
                                          (String? q) {
                                            return '%${(q ?? '').trim()}%';
                                          }(_model.searchQuery)),
                                      orFilterLeaf(
                                          'author',
                                          'ilike',
                                          (String? q) {
                                            return '%${(q ?? '').trim()}%';
                                          }(_model.searchQuery)),
                                      orFilterLeaf(
                                          'category',
                                          'ilike',
                                          (String? q) {
                                            return '%${(q ?? '').trim()}%';
                                          }(_model.searchQuery)),
                                    ], isAnd: false))
                                    .orGroupOrNull(orFilterGroup([
                                      orFilterLeaf(
                                          'category',
                                          'ilike',
                                          (String? f) {
                                            return (f ?? 'All') == 'All'
                                                ? '%'
                                                : f!;
                                          }(_model.categoryFilter)),
                                      orFilterLeaf(
                                          'title',
                                          'ilike',
                                          (String? f) {
                                            return (f ?? 'All') == 'All'
                                                ? '%'
                                                : '';
                                          }(_model.categoryFilter)),
                                    ], isAnd: false))
                                    .order('created_at', ascending: true),
                              );
                              _model.allRows =
                                  _model.pagedChip2!.toList().cast<BooksRow>();
                              safeSetState(() {});
                              _model.pageIndex = 0;
                              safeSetState(() {});
                              _model.bookRows = ((List<BooksRow>? a, int? p) {
                                return (a ?? [])
                                    .skip((p ?? 0) * 5)
                                    .take(5)
                                    .toList();
                              }(_model.allRows.toList(), _model.pageIndex))
                                  .toList()
                                  .cast<BooksRow>();
                              safeSetState(() {});
                              _model.isLoading = false;
                              safeSetState(() {});

                              safeSetState(() {});
                            },
                            text: FFLocalizations.of(context).getText(
                              'femtyfh1' /* Sciences */,
                            ),
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
                            text: FFLocalizations.of(context).getText(
                              'ig8nmcwg' /* Littérature */,
                            ),
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
                              _model.isLoading = true;
                              safeSetState(() {});
                              _model.pagedChip3 = await BooksTable().queryRows(
                                queryFn: (q) => q
                                    .orGroupOrNull(orFilterGroup([
                                      orFilterLeaf(
                                          'title',
                                          'ilike',
                                          (String? q) {
                                            return '%${(q ?? '').trim()}%';
                                          }(_model.searchQuery)),
                                      orFilterLeaf(
                                          'author',
                                          'ilike',
                                          (String? q) {
                                            return '%${(q ?? '').trim()}%';
                                          }(_model.searchQuery)),
                                      orFilterLeaf(
                                          'category',
                                          'ilike',
                                          (String? q) {
                                            return '%${(q ?? '').trim()}%';
                                          }(_model.searchQuery)),
                                    ], isAnd: false))
                                    .orGroupOrNull(orFilterGroup([
                                      orFilterLeaf(
                                          'category',
                                          'ilike',
                                          (String? f) {
                                            return (f ?? 'All') == 'All'
                                                ? '%'
                                                : f!;
                                          }(_model.categoryFilter)),
                                      orFilterLeaf(
                                          'title',
                                          'ilike',
                                          (String? f) {
                                            return (f ?? 'All') == 'All'
                                                ? '%'
                                                : '';
                                          }(_model.categoryFilter)),
                                    ], isAnd: false))
                                    .order('created_at', ascending: true),
                              );
                              _model.allRows =
                                  _model.pagedChip3!.toList().cast<BooksRow>();
                              safeSetState(() {});
                              _model.pageIndex = 0;
                              safeSetState(() {});
                              _model.bookRows = ((List<BooksRow>? a, int? p) {
                                return (a ?? [])
                                    .skip((p ?? 0) * 5)
                                    .take(5)
                                    .toList();
                              }(_model.allRows.toList(), _model.pageIndex))
                                  .toList()
                                  .cast<BooksRow>();
                              safeSetState(() {});
                              _model.isLoading = false;
                              safeSetState(() {});

                              safeSetState(() {});
                            },
                            text: FFLocalizations.of(context).getText(
                              'oas65wz2' /* Littérature */,
                            ),
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
                            text: FFLocalizations.of(context).getText(
                              '39oqnhz7' /* Histoire */,
                            ),
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
                              _model.isLoading = true;
                              safeSetState(() {});
                              _model.pagedChip4 = await BooksTable().queryRows(
                                queryFn: (q) => q
                                    .orGroupOrNull(orFilterGroup([
                                      orFilterLeaf(
                                          'title',
                                          'ilike',
                                          (String? q) {
                                            return '%${(q ?? '').trim()}%';
                                          }(_model.searchQuery)),
                                      orFilterLeaf(
                                          'author',
                                          'ilike',
                                          (String? q) {
                                            return '%${(q ?? '').trim()}%';
                                          }(_model.searchQuery)),
                                      orFilterLeaf(
                                          'category',
                                          'ilike',
                                          (String? q) {
                                            return '%${(q ?? '').trim()}%';
                                          }(_model.searchQuery)),
                                    ], isAnd: false))
                                    .orGroupOrNull(orFilterGroup([
                                      orFilterLeaf(
                                          'category',
                                          'ilike',
                                          (String? f) {
                                            return (f ?? 'All') == 'All'
                                                ? '%'
                                                : f!;
                                          }(_model.categoryFilter)),
                                      orFilterLeaf(
                                          'title',
                                          'ilike',
                                          (String? f) {
                                            return (f ?? 'All') == 'All'
                                                ? '%'
                                                : '';
                                          }(_model.categoryFilter)),
                                    ], isAnd: false))
                                    .order('created_at', ascending: true),
                              );
                              _model.allRows =
                                  _model.pagedChip4!.toList().cast<BooksRow>();
                              safeSetState(() {});
                              _model.pageIndex = 0;
                              safeSetState(() {});
                              _model.bookRows = ((List<BooksRow>? a, int? p) {
                                return (a ?? [])
                                    .skip((p ?? 0) * 5)
                                    .take(5)
                                    .toList();
                              }(_model.allRows.toList(), _model.pageIndex))
                                  .toList()
                                  .cast<BooksRow>();
                              safeSetState(() {});
                              _model.isLoading = false;
                              safeSetState(() {});

                              safeSetState(() {});
                            },
                            text: FFLocalizations.of(context).getText(
                              'e088h9b6' /* Histoire */,
                            ),
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
                            text: FFLocalizations.of(context).getText(
                              '0g72oh8v' /* Économie */,
                            ),
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
                              _model.isLoading = true;
                              safeSetState(() {});
                              _model.pagedChip5 = await BooksTable().queryRows(
                                queryFn: (q) => q
                                    .orGroupOrNull(orFilterGroup([
                                      orFilterLeaf(
                                          'title',
                                          'ilike',
                                          (String? q) {
                                            return '%${(q ?? '').trim()}%';
                                          }(_model.searchQuery)),
                                      orFilterLeaf(
                                          'author',
                                          'ilike',
                                          (String? q) {
                                            return '%${(q ?? '').trim()}%';
                                          }(_model.searchQuery)),
                                      orFilterLeaf(
                                          'category',
                                          'ilike',
                                          (String? q) {
                                            return '%${(q ?? '').trim()}%';
                                          }(_model.searchQuery)),
                                    ], isAnd: false))
                                    .orGroupOrNull(orFilterGroup([
                                      orFilterLeaf(
                                          'category',
                                          'ilike',
                                          (String? f) {
                                            return (f ?? 'All') == 'All'
                                                ? '%'
                                                : f!;
                                          }(_model.categoryFilter)),
                                      orFilterLeaf(
                                          'title',
                                          'ilike',
                                          (String? f) {
                                            return (f ?? 'All') == 'All'
                                                ? '%'
                                                : '';
                                          }(_model.categoryFilter)),
                                    ], isAnd: false))
                                    .order('created_at', ascending: true),
                              );
                              _model.allRows =
                                  _model.pagedChip5!.toList().cast<BooksRow>();
                              safeSetState(() {});
                              _model.pageIndex = 0;
                              safeSetState(() {});
                              _model.bookRows = ((List<BooksRow>? a, int? p) {
                                return (a ?? [])
                                    .skip((p ?? 0) * 5)
                                    .take(5)
                                    .toList();
                              }(_model.allRows.toList(), _model.pageIndex))
                                  .toList()
                                  .cast<BooksRow>();
                              safeSetState(() {});
                              _model.isLoading = false;
                              safeSetState(() {});

                              safeSetState(() {});
                            },
                            text: FFLocalizations.of(context).getText(
                              'tbcr5939' /* Économie */,
                            ),
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
                                                Container(
                                                  height: 6.0,
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      (FFMainAxisAlignment
                                                              .start)
                                                          .flutterValue,
                                                  crossAxisAlignment:
                                                      (FFCrossAxisAlignment
                                                              .center)
                                                          .flutterValue,
                                                  textBaseline:
                                                      TextBaseline.alphabetic,
                                                  children: [
                                                    Expanded(
                                                      flex: 1,
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            (FFMainAxisAlignment
                                                                    .start)
                                                                .flutterValue,
                                                        crossAxisAlignment:
                                                            (FFCrossAxisAlignment
                                                                    .start)
                                                                .flutterValue,
                                                        textBaseline:
                                                            TextBaseline
                                                                .alphabetic,
                                                        children: [
                                                          Text(
                                                            ((double? p) {
                                                              return '${(p ?? 0).toStringAsFixed(3)} DT';
                                                            }(bookRowItem
                                                                .price)),
                                                            maxLines: 1,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                                ),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                          Text(
                                                            ((int? c) {
                                                              return (c ?? 0) >
                                                                      0
                                                                  ? '${c} in stock'
                                                                  : 'Out of stock';
                                                            }(bookRowItem
                                                                .bookCount)),
                                                            maxLines: 1,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelSmall
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 2.0)),
                                                      ),
                                                    ),
                                                    if (((bookRowItem
                                                                    .bookCount ??
                                                                0) >
                                                            0) ??
                                                        true)
                                                      FFButtonWidget(
                                                        onPressed: () async {
                                                          var confirmDialogResponse =
                                                              await showDialog<
                                                                      bool>(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return AlertDialog(
                                                                        title: Text(
                                                                            'Buy this book?'),
                                                                        content:
                                                                            Text('\"${bookRowItem.title}\" for ${(double? p) {
                                                                          return '${(p ?? 0).toStringAsFixed(3)} DT';
                                                                        }(bookRowItem.price)}.'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, false),
                                                                            child:
                                                                                Text('Cancel'),
                                                                          ),
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, true),
                                                                            child:
                                                                                Text('Buy'),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  ) ??
                                                                  false;
                                                          if (confirmDialogResponse) {
                                                            _model.rows =
                                                                await BoughtBooksTable()
                                                                    .insert({
                                                              'user_id':
                                                                  currentUserUid,
                                                              'book_id':
                                                                  bookRowItem
                                                                      .id,
                                                              'quantity': 1,
                                                              'price_paid':
                                                                  bookRowItem
                                                                          .price ??
                                                                      0,
                                                            });
                                                            await BooksTable()
                                                                .update(
                                                              data: {
                                                                'book_count': (int?
                                                                    c) {
                                                                  return (c ??
                                                                              0) >
                                                                          0
                                                                      ? (c ?? 0) -
                                                                          1
                                                                      : 0;
                                                                }(bookRowItem
                                                                    .bookCount),
                                                              },
                                                              matchingRows:
                                                                  (rows) => rows
                                                                      .eqOrNull(
                                                                'id',
                                                                bookRowItem.id,
                                                              ),
                                                            );
                                                            _model.isLoading =
                                                                true;
                                                            safeSetState(() {});
                                                            _model.booksAfterBuy =
                                                                await BooksTable()
                                                                    .queryRows(
                                                              queryFn: (q) => q
                                                                  .orGroupOrNull(
                                                                      orFilterGroup([
                                                                    orFilterLeaf(
                                                                        'title',
                                                                        'ilike',
                                                                        (String?
                                                                            q) {
                                                                          return '%${(q ?? '').trim()}%';
                                                                        }(_model
                                                                            .searchQuery)),
                                                                    orFilterLeaf(
                                                                        'author',
                                                                        'ilike',
                                                                        (String?
                                                                            q) {
                                                                          return '%${(q ?? '').trim()}%';
                                                                        }(_model
                                                                            .searchQuery)),
                                                                    orFilterLeaf(
                                                                        'category',
                                                                        'ilike',
                                                                        (String?
                                                                            q) {
                                                                          return '%${(q ?? '').trim()}%';
                                                                        }(_model
                                                                            .searchQuery)),
                                                                  ],
                                                                          isAnd:
                                                                              false))
                                                                  .orGroupOrNull(
                                                                      orFilterGroup([
                                                                    orFilterLeaf(
                                                                        'category',
                                                                        'ilike',
                                                                        (String?
                                                                            f) {
                                                                          return (f ?? 'All') == 'All'
                                                                              ? '%'
                                                                              : f!;
                                                                        }(_model
                                                                            .categoryFilter)),
                                                                    orFilterLeaf(
                                                                        'title',
                                                                        'ilike',
                                                                        (String?
                                                                            f) {
                                                                          return (f ?? 'All') == 'All'
                                                                              ? '%'
                                                                              : '';
                                                                        }(_model
                                                                            .categoryFilter)),
                                                                  ],
                                                                          isAnd:
                                                                              false))
                                                                  .order(
                                                                      'created_at',
                                                                      ascending:
                                                                          true),
                                                            );
                                                            _model.allRows = _model
                                                                .booksAfterBuy!
                                                                .toList()
                                                                .cast<
                                                                    BooksRow>();
                                                            safeSetState(() {});
                                                            _model
                                                                .pageIndex = (int?
                                                                        p,
                                                                    List<BooksRow>?
                                                                        a) {
                                                              return (p ?? 0) >=
                                                                      (((a ?? []).length +
                                                                              5 -
                                                                              1) ~/
                                                                          5)
                                                                  ? ((((a ?? []).length + 5 - 1) ~/
                                                                              5) -
                                                                          1)
                                                                      .clamp(
                                                                          0,
                                                                          1 <<
                                                                              30)
                                                                  : (p ?? 0);
                                                            }(
                                                                _model
                                                                    .pageIndex,
                                                                _model.allRows
                                                                    .toList());
                                                            safeSetState(() {});
                                                            _model
                                                                .bookRows = ((List<BooksRow>?
                                                                            a,
                                                                        int? p) {
                                                              return (a ?? [])
                                                                  .skip(
                                                                      (p ?? 0) *
                                                                          5)
                                                                  .take(5)
                                                                  .toList();
                                                            }(
                                                                    _model
                                                                        .allRows
                                                                        .toList(),
                                                                    _model
                                                                        .pageIndex))
                                                                .toList()
                                                                .cast<
                                                                    BooksRow>();
                                                            safeSetState(() {});
                                                            _model.isLoading =
                                                                false;
                                                            safeSetState(() {});
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Book bought! See it in My purchases.',
                                                                  style:
                                                                      TextStyle(),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        4000),
                                                              ),
                                                            );
                                                          }

                                                          safeSetState(() {});
                                                        },
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          '701z5q75' /* Buy */,
                                                        ),
                                                        icon: Icon(
                                                          Icons.shopping_cart,
                                                          size: 20.0,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          height: 38.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          iconColor:
                                                              Colors.white,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          textStyle: TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                      ),
                                                    if (!((bookRowItem
                                                                .bookCount ??
                                                            0) >
                                                        0))
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      6.0,
                                                                      10.0,
                                                                      6.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'enljow4o' /* Sold out */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                  ].divide(
                                                      SizedBox(width: 8.0)),
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
                                          if (!((List<FavoritesRow>? r,
                                                  int? id) {
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
                                                _model.rows4 =
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
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: (FFMainAxisAlignment.start).flutterValue,
                    crossAxisAlignment:
                        (FFCrossAxisAlignment.stretch).flutterValue,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      if (((int? p, List<BooksRow>? a) {
                            return (((a ?? []).length + 5 - 1) ~/ 5) > 1;
                          }(_model.pageIndex, _model.allRows.toList())) ??
                          true)
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment:
                              (FFMainAxisAlignment.center).flutterValue,
                          crossAxisAlignment:
                              (FFCrossAxisAlignment.center).flutterValue,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            FlutterFlowIconButton(
                              buttonSize: 40.0,
                              icon: Icon(
                                Icons.chevron_left,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 24.0,
                              ),
                              onPressed: ((int? p, List<BooksRow>? a) {
                                return (p ?? 0) <= 0;
                              }(_model.pageIndex, _model.allRows.toList()))
                                  ? null
                                  : () async {
                                      _model.pageIndex =
                                          (int? p, List<BooksRow>? a) {
                                        return (p ?? 0) > 0 ? (p ?? 0) - 1 : 0;
                                      }(_model.pageIndex,
                                              _model.allRows.toList());
                                      safeSetState(() {});
                                      _model.bookRows =
                                          ((List<BooksRow>? a, int? p) {
                                        return (a ?? [])
                                            .skip((p ?? 0) * 5)
                                            .take(5)
                                            .toList();
                                      }(_model.allRows.toList(),
                                                  _model.pageIndex))
                                              .toList()
                                              .cast<BooksRow>();
                                      safeSetState(() {});
                                    },
                            ),
                            if (((int? p, List<BooksRow>? a) {
                                  return (((((p ?? 0) - 2) < 0)
                                                  ? 0
                                                  : ((((p ?? 0) - 2) >
                                                          (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0
                                                              ? 0
                                                              : ((((a ?? []).length + 5 - 1) ~/ 5) -
                                                                  5)))
                                                      ? (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0
                                                          ? 0
                                                          : ((((a ?? []).length + 5 - 1) ~/ 5) -
                                                              5))
                                                      : ((p ?? 0) - 2))) +
                                              0) <
                                          (((a ?? []).length + 5 - 1) ~/ 5) &&
                                      (((((p ?? 0) - 2) < 0)
                                                  ? 0
                                                  : ((((p ?? 0) - 2) >
                                                          (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0
                                                              ? 0
                                                              : ((((a ?? []).length +
                                                                          5 -
                                                                          1) ~/
                                                                      5) -
                                                                  5)))
                                                      ? (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0
                                                          ? 0
                                                          : ((((a ?? []).length +
                                                                      5 -
                                                                      1) ~/
                                                                  5) -
                                                              5))
                                                      : ((p ?? 0) - 2))) +
                                              0) ==
                                          (p ?? 0);
                                }(_model.pageIndex, _model.allRows.toList())) ??
                                true)
                              FFButtonWidget(
                                onPressed: () {
                                  print('UserBrowsePageSlot0On pressed ...');
                                },
                                text: ((int? p, List<BooksRow>? a) {
                                  return '${(((((p ?? 0) - 2) < 0) ? 0 : ((((p ?? 0) - 2) > (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0 ? 0 : ((((a ?? []).length + 5 - 1) ~/ 5) - 5))) ? (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0 ? 0 : ((((a ?? []).length + 5 - 1) ~/ 5) - 5)) : ((p ?? 0) - 2))) + 0) + 1}';
                                }(_model.pageIndex, _model.allRows.toList())),
                                options: FFButtonOptions(
                                  width: 40.0,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            if (((int? p, List<BooksRow>? a) {
                                  return (((((p ?? 0) - 2) < 0)
                                                  ? 0
                                                  : ((((p ?? 0) - 2) >
                                                          (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0
                                                              ? 0
                                                              : ((((a ?? []).length + 5 - 1) ~/ 5) -
                                                                  5)))
                                                      ? (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0
                                                          ? 0
                                                          : ((((a ?? []).length + 5 - 1) ~/ 5) -
                                                              5))
                                                      : ((p ?? 0) - 2))) +
                                              0) <
                                          (((a ?? []).length + 5 - 1) ~/ 5) &&
                                      (((((p ?? 0) - 2) < 0)
                                                  ? 0
                                                  : ((((p ?? 0) - 2) >
                                                          (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0
                                                              ? 0
                                                              : ((((a ?? []).length +
                                                                          5 -
                                                                          1) ~/
                                                                      5) -
                                                                  5)))
                                                      ? (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0
                                                          ? 0
                                                          : ((((a ?? []).length +
                                                                      5 -
                                                                      1) ~/
                                                                  5) -
                                                              5))
                                                      : ((p ?? 0) - 2))) +
                                              0) !=
                                          (p ?? 0);
                                }(_model.pageIndex, _model.allRows.toList())) ??
                                true)
                              FFButtonWidget(
                                onPressed: () async {
                                  _model.pageIndex =
                                      (int? p, List<BooksRow>? a) {
                                    return (((((p ?? 0) - 2) < 0)
                                            ? 0
                                            : ((((p ?? 0) - 2) >
                                                    (((((a ?? []).length +
                                                                        5 -
                                                                        1) ~/
                                                                    5) -
                                                                5) <
                                                            0
                                                        ? 0
                                                        : ((((a ?? []).length +
                                                                    5 -
                                                                    1) ~/
                                                                5) -
                                                            5)))
                                                ? (((((a ?? []).length +
                                                                    5 -
                                                                    1) ~/
                                                                5) -
                                                            5) <
                                                        0
                                                    ? 0
                                                    : ((((a ?? []).length +
                                                                5 -
                                                                1) ~/
                                                            5) -
                                                        5))
                                                : ((p ?? 0) - 2))) +
                                        0);
                                  }(_model.pageIndex, _model.allRows.toList());
                                  safeSetState(() {});
                                  _model.bookRows =
                                      ((List<BooksRow>? a, int? p) {
                                    return (a ?? [])
                                        .skip((p ?? 0) * 5)
                                        .take(5)
                                        .toList();
                                  }(_model.allRows.toList(), _model.pageIndex))
                                          .toList()
                                          .cast<BooksRow>();
                                  safeSetState(() {});
                                },
                                text: ((int? p, List<BooksRow>? a) {
                                  return '${(((((p ?? 0) - 2) < 0) ? 0 : ((((p ?? 0) - 2) > (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0 ? 0 : ((((a ?? []).length + 5 - 1) ~/ 5) - 5))) ? (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0 ? 0 : ((((a ?? []).length + 5 - 1) ~/ 5) - 5)) : ((p ?? 0) - 2))) + 0) + 1}';
                                }(_model.pageIndex, _model.allRows.toList())),
                                options: FFButtonOptions(
                                  width: 40.0,
                                  height: 40.0,
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
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            if (((int? p, List<BooksRow>? a) {
                                  return (((((p ?? 0) - 2) < 0)
                                                  ? 0
                                                  : ((((p ?? 0) - 2) >
                                                          (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0
                                                              ? 0
                                                              : ((((a ?? []).length + 5 - 1) ~/ 5) -
                                                                  5)))
                                                      ? (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0
                                                          ? 0
                                                          : ((((a ?? []).length + 5 - 1) ~/ 5) -
                                                              5))
                                                      : ((p ?? 0) - 2))) +
                                              1) <
                                          (((a ?? []).length + 5 - 1) ~/ 5) &&
                                      (((((p ?? 0) - 2) < 0)
                                                  ? 0
                                                  : ((((p ?? 0) - 2) >
                                                          (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0
                                                              ? 0
                                                              : ((((a ?? []).length +
                                                                          5 -
                                                                          1) ~/
                                                                      5) -
                                                                  5)))
                                                      ? (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0
                                                          ? 0
                                                          : ((((a ?? []).length +
                                                                      5 -
                                                                      1) ~/
                                                                  5) -
                                                              5))
                                                      : ((p ?? 0) - 2))) +
                                              1) ==
                                          (p ?? 0);
                                }(_model.pageIndex, _model.allRows.toList())) ??
                                true)
                              FFButtonWidget(
                                onPressed: () {
                                  print('UserBrowsePageSlot1On pressed ...');
                                },
                                text: ((int? p, List<BooksRow>? a) {
                                  return '${(((((p ?? 0) - 2) < 0) ? 0 : ((((p ?? 0) - 2) > (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0 ? 0 : ((((a ?? []).length + 5 - 1) ~/ 5) - 5))) ? (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0 ? 0 : ((((a ?? []).length + 5 - 1) ~/ 5) - 5)) : ((p ?? 0) - 2))) + 1) + 1}';
                                }(_model.pageIndex, _model.allRows.toList())),
                                options: FFButtonOptions(
                                  width: 40.0,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            if (((int? p, List<BooksRow>? a) {
                                  return (((((p ?? 0) - 2) < 0)
                                                  ? 0
                                                  : ((((p ?? 0) - 2) >
                                                          (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0
                                                              ? 0
                                                              : ((((a ?? []).length + 5 - 1) ~/ 5) -
                                                                  5)))
                                                      ? (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0
                                                          ? 0
                                                          : ((((a ?? []).length + 5 - 1) ~/ 5) -
                                                              5))
                                                      : ((p ?? 0) - 2))) +
                                              1) <
                                          (((a ?? []).length + 5 - 1) ~/ 5) &&
                                      (((((p ?? 0) - 2) < 0)
                                                  ? 0
                                                  : ((((p ?? 0) - 2) >
                                                          (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0
                                                              ? 0
                                                              : ((((a ?? []).length +
                                                                          5 -
                                                                          1) ~/
                                                                      5) -
                                                                  5)))
                                                      ? (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0
                                                          ? 0
                                                          : ((((a ?? []).length +
                                                                      5 -
                                                                      1) ~/
                                                                  5) -
                                                              5))
                                                      : ((p ?? 0) - 2))) +
                                              1) !=
                                          (p ?? 0);
                                }(_model.pageIndex, _model.allRows.toList())) ??
                                true)
                              FFButtonWidget(
                                onPressed: () async {
                                  _model.pageIndex =
                                      (int? p, List<BooksRow>? a) {
                                    return (((((p ?? 0) - 2) < 0)
                                            ? 0
                                            : ((((p ?? 0) - 2) >
                                                    (((((a ?? []).length +
                                                                        5 -
                                                                        1) ~/
                                                                    5) -
                                                                5) <
                                                            0
                                                        ? 0
                                                        : ((((a ?? []).length +
                                                                    5 -
                                                                    1) ~/
                                                                5) -
                                                            5)))
                                                ? (((((a ?? []).length +
                                                                    5 -
                                                                    1) ~/
                                                                5) -
                                                            5) <
                                                        0
                                                    ? 0
                                                    : ((((a ?? []).length +
                                                                5 -
                                                                1) ~/
                                                            5) -
                                                        5))
                                                : ((p ?? 0) - 2))) +
                                        1);
                                  }(_model.pageIndex, _model.allRows.toList());
                                  safeSetState(() {});
                                  _model.bookRows =
                                      ((List<BooksRow>? a, int? p) {
                                    return (a ?? [])
                                        .skip((p ?? 0) * 5)
                                        .take(5)
                                        .toList();
                                  }(_model.allRows.toList(), _model.pageIndex))
                                          .toList()
                                          .cast<BooksRow>();
                                  safeSetState(() {});
                                },
                                text: ((int? p, List<BooksRow>? a) {
                                  return '${(((((p ?? 0) - 2) < 0) ? 0 : ((((p ?? 0) - 2) > (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0 ? 0 : ((((a ?? []).length + 5 - 1) ~/ 5) - 5))) ? (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0 ? 0 : ((((a ?? []).length + 5 - 1) ~/ 5) - 5)) : ((p ?? 0) - 2))) + 1) + 1}';
                                }(_model.pageIndex, _model.allRows.toList())),
                                options: FFButtonOptions(
                                  width: 40.0,
                                  height: 40.0,
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
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            if (((int? p, List<BooksRow>? a) {
                                  return (((((p ?? 0) - 2) < 0)
                                                  ? 0
                                                  : ((((p ?? 0) - 2) >
                                                          (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0
                                                              ? 0
                                                              : ((((a ?? []).length + 5 - 1) ~/ 5) -
                                                                  5)))
                                                      ? (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0
                                                          ? 0
                                                          : ((((a ?? []).length + 5 - 1) ~/ 5) -
                                                              5))
                                                      : ((p ?? 0) - 2))) +
                                              2) <
                                          (((a ?? []).length + 5 - 1) ~/ 5) &&
                                      (((((p ?? 0) - 2) < 0)
                                                  ? 0
                                                  : ((((p ?? 0) - 2) >
                                                          (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0
                                                              ? 0
                                                              : ((((a ?? []).length +
                                                                          5 -
                                                                          1) ~/
                                                                      5) -
                                                                  5)))
                                                      ? (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0
                                                          ? 0
                                                          : ((((a ?? []).length +
                                                                      5 -
                                                                      1) ~/
                                                                  5) -
                                                              5))
                                                      : ((p ?? 0) - 2))) +
                                              2) ==
                                          (p ?? 0);
                                }(_model.pageIndex, _model.allRows.toList())) ??
                                true)
                              FFButtonWidget(
                                onPressed: () {
                                  print('UserBrowsePageSlot2On pressed ...');
                                },
                                text: ((int? p, List<BooksRow>? a) {
                                  return '${(((((p ?? 0) - 2) < 0) ? 0 : ((((p ?? 0) - 2) > (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0 ? 0 : ((((a ?? []).length + 5 - 1) ~/ 5) - 5))) ? (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0 ? 0 : ((((a ?? []).length + 5 - 1) ~/ 5) - 5)) : ((p ?? 0) - 2))) + 2) + 1}';
                                }(_model.pageIndex, _model.allRows.toList())),
                                options: FFButtonOptions(
                                  width: 40.0,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            if (((int? p, List<BooksRow>? a) {
                                  return (((((p ?? 0) - 2) < 0)
                                                  ? 0
                                                  : ((((p ?? 0) - 2) >
                                                          (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0
                                                              ? 0
                                                              : ((((a ?? []).length + 5 - 1) ~/ 5) -
                                                                  5)))
                                                      ? (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0
                                                          ? 0
                                                          : ((((a ?? []).length + 5 - 1) ~/ 5) -
                                                              5))
                                                      : ((p ?? 0) - 2))) +
                                              2) <
                                          (((a ?? []).length + 5 - 1) ~/ 5) &&
                                      (((((p ?? 0) - 2) < 0)
                                                  ? 0
                                                  : ((((p ?? 0) - 2) >
                                                          (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0
                                                              ? 0
                                                              : ((((a ?? []).length +
                                                                          5 -
                                                                          1) ~/
                                                                      5) -
                                                                  5)))
                                                      ? (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0
                                                          ? 0
                                                          : ((((a ?? []).length +
                                                                      5 -
                                                                      1) ~/
                                                                  5) -
                                                              5))
                                                      : ((p ?? 0) - 2))) +
                                              2) !=
                                          (p ?? 0);
                                }(_model.pageIndex, _model.allRows.toList())) ??
                                true)
                              FFButtonWidget(
                                onPressed: () async {
                                  _model.pageIndex =
                                      (int? p, List<BooksRow>? a) {
                                    return (((((p ?? 0) - 2) < 0)
                                            ? 0
                                            : ((((p ?? 0) - 2) >
                                                    (((((a ?? []).length +
                                                                        5 -
                                                                        1) ~/
                                                                    5) -
                                                                5) <
                                                            0
                                                        ? 0
                                                        : ((((a ?? []).length +
                                                                    5 -
                                                                    1) ~/
                                                                5) -
                                                            5)))
                                                ? (((((a ?? []).length +
                                                                    5 -
                                                                    1) ~/
                                                                5) -
                                                            5) <
                                                        0
                                                    ? 0
                                                    : ((((a ?? []).length +
                                                                5 -
                                                                1) ~/
                                                            5) -
                                                        5))
                                                : ((p ?? 0) - 2))) +
                                        2);
                                  }(_model.pageIndex, _model.allRows.toList());
                                  safeSetState(() {});
                                  _model.bookRows =
                                      ((List<BooksRow>? a, int? p) {
                                    return (a ?? [])
                                        .skip((p ?? 0) * 5)
                                        .take(5)
                                        .toList();
                                  }(_model.allRows.toList(), _model.pageIndex))
                                          .toList()
                                          .cast<BooksRow>();
                                  safeSetState(() {});
                                },
                                text: ((int? p, List<BooksRow>? a) {
                                  return '${(((((p ?? 0) - 2) < 0) ? 0 : ((((p ?? 0) - 2) > (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0 ? 0 : ((((a ?? []).length + 5 - 1) ~/ 5) - 5))) ? (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0 ? 0 : ((((a ?? []).length + 5 - 1) ~/ 5) - 5)) : ((p ?? 0) - 2))) + 2) + 1}';
                                }(_model.pageIndex, _model.allRows.toList())),
                                options: FFButtonOptions(
                                  width: 40.0,
                                  height: 40.0,
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
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            if (((int? p, List<BooksRow>? a) {
                                  return (((((p ?? 0) - 2) < 0)
                                                  ? 0
                                                  : ((((p ?? 0) - 2) >
                                                          (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0
                                                              ? 0
                                                              : ((((a ?? []).length + 5 - 1) ~/ 5) -
                                                                  5)))
                                                      ? (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0
                                                          ? 0
                                                          : ((((a ?? []).length + 5 - 1) ~/ 5) -
                                                              5))
                                                      : ((p ?? 0) - 2))) +
                                              3) <
                                          (((a ?? []).length + 5 - 1) ~/ 5) &&
                                      (((((p ?? 0) - 2) < 0)
                                                  ? 0
                                                  : ((((p ?? 0) - 2) >
                                                          (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0
                                                              ? 0
                                                              : ((((a ?? []).length +
                                                                          5 -
                                                                          1) ~/
                                                                      5) -
                                                                  5)))
                                                      ? (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0
                                                          ? 0
                                                          : ((((a ?? []).length +
                                                                      5 -
                                                                      1) ~/
                                                                  5) -
                                                              5))
                                                      : ((p ?? 0) - 2))) +
                                              3) ==
                                          (p ?? 0);
                                }(_model.pageIndex, _model.allRows.toList())) ??
                                true)
                              FFButtonWidget(
                                onPressed: () {
                                  print('UserBrowsePageSlot3On pressed ...');
                                },
                                text: ((int? p, List<BooksRow>? a) {
                                  return '${(((((p ?? 0) - 2) < 0) ? 0 : ((((p ?? 0) - 2) > (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0 ? 0 : ((((a ?? []).length + 5 - 1) ~/ 5) - 5))) ? (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0 ? 0 : ((((a ?? []).length + 5 - 1) ~/ 5) - 5)) : ((p ?? 0) - 2))) + 3) + 1}';
                                }(_model.pageIndex, _model.allRows.toList())),
                                options: FFButtonOptions(
                                  width: 40.0,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            if (((int? p, List<BooksRow>? a) {
                                  return (((((p ?? 0) - 2) < 0)
                                                  ? 0
                                                  : ((((p ?? 0) - 2) >
                                                          (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0
                                                              ? 0
                                                              : ((((a ?? []).length + 5 - 1) ~/ 5) -
                                                                  5)))
                                                      ? (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0
                                                          ? 0
                                                          : ((((a ?? []).length + 5 - 1) ~/ 5) -
                                                              5))
                                                      : ((p ?? 0) - 2))) +
                                              3) <
                                          (((a ?? []).length + 5 - 1) ~/ 5) &&
                                      (((((p ?? 0) - 2) < 0)
                                                  ? 0
                                                  : ((((p ?? 0) - 2) >
                                                          (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0
                                                              ? 0
                                                              : ((((a ?? []).length +
                                                                          5 -
                                                                          1) ~/
                                                                      5) -
                                                                  5)))
                                                      ? (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0
                                                          ? 0
                                                          : ((((a ?? []).length +
                                                                      5 -
                                                                      1) ~/
                                                                  5) -
                                                              5))
                                                      : ((p ?? 0) - 2))) +
                                              3) !=
                                          (p ?? 0);
                                }(_model.pageIndex, _model.allRows.toList())) ??
                                true)
                              FFButtonWidget(
                                onPressed: () async {
                                  _model.pageIndex =
                                      (int? p, List<BooksRow>? a) {
                                    return (((((p ?? 0) - 2) < 0)
                                            ? 0
                                            : ((((p ?? 0) - 2) >
                                                    (((((a ?? []).length +
                                                                        5 -
                                                                        1) ~/
                                                                    5) -
                                                                5) <
                                                            0
                                                        ? 0
                                                        : ((((a ?? []).length +
                                                                    5 -
                                                                    1) ~/
                                                                5) -
                                                            5)))
                                                ? (((((a ?? []).length +
                                                                    5 -
                                                                    1) ~/
                                                                5) -
                                                            5) <
                                                        0
                                                    ? 0
                                                    : ((((a ?? []).length +
                                                                5 -
                                                                1) ~/
                                                            5) -
                                                        5))
                                                : ((p ?? 0) - 2))) +
                                        3);
                                  }(_model.pageIndex, _model.allRows.toList());
                                  safeSetState(() {});
                                  _model.bookRows =
                                      ((List<BooksRow>? a, int? p) {
                                    return (a ?? [])
                                        .skip((p ?? 0) * 5)
                                        .take(5)
                                        .toList();
                                  }(_model.allRows.toList(), _model.pageIndex))
                                          .toList()
                                          .cast<BooksRow>();
                                  safeSetState(() {});
                                },
                                text: ((int? p, List<BooksRow>? a) {
                                  return '${(((((p ?? 0) - 2) < 0) ? 0 : ((((p ?? 0) - 2) > (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0 ? 0 : ((((a ?? []).length + 5 - 1) ~/ 5) - 5))) ? (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0 ? 0 : ((((a ?? []).length + 5 - 1) ~/ 5) - 5)) : ((p ?? 0) - 2))) + 3) + 1}';
                                }(_model.pageIndex, _model.allRows.toList())),
                                options: FFButtonOptions(
                                  width: 40.0,
                                  height: 40.0,
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
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            if (((int? p, List<BooksRow>? a) {
                                  return (((((p ?? 0) - 2) < 0)
                                                  ? 0
                                                  : ((((p ?? 0) - 2) >
                                                          (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0
                                                              ? 0
                                                              : ((((a ?? []).length + 5 - 1) ~/ 5) -
                                                                  5)))
                                                      ? (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0
                                                          ? 0
                                                          : ((((a ?? []).length + 5 - 1) ~/ 5) -
                                                              5))
                                                      : ((p ?? 0) - 2))) +
                                              4) <
                                          (((a ?? []).length + 5 - 1) ~/ 5) &&
                                      (((((p ?? 0) - 2) < 0)
                                                  ? 0
                                                  : ((((p ?? 0) - 2) >
                                                          (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0
                                                              ? 0
                                                              : ((((a ?? []).length +
                                                                          5 -
                                                                          1) ~/
                                                                      5) -
                                                                  5)))
                                                      ? (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0
                                                          ? 0
                                                          : ((((a ?? []).length +
                                                                      5 -
                                                                      1) ~/
                                                                  5) -
                                                              5))
                                                      : ((p ?? 0) - 2))) +
                                              4) ==
                                          (p ?? 0);
                                }(_model.pageIndex, _model.allRows.toList())) ??
                                true)
                              FFButtonWidget(
                                onPressed: () {
                                  print('UserBrowsePageSlot4On pressed ...');
                                },
                                text: ((int? p, List<BooksRow>? a) {
                                  return '${(((((p ?? 0) - 2) < 0) ? 0 : ((((p ?? 0) - 2) > (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0 ? 0 : ((((a ?? []).length + 5 - 1) ~/ 5) - 5))) ? (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0 ? 0 : ((((a ?? []).length + 5 - 1) ~/ 5) - 5)) : ((p ?? 0) - 2))) + 4) + 1}';
                                }(_model.pageIndex, _model.allRows.toList())),
                                options: FFButtonOptions(
                                  width: 40.0,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            if (((int? p, List<BooksRow>? a) {
                                  return (((((p ?? 0) - 2) < 0)
                                                  ? 0
                                                  : ((((p ?? 0) - 2) >
                                                          (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0
                                                              ? 0
                                                              : ((((a ?? []).length + 5 - 1) ~/ 5) -
                                                                  5)))
                                                      ? (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0
                                                          ? 0
                                                          : ((((a ?? []).length + 5 - 1) ~/ 5) -
                                                              5))
                                                      : ((p ?? 0) - 2))) +
                                              4) <
                                          (((a ?? []).length + 5 - 1) ~/ 5) &&
                                      (((((p ?? 0) - 2) < 0)
                                                  ? 0
                                                  : ((((p ?? 0) - 2) >
                                                          (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0
                                                              ? 0
                                                              : ((((a ?? []).length +
                                                                          5 -
                                                                          1) ~/
                                                                      5) -
                                                                  5)))
                                                      ? (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0
                                                          ? 0
                                                          : ((((a ?? []).length +
                                                                      5 -
                                                                      1) ~/
                                                                  5) -
                                                              5))
                                                      : ((p ?? 0) - 2))) +
                                              4) !=
                                          (p ?? 0);
                                }(_model.pageIndex, _model.allRows.toList())) ??
                                true)
                              FFButtonWidget(
                                onPressed: () async {
                                  _model.pageIndex =
                                      (int? p, List<BooksRow>? a) {
                                    return (((((p ?? 0) - 2) < 0)
                                            ? 0
                                            : ((((p ?? 0) - 2) >
                                                    (((((a ?? []).length +
                                                                        5 -
                                                                        1) ~/
                                                                    5) -
                                                                5) <
                                                            0
                                                        ? 0
                                                        : ((((a ?? []).length +
                                                                    5 -
                                                                    1) ~/
                                                                5) -
                                                            5)))
                                                ? (((((a ?? []).length +
                                                                    5 -
                                                                    1) ~/
                                                                5) -
                                                            5) <
                                                        0
                                                    ? 0
                                                    : ((((a ?? []).length +
                                                                5 -
                                                                1) ~/
                                                            5) -
                                                        5))
                                                : ((p ?? 0) - 2))) +
                                        4);
                                  }(_model.pageIndex, _model.allRows.toList());
                                  safeSetState(() {});
                                  _model.bookRows =
                                      ((List<BooksRow>? a, int? p) {
                                    return (a ?? [])
                                        .skip((p ?? 0) * 5)
                                        .take(5)
                                        .toList();
                                  }(_model.allRows.toList(), _model.pageIndex))
                                          .toList()
                                          .cast<BooksRow>();
                                  safeSetState(() {});
                                },
                                text: ((int? p, List<BooksRow>? a) {
                                  return '${(((((p ?? 0) - 2) < 0) ? 0 : ((((p ?? 0) - 2) > (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0 ? 0 : ((((a ?? []).length + 5 - 1) ~/ 5) - 5))) ? (((((a ?? []).length + 5 - 1) ~/ 5) - 5) < 0 ? 0 : ((((a ?? []).length + 5 - 1) ~/ 5) - 5)) : ((p ?? 0) - 2))) + 4) + 1}';
                                }(_model.pageIndex, _model.allRows.toList())),
                                options: FFButtonOptions(
                                  width: 40.0,
                                  height: 40.0,
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
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            FlutterFlowIconButton(
                              buttonSize: 40.0,
                              icon: Icon(
                                Icons.chevron_right,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 24.0,
                              ),
                              onPressed: ((int? p, List<BooksRow>? a) {
                                return (p ?? 0) >=
                                    (((a ?? []).length + 5 - 1) ~/ 5) - 1;
                              }(_model.pageIndex, _model.allRows.toList()))
                                  ? null
                                  : () async {
                                      _model.pageIndex =
                                          (int? p, List<BooksRow>? a) {
                                        return (p ?? 0) <
                                                (((a ?? []).length + 5 - 1) ~/
                                                        5) -
                                                    1
                                            ? (p ?? 0) + 1
                                            : (p ?? 0);
                                      }(_model.pageIndex,
                                              _model.allRows.toList());
                                      safeSetState(() {});
                                      _model.bookRows =
                                          ((List<BooksRow>? a, int? p) {
                                        return (a ?? [])
                                            .skip((p ?? 0) * 5)
                                            .take(5)
                                            .toList();
                                      }(_model.allRows.toList(),
                                                  _model.pageIndex))
                                              .toList()
                                              .cast<BooksRow>();
                                      safeSetState(() {});
                                    },
                            ),
                          ].divide(SizedBox(width: 4.0)),
                        ),
                      if (_model.isLoading ?? true)
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment:
                              (FFMainAxisAlignment.center).flutterValue,
                          crossAxisAlignment:
                              (FFCrossAxisAlignment.center).flutterValue,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            CircularPercentIndicator(
                              percent: 0.0,
                              radius: 16.0,
                              lineWidth: 3.0,
                              animation: false,
                              animateFromLastPercent: true,
                            ),
                          ],
                        ),
                      if (((bool? l, List<BooksRow>? a) {
                            return !(l ?? false) && (a ?? []).isEmpty;
                          }(_model.isLoading, _model.allRows.toList())) ??
                          true)
                        Text(
                          FFLocalizations.of(context).getText(
                            'rtqc407h' /* No books found */,
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
                    ].divide(SizedBox(height: 8.0)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TutorialCoachMark createPageWalkthrough(BuildContext context) =>
      TutorialCoachMark(
        targets: createWalkthroughTargets(context),
        onFinish: () async {
          safeSetState(() => _model.browsebookspageController = null);
        },
        onSkip: () {
          return true;
        },
      );
}
