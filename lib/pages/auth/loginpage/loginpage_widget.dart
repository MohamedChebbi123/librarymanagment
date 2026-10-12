import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
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

class _LoginpageWidgetState extends State<LoginpageWidget> {
  late LoginpageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginpageModel());

    _model.loginEmailFieldTextController ??= TextEditingController();
    _model.loginEmailFieldFocusNode ??= FocusNode();

    _model.loginPasswordFieldTextController ??= TextEditingController();
    _model.loginPasswordFieldFocusNode ??= FocusNode();
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
            'Log in',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.inter(
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
          centerTitle: false,
          elevation: 2.0,
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
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment:
                            (FFMainAxisAlignment.start).flutterValue,
                        crossAxisAlignment:
                            (FFCrossAxisAlignment.start).flutterValue,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            'Welcome back',
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  font: GoogleFonts.inter(
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
                            'Log in to your library account.',
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
                                labelText: 'Email',
                                hintText: 'you@example.com',
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
                                  Icons.email,
                                ),
                              ),
                              style: TextStyle(),
                              maxLines: null,
                              keyboardType:
                                  (FFKeyboardType.emailAddress).flutterValue,
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
                                labelText: 'Password',
                                hintText: 'Enter your password',
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
                                  Icons.lock,
                                ),
                                suffixIcon: InkWell(
                                  onTap: () async {
                                    safeSetState(() => _model
                                            .loginPasswordFieldVisibility =
                                        !_model.loginPasswordFieldVisibility);
                                  },
                                  focusNode: FocusNode(skipTraversal: true),
                                  child: Icon(
                                    _model.loginPasswordFieldVisibility
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    size: 22,
                                  ),
                                ),
                              ),
                              style: TextStyle(),
                              validator: _model
                                  .loginPasswordFieldTextControllerValidator
                                  .asValidator(context),
                            ),
                          ].divide(SizedBox(height: 16.0)),
                        ),
                      ),
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
                              context.pushNamed(ForgetpasswordWidget.routeName);
                            },
                            text: 'Forgot password?',
                            options: FFButtonOptions(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Colors.transparent,
                              textStyle: TextStyle(
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ],
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          if (_model.formKey.currentState == null ||
                              !_model.formKey.currentState!.validate()) {
                            return;
                          }
                          GoRouter.of(context).prepareAuthEvent();

                          final user = await authManager.signInWithEmail(
                            context,
                            _model.loginEmailFieldTextController.text,
                            _model.loginPasswordFieldTextController.text,
                          );
                          if (user == null) {
                            return;
                          }

                          _model.userData = await UsersTable().queryRows(
                            queryFn: (q) => q.eqOrNull(
                              'id',
                              currentUserUid,
                            ),
                          );
                          if (_model.userData?.firstOrNull?.role == 'admin') {
                            context.pushNamedAuth(
                                AdminhomepageWidget.routeName, context.mounted);
                          } else {
                            context.pushNamedAuth(
                                UserhomepageWidget.routeName, context.mounted);
                          }

                          safeSetState(() {});
                        },
                        text: 'Log in',
                        options: FFButtonOptions(
                          width: double.infinity,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: TextStyle(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          context.pushNamed(RegisterpageWidget.routeName);
                        },
                        text: 'Don\'t have an account? Register',
                        options: FFButtonOptions(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Colors.transparent,
                          textStyle: TextStyle(
                            color: FlutterFlowTheme.of(context).primary,
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
          ),
        ),
      ),
    );
  }
}
