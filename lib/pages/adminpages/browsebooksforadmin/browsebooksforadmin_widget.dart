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

class _BrowsebooksforadminWidgetState extends State<BrowsebooksforadminWidget> {
  late BrowsebooksforadminModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BrowsebooksforadminModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.orderedBooks = await BooksTable().queryRows(
        queryFn: (q) => q.order('created_at', ascending: true),
      );
      _model.bookRows = _model.orderedBooks!.toList().cast<BooksRow>();
      safeSetState(() {});
    });

    _model.bookSearchFieldTextController ??= TextEditingController();
    _model.bookSearchFieldFocusNode ??= FocusNode();
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
                                                        _model.booksAfterMinus =
                                                            await BooksTable()
                                                                .queryRows(
                                                          queryFn: (q) =>
                                                              q.order(
                                                                  'created_at',
                                                                  ascending:
                                                                      true),
                                                        );
                                                        _model.bookRows = _model
                                                            .booksAfterMinus!
                                                            .toList()
                                                            .cast<BooksRow>();
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
                                                        _model.booksAfterPlus =
                                                            await BooksTable()
                                                                .queryRows(
                                                          queryFn: (q) =>
                                                              q.order(
                                                                  'created_at',
                                                                  ascending:
                                                                      true),
                                                        );
                                                        _model.bookRows = _model
                                                            .booksAfterPlus!
                                                            .toList()
                                                            .cast<BooksRow>();
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
