import '/backend/supabase/supabase.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'editbookforadmin_model.dart';
export 'editbookforadmin_model.dart';

class EditbookforadminWidget extends StatefulWidget {
  const EditbookforadminWidget({
    super.key,
    required this.book,
  });

  final BooksRow? book;

  static String routeName = 'editbookforadmin';
  static String routePath = '/editbookforadmin';

  @override
  State<EditbookforadminWidget> createState() => _EditbookforadminWidgetState();
}

class _EditbookforadminWidgetState extends State<EditbookforadminWidget>
    with TickerProviderStateMixin {
  late EditbookforadminModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasButtonTriggered = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditbookforadminModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.publishYear = widget.book?.publishYear;
      safeSetState(() {});
      safeSetState(() {
        _model.editBookTitleFieldTextController?.text = ((String? v) {
          return (v?.toString() ?? '');
        }(widget.book?.title));
      });
      safeSetState(() {
        _model.editBookIsbnFieldTextController?.text = ((String? v) {
          return (v?.toString() ?? '');
        }(widget.book?.isbn));
      });
      safeSetState(() {
        _model.editBookAuthorFieldTextController?.text = ((String? v) {
          return (v?.toString() ?? '');
        }(widget.book?.author));
      });
      safeSetState(() {
        _model.editBookDescriptionFieldTextController?.text = ((String? v) {
          return (v?.toString() ?? '');
        }(widget.book?.description));
      });
      safeSetState(() {
        _model.editBookCoverUrlFieldTextController?.text = ((String? v) {
          return (v?.toString() ?? '');
        }(widget.book?.coverUrl));
      });
      safeSetState(() {
        _model.editBookPublishYearFieldTextController?.text = ((int? v) {
          return (v?.toString() ?? '');
        }(widget.book?.publishYear));
      });
    });

    _model.editBookTitleFieldTextController ??= TextEditingController();
    _model.editBookTitleFieldFocusNode ??= FocusNode();

    _model.editBookIsbnFieldTextController ??= TextEditingController();
    _model.editBookIsbnFieldFocusNode ??= FocusNode();

    _model.editBookAuthorFieldTextController ??= TextEditingController();
    _model.editBookAuthorFieldFocusNode ??= FocusNode();

    _model.editBookDescriptionFieldTextController ??= TextEditingController();
    _model.editBookDescriptionFieldFocusNode ??= FocusNode();

    _model.editBookCoverUrlFieldTextController ??= TextEditingController();
    _model.editBookCoverUrlFieldFocusNode ??= FocusNode();

    _model.editBookPublishYearFieldTextController ??= TextEditingController();
    _model.editBookPublishYearFieldFocusNode ??= FocusNode();

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
      'buttonOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 160.0.ms,
            begin: Offset(0.95, 0.95),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
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
              'b53wzg4e' /* Edit book */,
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: (FFMainAxisAlignment.start).flutterValue,
                    crossAxisAlignment:
                        (FFCrossAxisAlignment.stretch).flutterValue,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Form(
                        key: _model.formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment:
                              (FFMainAxisAlignment.start).flutterValue,
                          crossAxisAlignment:
                              (FFCrossAxisAlignment.stretch).flutterValue,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Container(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 8.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '4g4jfq2c' /* Book title */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            TextFormField(
                              controller:
                                  _model.editBookTitleFieldTextController,
                              focusNode: _model.editBookTitleFieldFocusNode,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: FFLocalizations.of(context).getText(
                                  'elb8fify' /* Enter the book title */,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
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
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 16.0, 16.0),
                                prefixIcon: Icon(
                                  Icons.menu_book,
                                ),
                              ),
                              style: TextStyle(),
                              cursorColor: FlutterFlowTheme.of(context).primary,
                              validator: _model
                                  .editBookTitleFieldTextControllerValidator
                                  .asValidator(context),
                            ),
                            Container(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 8.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '1hdtxgil' /* ISBN */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            TextFormField(
                              controller:
                                  _model.editBookIsbnFieldTextController,
                              focusNode: _model.editBookIsbnFieldFocusNode,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: FFLocalizations.of(context).getText(
                                  'l9xxzg70' /* e.g. 978-3-16-148410-0 */,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
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
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 16.0, 16.0),
                                prefixIcon: Icon(
                                  Icons.qr_code,
                                ),
                              ),
                              style: TextStyle(),
                              cursorColor: FlutterFlowTheme.of(context).primary,
                              validator: _model
                                  .editBookIsbnFieldTextControllerValidator
                                  .asValidator(context),
                            ),
                            Container(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 8.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'kl9ulbv6' /* Author */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            TextFormField(
                              controller:
                                  _model.editBookAuthorFieldTextController,
                              focusNode: _model.editBookAuthorFieldFocusNode,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: FFLocalizations.of(context).getText(
                                  '0rmzmb7i' /* Enter the author name */,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
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
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 16.0, 16.0),
                                prefixIcon: Icon(
                                  Icons.person,
                                ),
                              ),
                              style: TextStyle(),
                              cursorColor: FlutterFlowTheme.of(context).primary,
                              validator: _model
                                  .editBookAuthorFieldTextControllerValidator
                                  .asValidator(context),
                            ),
                            Container(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 8.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'zv302sha' /* Category */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            FlutterFlowDropDown<String>(
                              controller: _model
                                      .editBookCategoryFieldValueController ??=
                                  FormFieldController<String>(null),
                              options: List<String>.from([
                                'Informatique',
                                'Sciences',
                                'Littérature',
                                'Histoire',
                                'Économie'
                              ]),
                              optionLabels: [
                                FFLocalizations.of(context).getText(
                                  'msbhemd9' /* Informatique */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '9jxxwbsk' /* Sciences */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '60xn9yb0' /* Littérature */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'teo5wbsp' /* Histoire */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'f09jr9ad' /* Économie */,
                                )
                              ],
                              onChanged: (val) => safeSetState(() =>
                                  _model.editBookCategoryFieldValue = val),
                              height: 56.0,
                              textStyle: FlutterFlowTheme.of(context)
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
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                              hintText: FFLocalizations.of(context).getText(
                                '2kblp1lz' /* Select a category */,
                              ),
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 0.0,
                              borderColor:
                                  FlutterFlowTheme.of(context).alternate,
                              focusBorderColor:
                                  FlutterFlowTheme.of(context).primary,
                              borderWidth: 1.2,
                              borderRadius: 14.0,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              hidesUnderline: true,
                              isOverButton: false,
                              isSearchable: false,
                              isMultiSelect: false,
                            ),
                            Container(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 8.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '38rogpkj' /* Description */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            TextFormField(
                              controller:
                                  _model.editBookDescriptionFieldTextController,
                              focusNode:
                                  _model.editBookDescriptionFieldFocusNode,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: FFLocalizations.of(context).getText(
                                  '4lhb1xbe' /* Short description of the book */,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
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
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 16.0, 16.0),
                              ),
                              style: TextStyle(),
                              maxLines: 4,
                              cursorColor: FlutterFlowTheme.of(context).primary,
                              validator: _model
                                  .editBookDescriptionFieldTextControllerValidator
                                  .asValidator(context),
                            ),
                            Container(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 8.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'io0e6t0a' /* Cover URL */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            TextFormField(
                              controller:
                                  _model.editBookCoverUrlFieldTextController,
                              focusNode: _model.editBookCoverUrlFieldFocusNode,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: FFLocalizations.of(context).getText(
                                  'k278p3pi' /* https://example.com/cover.jpg */,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
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
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 16.0, 16.0),
                                prefixIcon: Icon(
                                  Icons.image,
                                ),
                              ),
                              style: TextStyle(),
                              cursorColor: FlutterFlowTheme.of(context).primary,
                              validator: _model
                                  .editBookCoverUrlFieldTextControllerValidator
                                  .asValidator(context),
                            ),
                            Container(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 8.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '9kqnxmpn' /* Publish year */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            TextFormField(
                              controller:
                                  _model.editBookPublishYearFieldTextController,
                              focusNode:
                                  _model.editBookPublishYearFieldFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.editBookPublishYearFieldTextController',
                                Duration(milliseconds: 2000),
                                () async {
                                  _model.publishYear = int.tryParse(_model
                                      .editBookPublishYearFieldTextController
                                      .text);
                                  safeSetState(() {});
                                },
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: FFLocalizations.of(context).getText(
                                  'lyuvdpyt' /* e.g. 2020 */,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
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
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 16.0, 16.0),
                                prefixIcon: Icon(
                                  Icons.calendar_today,
                                ),
                              ),
                              style: TextStyle(),
                              keyboardType:
                                  (FFKeyboardType.number).flutterValue,
                              cursorColor: FlutterFlowTheme.of(context).primary,
                              validator: _model
                                  .editBookPublishYearFieldTextControllerValidator
                                  .asValidator(context),
                            ),
                          ].divide(SizedBox(height: 0.0)),
                        ),
                      ),
                      Container(
                        height: 28.0,
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          if (animationsMap['buttonOnActionTriggerAnimation'] !=
                              null) {
                            safeSetState(() => hasButtonTriggered = true);
                            SchedulerBinding.instance.addPostFrameCallback(
                                (_) async => await animationsMap[
                                        'buttonOnActionTriggerAnimation']!
                                    .controller
                                    .forward(from: 0.0));
                          }
                          if (_model.formKey.currentState == null ||
                              !_model.formKey.currentState!.validate()) {
                            return;
                          }
                          await BooksTable().update(
                            data: {
                              'title':
                                  _model.editBookTitleFieldTextController.text,
                              'isbn':
                                  _model.editBookIsbnFieldTextController.text,
                              'author':
                                  _model.editBookAuthorFieldTextController.text,
                              'category': _model.editBookCategoryFieldValue,
                              'description': _model
                                  .editBookDescriptionFieldTextController.text,
                              'cover_url': _model
                                  .editBookCoverUrlFieldTextController.text,
                              'publish_year': _model.publishYear,
                            },
                            matchingRows: (rows) => rows.eqOrNull(
                              'id',
                              widget.book?.id,
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Book updated',
                                style: TextStyle(),
                              ),
                              duration: Duration(milliseconds: 4000),
                            ),
                          );
                          if (Navigator.of(context).canPop()) {
                            context.pop();
                          }
                          context.pushNamed(
                            BrowsebooksforadminWidget.routeName,
                            extra: <String, dynamic>{
                              '__transition_info__': TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.rightToLeft,
                                duration: Duration(milliseconds: 300),
                              ),
                            },
                          );

                          safeSetState(() {});
                        },
                        text: FFLocalizations.of(context).getText(
                          'dkui5pnq' /* Save changes */,
                        ),
                        icon: Icon(
                          Icons.save,
                          size: 20.0,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 56.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconColor: Colors.white,
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                      ).animateOnActionTrigger(
                          animationsMap['buttonOnActionTriggerAnimation']!,
                          hasBeenTriggered: hasButtonTriggered),
                      Container(
                        height: 12.0,
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          context.pop();
                        },
                        text: FFLocalizations.of(context).getText(
                          'l8h7bjky' /* Cancel */,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 52.0,
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
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                      ),
                    ].divide(SizedBox(height: 0.0)),
                  ),
                ),
              ],
            ),
          ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation']!),
        ),
      ),
    );
  }
}
