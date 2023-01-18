import 'package:flutter/material.dart';

import '../state/inherited_chat_theme.dart';
import '../state/inherited_l10n.dart';

class ImageModeButton extends StatefulWidget {
  ImageModeButton({
    super.key,
    this.isActivated = false,
    this.onImageModeChange,
    this.padding = EdgeInsets.zero,
  });

  bool isActivated;
  final Function(bool)? onImageModeChange;
  final EdgeInsets padding;

  @override
  State<ImageModeButton> createState() => _ImageModeButtonState();
}

class _ImageModeButtonState extends State<ImageModeButton> {
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
          icon: widget.isActivated
              ? Image.asset(
                  'assets/icon-image_mode_on.png',
                  package: 'flutter_chat_ui',
                )
              : Image.asset(
                  'assets/icon-image_mode_off.png',
                  package: 'flutter_chat_ui',
                ),
          onPressed: () {
            setState(() {
              widget.isActivated = !widget.isActivated;
              widget.onImageModeChange?.call(widget.isActivated);
            });
          },
          padding: widget.padding,
          splashRadius: 24,
        ),
      );
}
