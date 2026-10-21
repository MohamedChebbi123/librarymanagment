import '/backend/supabase/supabase.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'browsebooksforadmin_model.dart';
export 'browsebooksforadmin_model.dart';

class BrowsebooksforadminWidget extends StatefulWidget {
  const BrowsebooksforadminWidget({super.key});

  static String routeName = 'browsebooksforadmin';
  static String routePath = '/browsebooksforadmin';

  @override
  State<BrowsebooksforadminWidget> createState() =>
      _BrowsebooksforadminWidgetState();
}

class _BrowsebooksforadminWidgetState extends State<BrowsebooksforadminWidget>
    with TickerProviderStateMixin {
  late BrowsebooksforadminModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BrowsebooksforadminModel());

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
    });

    _model.bookSearchFieldTextController ??= TextEditingController();
    _model.bookSearchFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, 30.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation1': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1200.0.ms,
            color: Color(0x80FFFFFF),
            angle: 0.785,
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1200.0.ms,
            color: Color(0x80FFFFFF),
            angle: 0.785,
          ),
        ],
      ),
      'containerOnPageLoadAnimation3': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1200.0.ms,
            color: Color(0x80FFFFFF),
            angle: 0.785,
          ),
        ],
      ),
      'containerOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, 30.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
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
              'wpwlxlkz' /* Books */,
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
              Container(
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                  child: TextFormField(
                    controller: _model.bookSearchFieldTextController,
                    focusNode: _model.bookSearchFieldFocusNode,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.bookSearchFieldTextController',
                      Duration(milliseconds: 300),
                      () async {
                        _model.searchQuery =
                            _model.bookSearchFieldTextController.text;
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
                        'c7e4q3ln' /* Search by title, author or cat... */,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 1.2,
                        ),
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 1.2,
                        ),
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.2,
                        ),
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.2,
                        ),
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      filled: true,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      contentPadding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 16.0, 16.0, 16.0),
                      prefixIcon: Icon(
                        Icons.search,
                      ),
                    ),
                    style: TextStyle(),
                    cursorColor: FlutterFlowTheme.of(context).primary,
                    validator: _model.bookSearchFieldTextControllerValidator
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
                              print('CategoryChip0On pressed ...');
                            },
                            text: FFLocalizations.of(context).getText(
                              '1pqcprm1' /* All */,
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
                                fontWeight: FontWeight.w600,
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
                              'dbfewuqm' /* All */,
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
                                fontWeight: FontWeight.w600,
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
                              print('CategoryChip1On pressed ...');
                            },
                            text: FFLocalizations.of(context).getText(
                              'c5ncpwgo' /* Informatique */,
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
                                fontWeight: FontWeight.w600,
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
                              '7wxaaj6q' /* Informatique */,
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
                                fontWeight: FontWeight.w600,
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
                              print('CategoryChip2On pressed ...');
                            },
                            text: FFLocalizations.of(context).getText(
                              'ebcwv7p6' /* Sciences */,
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
                                fontWeight: FontWeight.w600,
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
                              '89g82jid' /* Sciences */,
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
                                fontWeight: FontWeight.w600,
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
                              print('CategoryChip3On pressed ...');
                            },
                            text: FFLocalizations.of(context).getText(
                              'p0xdu3uo' /* Littérature */,
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
                                fontWeight: FontWeight.w600,
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
                              'ra2e0dgv' /* Littérature */,
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
                                fontWeight: FontWeight.w600,
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
                              print('CategoryChip4On pressed ...');
                            },
                            text: FFLocalizations.of(context).getText(
                              '18ie20cb' /* Histoire */,
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
                                fontWeight: FontWeight.w600,
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
                              '1kybnpha' /* Histoire */,
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
                                fontWeight: FontWeight.w600,
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
                              print('CategoryChip5On pressed ...');
                            },
                            text: FFLocalizations.of(context).getText(
                              'i4m9yvcw' /* Économie */,
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
                                fontWeight: FontWeight.w600,
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
                              'b0krenum' /* Économie */,
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
                                fontWeight: FontWeight.w600,
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
              if (((bool? l, List<BooksRow>? r) {
                    return (l ?? false) && (r ?? []).isEmpty;
                  }(_model.isLoading, _model.bookRows.toList())) ??
                  true)
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: (FFMainAxisAlignment.start).flutterValue,
                    crossAxisAlignment:
                        (FFCrossAxisAlignment.stretch).flutterValue,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Container(
                        height: 122.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).alternate,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment:
                                (FFMainAxisAlignment.start).flutterValue,
                            crossAxisAlignment:
                                (FFCrossAxisAlignment.start).flutterValue,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Container(
                                width: 60.0,
                                height: 90.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      (FFMainAxisAlignment.start).flutterValue,
                                  crossAxisAlignment:
                                      (FFCrossAxisAlignment.start).flutterValue,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Container(
                                      width: 160.0,
                                      height: 14.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                      ),
                                    ),
                                    Container(
                                      width: 110.0,
                                      height: 12.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                      ),
                                    ),
                                    Container(
                                      width: 80.0,
                                      height: 12.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 10.0)),
                                ),
                              ),
                            ].divide(SizedBox(width: 16.0)),
                          ),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation1']!),
                      Container(
                        height: 122.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).alternate,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment:
                                (FFMainAxisAlignment.start).flutterValue,
                            crossAxisAlignment:
                                (FFCrossAxisAlignment.start).flutterValue,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Container(
                                width: 60.0,
                                height: 90.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      (FFMainAxisAlignment.start).flutterValue,
                                  crossAxisAlignment:
                                      (FFCrossAxisAlignment.start).flutterValue,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Container(
                                      width: 160.0,
                                      height: 14.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                      ),
                                    ),
                                    Container(
                                      width: 110.0,
                                      height: 12.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                      ),
                                    ),
                                    Container(
                                      width: 80.0,
                                      height: 12.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 10.0)),
                                ),
                              ),
                            ].divide(SizedBox(width: 16.0)),
                          ),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation2']!),
                      Container(
                        height: 122.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).alternate,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment:
                                (FFMainAxisAlignment.start).flutterValue,
                            crossAxisAlignment:
                                (FFCrossAxisAlignment.start).flutterValue,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Container(
                                width: 60.0,
                                height: 90.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      (FFMainAxisAlignment.start).flutterValue,
                                  crossAxisAlignment:
                                      (FFCrossAxisAlignment.start).flutterValue,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Container(
                                      width: 160.0,
                                      height: 14.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                      ),
                                    ),
                                    Container(
                                      width: 110.0,
                                      height: 12.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                      ),
                                    ),
                                    Container(
                                      width: 80.0,
                                      height: 12.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 10.0)),
                                ),
                              ),
                            ].divide(SizedBox(width: 16.0)),
                          ),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation3']!),
                    ].divide(SizedBox(height: 12.0)),
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
                                      BookdetailsforadminWidget.routeName,
                                      queryParameters: {
                                        'book': serializeParam(
                                          bookRowItem,
                                          ParamType.SupabaseRow,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        '__transition_info__': TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.rightToLeft,
                                          duration: Duration(milliseconds: 300),
                                        ),
                                      },
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
                                            child: Hero(
                                              tag: ((String? v, int? i) {
                                                return '${v ?? ''}#book-${i}';
                                              }(bookRowItem.coverUrl,
                                                  bookRowItem.id)),
                                              transitionOnUserGestures: true,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: CachedNetworkImage(
                                                  fadeInDuration: Duration(
                                                      milliseconds: 500),
                                                  fadeOutDuration: Duration(
                                                      milliseconds: 500),
                                                  imageUrl:
                                                      ((String? v, int? i) {
                                                    return '${v ?? ''}#book-${i}';
                                                  }(bookRowItem.coverUrl,
                                                          bookRowItem.id)),
                                                  width: 60.0,
                                                  height: 90.0,
                                                  fit: BoxFit.cover,
                                                ),
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
                                                  bookRowItem.author,
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
                                                  ((double? p) {
                                                    return '${(p ?? 0).toStringAsFixed(3)} DT';
                                                  }(bookRowItem.price)),
                                                  maxLines: 1,
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
                                                      child: Text(
                                                        ((int? c) {
                                                          return 'Stock: ${c ?? 0}';
                                                        }(bookRowItem
                                                            .bookCount)),
                                                        maxLines: 1,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                    FlutterFlowIconButton(
                                                      borderRadius: 18.0,
                                                      buttonSize: 40.0,
                                                      fillColor:
                                                          Color(0x1F1B4D3E),
                                                      icon: Icon(
                                                        Icons.remove,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 20.0,
                                                      ),
                                                      onPressed: () async {
                                                        await BooksTable()
                                                            .update(
                                                          data: {
                                                            'book_count':
                                                                (int? c) {
                                                              return (c ?? 0) >
                                                                      0
                                                                  ? (c ?? 0) - 1
                                                                  : 0;
                                                            }(bookRowItem
                                                                    .bookCount),
                                                          },
                                                          matchingRows:
                                                              (rows) =>
                                                                  rows.eqOrNull(
                                                            'id',
                                                            bookRowItem.id,
                                                          ),
                                                        );
                                                        _model.isLoading = true;
                                                        safeSetState(() {});
                                                        _model.booksAfterMinus =
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
                                                                      return (f ?? 'All') ==
                                                                              'All'
                                                                          ? '%'
                                                                          : f!;
                                                                    }(_model
                                                                        .categoryFilter)),
                                                                orFilterLeaf(
                                                                    'title',
                                                                    'ilike',
                                                                    (String?
                                                                        f) {
                                                                      return (f ?? 'All') ==
                                                                              'All'
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
                                                            .booksAfterMinus!
                                                            .toList()
                                                            .cast<BooksRow>();
                                                        safeSetState(() {});
                                                        _model.pageIndex =
                                                            (int? p,
                                                                    List<BooksRow>?
                                                                        a) {
                                                          return (p ?? 0) >=
                                                                  (((a ?? []).length +
                                                                          5 -
                                                                          1) ~/
                                                                      5)
                                                              ? ((((a ?? []).length +
                                                                              5 -
                                                                              1) ~/
                                                                          5) -
                                                                      1)
                                                                  .clamp(0,
                                                                      1 << 30)
                                                              : (p ?? 0);
                                                        }(
                                                                _model
                                                                    .pageIndex,
                                                                _model.allRows
                                                                    .toList());
                                                        safeSetState(() {});
                                                        _model
                                                            .bookRows = ((List<
                                                                            BooksRow>?
                                                                        a,
                                                                    int? p) {
                                                          return (a ?? [])
                                                              .skip(
                                                                  (p ?? 0) * 5)
                                                              .take(5)
                                                              .toList();
                                                        }(
                                                                _model.allRows
                                                                    .toList(),
                                                                _model
                                                                    .pageIndex))
                                                            .toList()
                                                            .cast<BooksRow>();
                                                        safeSetState(() {});
                                                        _model.isLoading =
                                                            false;
                                                        safeSetState(() {});

                                                        safeSetState(() {});
                                                      },
                                                    ),
                                                    FlutterFlowIconButton(
                                                      borderRadius: 18.0,
                                                      buttonSize: 40.0,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      icon: Icon(
                                                        Icons.add,
                                                        color: Colors.white,
                                                        size: 20.0,
                                                      ),
                                                      onPressed: () async {
                                                        await BooksTable()
                                                            .update(
                                                          data: {
                                                            'book_count':
                                                                (bookRowItem.bookCount ??
                                                                        0) +
                                                                    1,
                                                          },
                                                          matchingRows:
                                                              (rows) =>
                                                                  rows.eqOrNull(
                                                            'id',
                                                            bookRowItem.id,
                                                          ),
                                                        );
                                                        _model.isLoading = true;
                                                        safeSetState(() {});
                                                        _model.booksAfterPlus =
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
                                                                      return (f ?? 'All') ==
                                                                              'All'
                                                                          ? '%'
                                                                          : f!;
                                                                    }(_model
                                                                        .categoryFilter)),
                                                                orFilterLeaf(
                                                                    'title',
                                                                    'ilike',
                                                                    (String?
                                                                        f) {
                                                                      return (f ?? 'All') ==
                                                                              'All'
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
                                                            .booksAfterPlus!
                                                            .toList()
                                                            .cast<BooksRow>();
                                                        safeSetState(() {});
                                                        _model.pageIndex =
                                                            (int? p,
                                                                    List<BooksRow>?
                                                                        a) {
                                                          return (p ?? 0) >=
                                                                  (((a ?? []).length +
                                                                          5 -
                                                                          1) ~/
                                                                      5)
                                                              ? ((((a ?? []).length +
                                                                              5 -
                                                                              1) ~/
                                                                          5) -
                                                                      1)
                                                                  .clamp(0,
                                                                      1 << 30)
                                                              : (p ?? 0);
                                                        }(
                                                                _model
                                                                    .pageIndex,
                                                                _model.allRows
                                                                    .toList());
                                                        safeSetState(() {});
                                                        _model
                                                            .bookRows = ((List<
                                                                            BooksRow>?
                                                                        a,
                                                                    int? p) {
                                                          return (a ?? [])
                                                              .skip(
                                                                  (p ?? 0) * 5)
                                                              .take(5)
                                                              .toList();
                                                        }(
                                                                _model.allRows
                                                                    .toList(),
                                                                _model
                                                                    .pageIndex))
                                                            .toList()
                                                            .cast<BooksRow>();
                                                        safeSetState(() {});
                                                        _model.isLoading =
                                                            false;
                                                        safeSetState(() {});

                                                        safeSetState(() {});
                                                      },
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 8.0)),
                                                ),
                                              ].divide(SizedBox(height: 4.0)),
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 16.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ).animateOnPageLoad(animationsMap[
                                'containerOnPageLoadAnimation4']!),
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
                                  print('BrowseBooksPageSlot0On pressed ...');
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
                                  print('BrowseBooksPageSlot1On pressed ...');
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
                                  print('BrowseBooksPageSlot2On pressed ...');
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
                                  print('BrowseBooksPageSlot3On pressed ...');
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
                                  print('BrowseBooksPageSlot4On pressed ...');
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
                        Lottie.network(
                          'https://assets9.lottiefiles.com/packages/lf20_wnqlfojb.json',
                          width: 200.0,
                          height: 140.0,
                          fit: BoxFit.contain,
                          animate: true,
                        ),
                      if (((bool? l, List<BooksRow>? a) {
                            return !(l ?? false) && (a ?? []).isEmpty;
                          }(_model.isLoading, _model.allRows.toList())) ??
                          true)
                        Text(
                          FFLocalizations.of(context).getText(
                            '2jgi9z6k' /* No books found */,
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
                        ).animateOnPageLoad(
                            animationsMap['textOnPageLoadAnimation']!),
                    ].divide(SizedBox(height: 8.0)),
                  ),
                ),
              ),
            ],
          ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation']!),
        ),
      ),
    );
  }
}
