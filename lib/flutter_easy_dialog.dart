library flutter_easy_dialog;

import 'dart:ui';
import 'package:flutter/material.dart';

/// A customizable and elegant dialog widget for Flutter.
///
/// `FlutterEasyDialog` provides a simple way to display styled dialogs
/// such as **info**, **success**, **warning**, and **error** messages.
///
/// Features:
/// - Multiple dialog styles
/// - Custom title and content
/// - Optional confirm and cancel buttons
/// - Custom fonts support
/// - Custom text styles
/// - Modern blurred background UI
///
/// Example:
///```dart
/// showDialog(
///   context: context,
///   builder: (context) {
///     return FlutterEasyDialog(
///       title: "Success",
///       content: "Your operation completed successfully.",
///       style: DialogStyle.success,
///       confirmText: "OK",
///       onConfirm: () {
///         Navigator.pop(context);
///       },
///     );
///   },
/// );
///
class FlutterEasyDialog extends StatelessWidget {
  /// Defines the visual style of the dialog.

  ///

  /// Available styles:

  /// - [DialogStyle.info]

  /// - [DialogStyle.success]

  /// - [DialogStyle.warning]

  /// - [DialogStyle.error]

  final DialogStyle style;

  /// The main title displayed at the top of the dialog.

  final String? title;

  /// The description or message shown below the title.

  final String? content;

  /// Callback triggered when the confirm button is pressed.

  final Function? onConfirm;

  /// Callback triggered when the cancel button is pressed.

  final Function? onCancel;

  /// Text displayed on the confirm button.

  final String? confirmText;

  /// Text displayed on the cancel button.

  final String? cancelText;

  /// Optional font family applied to title and content.

  final String? fontFamily;

  /// Custom text style for the dialog title.

  final TextStyle? titleTextStyle;

  /// Custom text style for the dialog content.

  final TextStyle? contentTextStyle;

  /// Creates a new instance of [FlutterEasyDialog].

  const FlutterEasyDialog({
    super.key,
    this.style = DialogStyle.info,
    required this.title,
    required this.content,
    this.confirmText = "",
    this.onConfirm,
    this.cancelText = "",
    this.onCancel,
    this.fontFamily,
    this.titleTextStyle,
    this.contentTextStyle,
  });

  /// Returns the color associated with the selected [DialogStyle].

  Color getColor() {
    Color result = ColorsStyle.info;
    switch (style) {
      case DialogStyle.error:
        result = ColorsStyle.error;
        break;
      case DialogStyle.success:
        result = ColorsStyle.success;
        break;
      case DialogStyle.warning:
        result = ColorsStyle.warning;
        break;
      default:
        result = ColorsStyle.info;
    }
    return result;
  }

  /// Returns the icon associated with the selected [DialogStyle].

  IconData getIcon() {
    IconData result = Icons.info_outline_rounded;
    switch (style) {
      case DialogStyle.error:
        result = Icons.error_outline_rounded;
        break;
      case DialogStyle.success:
        result = Icons.check_rounded;
        break;
      case DialogStyle.warning:
        result = Icons.error_outline_rounded;
        break;
      default:
        result = Icons.info_outline_rounded;
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.transparent,

        /// Provides a blurred background effect behind the dialog.
        body: SafeArea(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),

            /// Semi-transparent overlay background.
            child: Container(
              color: Colors.white.withOpacity(0.2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: double.infinity),

                  /// Main dialog container.
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Column(
                      children: [
                        /// Circular icon container representing dialog type.
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: getColor(),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.35),
                                offset: const Offset(0, 8),
                                blurRadius: 16,
                              ),
                              BoxShadow(
                                color: Colors.white.withOpacity(0.25),
                                offset: const Offset(0, -4),
                                blurRadius: 8,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Icon(
                              getIcon(),
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        /// Dialog title text.
                        Text(
                          title ?? "",
                          style: titleTextStyle ??
                              TextStyle(
                                fontFamily: fontFamily,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                        ),

                        const SizedBox(height: 5),

                        /// Dialog content text.
                        Text(
                          content ?? "",
                          style: contentTextStyle ??
                              TextStyle(
                                fontSize: 14,
                                fontFamily: fontFamily,
                                color: Colors.black87,
                              ),
                        ),

                        const SizedBox(height: 10),

                        /// Confirm button
                        if (onConfirm != null) ...[
                          GestureDetector(
                            onTap: () => onConfirm!(),
                            child: Container(
                              width: double.infinity,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  confirmText ?? "",
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.onPrimary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    fontFamily: fontFamily,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],

                        /// Cancel button
                        if (onCancel != null) ...[
                          GestureDetector(
                            onTap: () => onCancel!(),
                            child: Container(
                              width: double.infinity,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  cancelText ?? "",
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.primary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    fontFamily: fontFamily,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Defines the available dialog styles.

enum DialogStyle {
  /// Informational dialog.

  info,

  /// Success dialog.

  success,

  /// Warning dialog.

  warning,

  /// Error dialog.

  error,
}

/// Default color palette used by the dialog styles.

class ColorsStyle {
  /// Success dialog color.

  static const Color success = Color(0xff1ABC9C);

  /// Error dialog color.

  static const Color error = Color(0xffFF1744);

  /// Info dialog color.

  static const Color info = Color(0xff2196F3);

  /// Warning dialog color.

  static const Color warning = Color(0xffFFA000);
}
