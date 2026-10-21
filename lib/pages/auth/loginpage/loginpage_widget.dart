import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'loginpage_model.dart';
export 'loginpage_model.dart';

class LoginpageWidget extends StatefulWidget {
  const LoginpageWidget({super.key});

  static String routeName = 'loginpage';
  static String routePath = '/loginpage';

  @override
  State<LoginpageWidget> createState() => _LoginpageWidgetState();
}

class _LoginpageWidgetState extends State<LoginpageWidget>
    with TickerProviderStateMixin {
  late LoginpageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasFormTriggered = false;
  var hasButtonTriggered = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginpageModel());

    _model.loginEmailFieldTextController ??= TextEditingController();
    _model.loginEmailFieldFocusNode ??= FocusNode();

    _model.loginPasswordFieldTextController ??= TextEditingController();
    _model.loginPasswordFieldFocusNode ??= FocusNode();

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
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: Offset(0.6, 0.6),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'formOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ShakeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            hz: 8.0,
            offset: Offset(10.0, 0.0),
            rotation: 0,
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
          title: Text(
            FFLocalizations.of(context).getText(
              'p6jlgvfr' /* Log in */,
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
              Padding(
                padding: EdgeInsets.all(24.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: (FFMainAxisAlignment.start).flutterValue,
                    crossAxisAlignment:
                        (FFCrossAxisAlignment.stretch).flutterValue,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 24.0,
                              color: Color(0x331B4D3E),
                              offset: Offset(
                                0.0,
                                10.0,
                              ),
                              spreadRadius: 0.0,
                            )
                          ],
                          gradient: LinearGradient(
                            colors: [
                              FlutterFlowTheme.of(context).primary,
                              Color(0xFF2F6F58)
                            ],
                            stops: [0.0, 1.0],
                            begin: AlignmentDirectional(1.0, 1.0),
                            end: AlignmentDirectional(-1.0, -1.0),
                          ),
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment:
                                (FFMainAxisAlignment.start).flutterValue,
                            crossAxisAlignment:
                                (FFCrossAxisAlignment.start).flutterValue,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0x26FFFFFF),
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Icon(
                                    Icons.local_library,
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    size: 28.0,
                                  ),
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'containerOnPageLoadAnimation']!),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'bnt9lwa1' /* Bibliothèque */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      font: GoogleFonts.playfairDisplay(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontStyle,
                                    ),
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  '6ildvoc8' /* Your library, beautifully orga... */,
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
                                      color: Color(0xD9FFFFFF),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ].divide(SizedBox(height: 12.0)),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment:
                            (FFMainAxisAlignment.start).flutterValue,
                        crossAxisAlignment:
                            (FFCrossAxisAlignment.start).flutterValue,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              '2jxjqg3m' /* Welcome back */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  font: GoogleFonts.playfairDisplay(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .fontStyle,
                                ),
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              'hhq8ok9n' /* Log in to your library account... */,
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
                        ].divide(SizedBox(height: 8.0)),
                      ),
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
                            TextFormField(
                              controller: _model.loginEmailFieldTextController,
                              focusNode: _model.loginEmailFieldFocusNode,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: FFLocalizations.of(context).getText(
                                  '6fd2fz16' /* Email */,
                                ),
                                hintText: FFLocalizations.of(context).getText(
                                  'pvp8mzr1' /* you@example.com */,
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
                                  Icons.email,
                                ),
                              ),
                              style: TextStyle(),
                              maxLines: null,
                              keyboardType:
                                  (FFKeyboardType.emailAddress).flutterValue,
                              cursorColor: FlutterFlowTheme.of(context).primary,
                              validator: _model
                                  .loginEmailFieldTextControllerValidator
                                  .asValidator(context),
                            ),
                            TextFormField(
                              controller:
                                  _model.loginPasswordFieldTextController,
                              focusNode: _model.loginPasswordFieldFocusNode,
                              obscureText: !_model.loginPasswordFieldVisibility,
                              decoration: InputDecoration(
                                labelText: FFLocalizations.of(context).getText(
                                  'yvxgzlea' /* Password */,
                                ),
                                hintText: FFLocalizations.of(context).getText(
                                  'atvufe9h' /* Enter your password */,
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
                                  Icons.lock,
                                ),
                                suffixIcon: InkWell(
                                  onTap: () async {
                                    safeSetState(() => _model
                                            .loginPasswordFieldVisibility =
                                        !_model.loginPasswordFieldVisibility);
                                  },
                                  focusNode: _model
                                      .loginPasswordFieldPasswordVisibilityFocusNode
                                    ..skipTraversal = !(false),
                                  child: Icon(
                                    _model.loginPasswordFieldVisibility
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    size: 22,
                                  ),
                                ),
                              ),
                              style: TextStyle(),
                              cursorColor: FlutterFlowTheme.of(context).primary,
                              validator: _model
                                  .loginPasswordFieldTextControllerValidator
                                  .asValidator(context),
                            ),
                          ].divide(SizedBox(height: 16.0)),
                        ),
                      ).animateOnActionTrigger(
                          animationsMap['formOnActionTriggerAnimation']!,
                          hasBeenTriggered: hasFormTriggered),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment:
                            (FFMainAxisAlignment.end).flutterValue,
                        crossAxisAlignment:
                            (FFCrossAxisAlignment.center).flutterValue,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              context.pushNamed(
                                ForgetpasswordWidget.routeName,
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
                            text: FFLocalizations.of(context).getText(
                              'jkhuzl6i' /* Forgot password? */,
                            ),
                            options: FFButtonOptions(
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
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ],
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
                          _model.loginOk = await actions.loginWithEmail(
                            context,
                            _model.loginEmailFieldTextController.text,
                            _model.loginPasswordFieldTextController.text,
                          );
                          if (_model.loginOk!) {
                            _model.userData = await UsersTable().queryRows(
                              queryFn: (q) => q.eqOrNull(
                                'id',
                                currentUserUid,
                              ),
                            );
                            if (((List<UsersRow>? r) {
                              return (r ?? []).isNotEmpty &&
                                  r!.first.role == 'admin';
                            }(_model.userData?.toList()))) {
                              context.pushNamed(
                                HomeforadminWidget.routeName,
                                extra: <String, dynamic>{
                                  '__transition_info__': TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 300),
                                  ),
                                },
                              );
                            } else {
                              context.pushNamed(
                                HomeforuserWidget.routeName,
                                extra: <String, dynamic>{
                                  '__transition_info__': TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 300),
                                  ),
                                },
                              );
                            }
                          } else {
                            if (animationsMap['formOnActionTriggerAnimation'] !=
                                null) {
                              safeSetState(() => hasFormTriggered = true);
                              SchedulerBinding.instance.addPostFrameCallback(
                                  (_) async => await animationsMap[
                                          'formOnActionTriggerAnimation']!
                                      .controller
                                      .forward(from: 0.0));
                            }
                          }

                          safeSetState(() {});
                        },
                        text: FFLocalizations.of(context).getText(
                          '67c7l6k7' /* Log in */,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 52.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: TextStyle(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            fontWeight: FontWeight.w600,
                          ),
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                      ).animateOnActionTrigger(
                          animationsMap['buttonOnActionTriggerAnimation']!,
                          hasBeenTriggered: hasButtonTriggered),
                      FFButtonWidget(
                        onPressed: () async {
                          context.pushNamed(
                            RegisterpageWidget.routeName,
                            extra: <String, dynamic>{
                              '__transition_info__': TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.rightToLeft,
                                duration: Duration(milliseconds: 300),
                              ),
                            },
                          );
                        },
                        text: FFLocalizations.of(context).getText(
                          '828nk8kn' /* Don't have an account? Registe... */,
                        ),
                        options: FFButtonOptions(
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
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ].divide(SizedBox(height: 24.0)),
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
