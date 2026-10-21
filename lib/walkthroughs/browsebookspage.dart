import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/components/walkthrough_step_widget.dart';

// Focus widget keys for this walkthrough
final textFieldMd1bdcpt = GlobalKey();

/// browsebookspage
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: textFieldMd1bdcpt,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => WalkthroughStepWidget(
              title: 'search books',
              description: 'you can use this textfield to search for books',
            ),
          ),
        ],
      ),
    ];
