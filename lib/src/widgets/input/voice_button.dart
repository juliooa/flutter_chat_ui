import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

import '../state/inherited_chat_theme.dart';
import '../state/inherited_l10n.dart';

class VoiceButton extends StatelessWidget {
  const VoiceButton({
    super.key,
    this.isRecording = false,
    this.onPressed,
    this.padding = EdgeInsets.zero,
  });

  final bool isRecording;

  /// Callback for attachment button tap event.
  final VoidCallback? onPressed;

  /// Padding around the button.
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) => Container(
        margin: InheritedChatTheme.of(context).theme.attachmentButtonMargin ??
            const EdgeInsetsDirectional.fromSTEB(
              8,
              0,
              0,
              0,
            ),
        child: IconButton(
          constraints: const BoxConstraints(
            minHeight: 24,
            minWidth: 24,
          ),
          icon: buildMicIcon(),
          onPressed: onPressed,
          padding: padding,
          splashRadius: 24,
          tooltip:
              InheritedL10n.of(context).l10n.attachmentButtonAccessibilityLabel,
        ),
      );

  Widget buildMicIcon() {
    if (isRecording) {
      return const AvatarGlow(
        glowColor: Colors.white,
        endRadius: 90.0,
        duration: Duration(milliseconds: 1000),
        repeat: true,
        showTwoGlows: true,
        repeatPauseDuration: Duration(milliseconds: 100),
        child: Icon(
          Icons.mic,
          color: Colors.red,
        ),
      );
    } else {
      return const Icon(
        Icons.mic,
        color: Colors.white,
      );
    }
  }
}
