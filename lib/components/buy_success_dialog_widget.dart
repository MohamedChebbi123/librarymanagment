import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'buy_success_dialog_model.dart';
export 'buy_success_dialog_model.dart';

/// Confirmation shown after buying a book; closes itself.
class BuySuccessDialogWidget extends StatefulWidget {
  const BuySuccessDialogWidget({super.key});

  @override
  State<BuySuccessDialogWidget> createState() => _BuySuccessDialogWidgetState();
}

class _BuySuccessDialogWidgetState extends State<BuySuccessDialogWidget>
    with TickerProviderStateMixin {
  late BuySuccessDialogModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BuySuccessDialogModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(
        Duration(
          milliseconds: 2000,
        ),
      );
      Navigator.pop(context);
    });

    animationsMap.addAll({
      'textOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeOut,
            delay: 200.0.ms,
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
            curve: Curves.easeOut,
            delay: 400.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 24.0,
            color: Color(0x33000000),
            offset: Offset(
              0.0,
              10.0,
            ),
            spreadRadius: 0.0,
          )
        ],
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: (FFMainAxisAlignment.start).flutterValue,
          crossAxisAlignment: (FFCrossAxisAlignment.center).flutterValue,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Lottie.network(
              'https://assets4.lottiefiles.com/packages/lf20_lk80fpsm.json',
              width: 120.0,
              height: 120.0,
              fit: BoxFit.contain,
              repeat: false,
              animate: true,
            ),
            Text(
              FFLocalizations.of(context).getText(
                '9agwont6' /* Book bought! */,
              ),
              style: FlutterFlowTheme.of(context).titleLarge.override(
                    font: GoogleFonts.playfairDisplay(
                      fontWeight:
                          FlutterFlowTheme.of(context).titleLarge.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleLarge.fontStyle,
                    ),
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).titleLarge.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleLarge.fontStyle,
                  ),
            ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation1']!),
            Text(
              FFLocalizations.of(context).getText(
                'hghjkd3a' /* You can find it in My purchase... */,
              ),
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.inter(
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).secondaryText,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
            ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation2']!),
          ].divide(SizedBox(height: 8.0)),
        ),
      ),
    );
  }
}
