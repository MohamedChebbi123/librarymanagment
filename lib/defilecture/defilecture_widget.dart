import '/backend/supabase/supabase.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'defilecture_model.dart';
export 'defilecture_model.dart';

/// Reading challenge: guess the book title from its summary.
class DefilectureWidget extends StatefulWidget {
  const DefilectureWidget({super.key});

  static String routeName = 'defilecture';
  static String routePath = '/defilecture';

  @override
  State<DefilectureWidget> createState() => _DefilectureWidgetState();
}

class _DefilectureWidgetState extends State<DefilectureWidget>
    with TickerProviderStateMixin {
  late DefilectureModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasContainerTriggered1 = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DefilectureModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.defiBooks = await BooksTable().queryRows(
        queryFn: (q) => q,
      );
      _model.books = _model.defiBooks!.toList().cast<BooksRow>();
      safeSetState(() {});
      _model.current = (List<BooksRow>? b, int? c) {
        return (b ?? []).isEmpty
            ? -1
            : ((b!.length < 2)
                ? 0
                : (((c ?? -1) +
                        1 +
                        DateTime.now().microsecondsSinceEpoch %
                            (b.length - 1)) %
                    b.length));
      }(_model.books.toList(), _model.current);
      safeSetState(() {});
      _model.options = ((List<BooksRow>? b, int? c) {
        return ((b ?? []).isEmpty || (c ?? -1) < 0)
            ? <String>[]
            : ([
                b![c!].title,
                ...((b
                        .where((x) => x.title != b[c].title)
                        .map((x) => x.title)
                        .toSet()
                        .toList()
                      ..shuffle())
                    .take(2))
              ]..shuffle());
      }(_model.books.toList(), _model.current))
          .toList()
          .cast<String>();
      safeSetState(() {});
      _model.correct = (List<BooksRow>? b, int? c, List<String>? o) {
        return ((b ?? []).isEmpty || (c ?? -1) < 0)
            ? -1
            : (o ?? []).indexOf(b![c!].title);
      }(_model.books.toList(), _model.current, _model.options.toList());
      safeSetState(() {});
      _model.answered = false;
      safeSetState(() {});
      _model.wrongMask = 0;
      safeSetState(() {});
      if (animationsMap['containerOnActionTriggerAnimation2'] != null) {
        await animationsMap['containerOnActionTriggerAnimation2']!
            .controller
            .forward(from: 0.0);
      }
    });

    animationsMap.addAll({
      'containerOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 450.0.ms,
            begin: Offset(1.4, 1.4),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        applyInitialState: true,
        effectsBuilder: () => [
          FlipEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: 0.5,
            end: 0.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FlipEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: 0.5,
            end: 0.0,
          ),
        ],
      ),
      'textOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'buttonOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShakeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 450.0.ms,
            hz: 8.0,
            offset: Offset(8.0, 0.0),
            rotation: 0,
          ),
        ],
      ),
      'buttonOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.9, 0.9),
            end: Offset(1.05, 1.05),
          ),
        ],
      ),
      'buttonOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShakeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 450.0.ms,
            hz: 8.0,
            offset: Offset(8.0, 0.0),
            rotation: 0,
          ),
        ],
      ),
      'buttonOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.9, 0.9),
            end: Offset(1.05, 1.05),
          ),
        ],
      ),
      'buttonOnPageLoadAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShakeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 450.0.ms,
            hz: 8.0,
            offset: Offset(8.0, 0.0),
            rotation: 0,
          ),
        ],
      ),
      'buttonOnPageLoadAnimation6': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.9, 0.9),
            end: Offset(1.05, 1.05),
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
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: true,
          title: Text(
            FFLocalizations.of(context).getText(
              'ifwvbkrn' /* Reading challenge */,
            ),
            style: FlutterFlowTheme.of(context).titleLarge.override(
                  font: GoogleFonts.playfairDisplay(
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleLarge.fontStyle,
                  ),
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: (FFMainAxisAlignment.start).flutterValue,
                crossAxisAlignment: (FFCrossAxisAlignment.stretch).flutterValue,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: (FFMainAxisAlignment.start).flutterValue,
                    crossAxisAlignment:
                        (FFCrossAxisAlignment.center).flutterValue,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'd7kwj8k0' /* Guess the book from its summar... */,
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
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondary,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 6.0, 12.0, 6.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment:
                                (FFMainAxisAlignment.start).flutterValue,
                            crossAxisAlignment:
                                (FFCrossAxisAlignment.center).flutterValue,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.white,
                                size: 18.0,
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'ut8odv9b' /* Score */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                              ),
                              Text(
                                ((int? s) {
                                  return '${s ?? 0}';
                                }(_model.score)),
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                              ),
                            ].divide(SizedBox(width: 6.0)),
                          ),
                        ),
                      ).animateOnActionTrigger(
                          animationsMap['containerOnActionTriggerAnimation1']!,
                          hasBeenTriggered: hasContainerTriggered1),
                    ].divide(SizedBox(width: 12.0)),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
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
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 1.0,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment:
                            (FFMainAxisAlignment.start).flutterValue,
                        crossAxisAlignment:
                            (FFCrossAxisAlignment.start).flutterValue,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'hu4r7ga2' /* Which book is this? */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
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
                            ((List<BooksRow>? b, int? c) {
                              return ((b ?? []).isEmpty || (c ?? -1) < 0)
                                  ? ''
                                  : ((b![c!].description ?? '').isEmpty
                                      ? '—'
                                      : b[c].description!);
                            }(_model.books.toList(), _model.current)),
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
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                          Text(
                            ((List<BooksRow>? b, int? c) {
                              return ((b ?? []).isEmpty || (c ?? -1) < 0)
                                  ? ''
                                  : ((b![c!].category ?? '').isEmpty
                                      ? '—'
                                      : b[c].category!);
                            }(_model.books.toList(), _model.current)),
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                          ),
                        ].divide(SizedBox(height: 10.0)),
                      ),
                    ),
                  )
                      .animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation']!)
                      .animateOnActionTrigger(
                        animationsMap['containerOnActionTriggerAnimation2']!,
                      ),
                  if (_model.answered ?? true)
                    Lottie.network(
                      'https://assets1.lottiefiles.com/packages/lf20_obhph3sh.json',
                      width: 160.0,
                      height: 120.0,
                      fit: BoxFit.contain,
                      repeat: false,
                      animate: true,
                    ),
                  if (_model.answered ?? true)
                    Text(
                      FFLocalizations.of(context).getText(
                        'e0mxhsrn' /* Correct! */,
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).success,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .fontStyle,
                          ),
                    ).animateOnPageLoad(
                        animationsMap['textOnPageLoadAnimation1']!),
                  if (((bool? a, int? m) {
                        return !(a ?? false) && (m ?? 0) != 0;
                      }(_model.answered, _model.wrongMask)) ??
                      true)
                    Text(
                      FFLocalizations.of(context).getText(
                        'lhxyzrrg' /* Not quite, try another title */,
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).error,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ).animateOnPageLoad(
                        animationsMap['textOnPageLoadAnimation2']!),
                  if (((List<String>? o) {
                        return (o ?? []).length > 0;
                      }(_model.options.toList())) ??
                      true)
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment:
                          (FFMainAxisAlignment.start).flutterValue,
                      crossAxisAlignment:
                          (FFCrossAxisAlignment.stretch).flutterValue,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        if (((List<String>? o, int? m, bool? a, int? k) {
                              return (o ?? []).length > 0 &&
                                  !(((m ?? 0) >> 0) & 1 == 1) &&
                                  !((a ?? false) && (k ?? -1) == 0);
                            }(_model.options.toList(), _model.wrongMask,
                                _model.answered, _model.correct)) ??
                            true)
                          FFButtonWidget(
                            onPressed: () async {
                              if (!_model.answered!) {
                                if (((_model.correct ?? -1) == 0)) {
                                  _model.answered = true;
                                  safeSetState(() {});
                                  _model.score = (_model.score ?? 0) + 1;
                                  safeSetState(() {});
                                  if (animationsMap[
                                          'containerOnActionTriggerAnimation1'] !=
                                      null) {
                                    safeSetState(
                                        () => hasContainerTriggered1 = true);
                                    SchedulerBinding.instance.addPostFrameCallback(
                                        (_) async => await animationsMap[
                                                'containerOnActionTriggerAnimation1']!
                                            .controller
                                            .forward(from: 0.0));
                                  }
                                }
                                if (!((_model.correct ?? -1) == 0)) {
                                  _model.wrongMask =
                                      (_model.wrongMask ?? 0) | (1 << 0);
                                  safeSetState(() {});
                                }
                              }
                            },
                            text: ((List<String>? o) {
                              return (o ?? []).length > 0 ? o![0] : '';
                            }(_model.options.toList())),
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
                              ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                          ),
                        if (((((_model.wrongMask ?? 0) >> 0) & 1) == 1) ?? true)
                          FFButtonWidget(
                            onPressed: () {
                              print('DefiOption0Wrong pressed ...');
                            },
                            text: ((List<String>? o) {
                              return (o ?? []).length > 0 ? o![0] : '';
                            }(_model.options.toList())),
                            icon: Icon(
                              Icons.close,
                              size: 20.0,
                            ),
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 52.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconColor: Colors.white,
                              color: FlutterFlowTheme.of(context).error,
                              textStyle: TextStyle(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['buttonOnPageLoadAnimation1']!),
                        if (((_model.answered ?? false) &&
                                (_model.correct ?? -1) == 0) ??
                            true)
                          FFButtonWidget(
                            onPressed: () {
                              print('DefiOption0Right pressed ...');
                            },
                            text: ((List<String>? o) {
                              return (o ?? []).length > 0 ? o![0] : '';
                            }(_model.options.toList())),
                            icon: Icon(
                              Icons.check,
                              size: 20.0,
                            ),
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 52.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconColor: Colors.white,
                              color: FlutterFlowTheme.of(context).success,
                              textStyle: TextStyle(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['buttonOnPageLoadAnimation2']!),
                      ],
                    ),
                  if (((List<String>? o) {
                        return (o ?? []).length > 1;
                      }(_model.options.toList())) ??
                      true)
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment:
                          (FFMainAxisAlignment.start).flutterValue,
                      crossAxisAlignment:
                          (FFCrossAxisAlignment.stretch).flutterValue,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        if (((List<String>? o, int? m, bool? a, int? k) {
                              return (o ?? []).length > 1 &&
                                  !(((m ?? 0) >> 1) & 1 == 1) &&
                                  !((a ?? false) && (k ?? -1) == 1);
                            }(_model.options.toList(), _model.wrongMask,
                                _model.answered, _model.correct)) ??
                            true)
                          FFButtonWidget(
                            onPressed: () async {
                              if (!_model.answered!) {
                                if (((_model.correct ?? -1) == 1)) {
                                  _model.answered = true;
                                  safeSetState(() {});
                                  _model.score = (_model.score ?? 0) + 1;
                                  safeSetState(() {});
                                  if (animationsMap[
                                          'containerOnActionTriggerAnimation1'] !=
                                      null) {
                                    safeSetState(
                                        () => hasContainerTriggered1 = true);
                                    SchedulerBinding.instance.addPostFrameCallback(
                                        (_) async => await animationsMap[
                                                'containerOnActionTriggerAnimation1']!
                                            .controller
                                            .forward(from: 0.0));
                                  }
                                }
                                if (!((_model.correct ?? -1) == 1)) {
                                  _model.wrongMask =
                                      (_model.wrongMask ?? 0) | (1 << 1);
                                  safeSetState(() {});
                                }
                              }
                            },
                            text: ((List<String>? o) {
                              return (o ?? []).length > 1 ? o![1] : '';
                            }(_model.options.toList())),
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
                              ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                          ),
                        if (((((_model.wrongMask ?? 0) >> 1) & 1) == 1) ?? true)
                          FFButtonWidget(
                            onPressed: () {
                              print('DefiOption1Wrong pressed ...');
                            },
                            text: ((List<String>? o) {
                              return (o ?? []).length > 1 ? o![1] : '';
                            }(_model.options.toList())),
                            icon: Icon(
                              Icons.close,
                              size: 20.0,
                            ),
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 52.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconColor: Colors.white,
                              color: FlutterFlowTheme.of(context).error,
                              textStyle: TextStyle(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['buttonOnPageLoadAnimation3']!),
                        if (((_model.answered ?? false) &&
                                (_model.correct ?? -1) == 1) ??
                            true)
                          FFButtonWidget(
                            onPressed: () {
                              print('DefiOption1Right pressed ...');
                            },
                            text: ((List<String>? o) {
                              return (o ?? []).length > 1 ? o![1] : '';
                            }(_model.options.toList())),
                            icon: Icon(
                              Icons.check,
                              size: 20.0,
                            ),
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 52.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconColor: Colors.white,
                              color: FlutterFlowTheme.of(context).success,
                              textStyle: TextStyle(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['buttonOnPageLoadAnimation4']!),
                      ],
                    ),
                  if (((List<String>? o) {
                        return (o ?? []).length > 2;
                      }(_model.options.toList())) ??
                      true)
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment:
                          (FFMainAxisAlignment.start).flutterValue,
                      crossAxisAlignment:
                          (FFCrossAxisAlignment.stretch).flutterValue,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        if (((List<String>? o, int? m, bool? a, int? k) {
                              return (o ?? []).length > 2 &&
                                  !(((m ?? 0) >> 2) & 1 == 1) &&
                                  !((a ?? false) && (k ?? -1) == 2);
                            }(_model.options.toList(), _model.wrongMask,
                                _model.answered, _model.correct)) ??
                            true)
                          FFButtonWidget(
                            onPressed: () async {
                              if (!_model.answered!) {
                                if (((_model.correct ?? -1) == 2)) {
                                  _model.answered = true;
                                  safeSetState(() {});
                                  _model.score = (_model.score ?? 0) + 1;
                                  safeSetState(() {});
                                  if (animationsMap[
                                          'containerOnActionTriggerAnimation1'] !=
                                      null) {
                                    safeSetState(
                                        () => hasContainerTriggered1 = true);
                                    SchedulerBinding.instance.addPostFrameCallback(
                                        (_) async => await animationsMap[
                                                'containerOnActionTriggerAnimation1']!
                                            .controller
                                            .forward(from: 0.0));
                                  }
                                }
                                if (!((_model.correct ?? -1) == 2)) {
                                  _model.wrongMask =
                                      (_model.wrongMask ?? 0) | (1 << 2);
                                  safeSetState(() {});
                                }
                              }
                            },
                            text: ((List<String>? o) {
                              return (o ?? []).length > 2 ? o![2] : '';
                            }(_model.options.toList())),
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
                              ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                          ),
                        if (((((_model.wrongMask ?? 0) >> 2) & 1) == 1) ?? true)
                          FFButtonWidget(
                            onPressed: () {
                              print('DefiOption2Wrong pressed ...');
                            },
                            text: ((List<String>? o) {
                              return (o ?? []).length > 2 ? o![2] : '';
                            }(_model.options.toList())),
                            icon: Icon(
                              Icons.close,
                              size: 20.0,
                            ),
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 52.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconColor: Colors.white,
                              color: FlutterFlowTheme.of(context).error,
                              textStyle: TextStyle(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['buttonOnPageLoadAnimation5']!),
                        if (((_model.answered ?? false) &&
                                (_model.correct ?? -1) == 2) ??
                            true)
                          FFButtonWidget(
                            onPressed: () {
                              print('DefiOption2Right pressed ...');
                            },
                            text: ((List<String>? o) {
                              return (o ?? []).length > 2 ? o![2] : '';
                            }(_model.options.toList())),
                            icon: Icon(
                              Icons.check,
                              size: 20.0,
                            ),
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 52.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconColor: Colors.white,
                              color: FlutterFlowTheme.of(context).success,
                              textStyle: TextStyle(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['buttonOnPageLoadAnimation6']!),
                      ],
                    ),
                  FFButtonWidget(
                    onPressed: () async {
                      _model.current = (List<BooksRow>? b, int? c) {
                        return (b ?? []).isEmpty
                            ? -1
                            : ((b!.length < 2)
                                ? 0
                                : (((c ?? -1) +
                                        1 +
                                        DateTime.now().microsecondsSinceEpoch %
                                            (b.length - 1)) %
                                    b.length));
                      }(_model.books.toList(), _model.current);
                      safeSetState(() {});
                      _model.options = ((List<BooksRow>? b, int? c) {
                        return ((b ?? []).isEmpty || (c ?? -1) < 0)
                            ? <String>[]
                            : ([
                                b![c!].title,
                                ...((b
                                        .where((x) => x.title != b[c].title)
                                        .map((x) => x.title)
                                        .toSet()
                                        .toList()
                                      ..shuffle())
                                    .take(2))
                              ]..shuffle());
                      }(_model.books.toList(), _model.current))
                          .toList()
                          .cast<String>();
                      safeSetState(() {});
                      _model.correct =
                          (List<BooksRow>? b, int? c, List<String>? o) {
                        return ((b ?? []).isEmpty || (c ?? -1) < 0)
                            ? -1
                            : (o ?? []).indexOf(b![c!].title);
                      }(_model.books.toList(), _model.current,
                              _model.options.toList());
                      safeSetState(() {});
                      _model.answered = false;
                      safeSetState(() {});
                      _model.wrongMask = 0;
                      safeSetState(() {});
                      if (animationsMap['containerOnActionTriggerAnimation2'] !=
                          null) {
                        await animationsMap[
                                'containerOnActionTriggerAnimation2']!
                            .controller
                            .forward(from: 0.0);
                      }
                    },
                    text: FFLocalizations.of(context).getText(
                      '45kopjkh' /* Next question */,
                    ),
                    icon: Icon(
                      Icons.arrow_forward,
                      size: 20.0,
                    ),
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 52.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconColor: Colors.white,
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle: TextStyle(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                  ),
                ].divide(SizedBox(height: 16.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
