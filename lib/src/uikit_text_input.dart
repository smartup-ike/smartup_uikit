import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smartup_uikit/src/theme/uikit_text_input_theme_data.dart';
import 'helpers/uikit_states.dart';
import 'helpers/uikit_color_scheme.dart';
import 'helpers/uikit_shadow_scheme.dart';
import 'helpers/uikit_size_scheme.dart';
import 'theme/uikit_theme.dart';

enum TextInputStyleType { filled, line }

enum TextInputType { input, search }

class UIKitTextInput extends HookWidget {
  const UIKitTextInput({
    super.key,
    this.leading,
    this.trailing,
    this.errorIcon,
    this.label,
    this.assistiveText,
    this.isDisabled,
    required this.controller,
    required this.focusNode,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
    this.styleType,
    this.inputType,
  }) : assert(
          styleType == null && inputType == null,
          'styleType and inputType must be null. If you want to set them use the named constructors instead',
        );

  const UIKitTextInput.filledInput({
    super.key,
    this.leading,
    this.trailing,
    this.errorIcon,
    this.label,
    this.assistiveText,
    this.isDisabled,
    required this.controller,
    required this.focusNode,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  })  : styleType = TextInputStyleType.filled,
        inputType = TextInputType.input;

  const UIKitTextInput.lineInput({
    super.key,
    this.leading,
    this.trailing,
    this.errorIcon,
    this.label,
    this.assistiveText,
    this.isDisabled,
    required this.controller,
    required this.focusNode,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  })  : styleType = TextInputStyleType.line,
        inputType = TextInputType.input;

  const UIKitTextInput.filledSearch({
    super.key,
    this.leading,
    this.trailing,
    this.label,
    this.isDisabled,
    required this.controller,
    required this.focusNode,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  })  : styleType = TextInputStyleType.filled,
        inputType = TextInputType.search,
        errorIcon = null,
        assistiveText = null;

  const UIKitTextInput.lineSearch({
    super.key,
    this.leading,
    this.trailing,
    this.label,
    this.isDisabled,
    required this.controller,
    required this.focusNode,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  })  : styleType = TextInputStyleType.line,
        inputType = TextInputType.search,
        errorIcon = null,
        assistiveText = null;

  final Widget? leading;
  final Widget? trailing;
  final Widget? errorIcon;
  final Widget? label;
  final Widget? assistiveText;
  final bool? isDisabled;
  final TextEditingController controller;
  final FocusNode focusNode;
  final UIKitColorScheme? colorScheme;
  final UIKitSizeScheme? sizeScheme;
  final UIKitShadowScheme? shadowScheme;
  final TextInputStyleType? styleType;
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    final state$ = useState(
      isDisabled ?? false
          ? UIKitState.disabled
          : controller.text.isEmpty
              ? UIKitState.defaultState
              : UIKitState.active,
    );
    final isHovered$ = useState(false);
    final isFocused$ = useState(false);

    useEffect(() {
      if (isFocused$.value) {
        focusNode.attach(context);
        focusNode.requestFocus();
      } else {
        focusNode.unfocus();
      }
      return;
    }, [isFocused$.value]);

    useEffect(() {
      if (focusNode.hasFocus) {
        state$.value = UIKitState.focused;
      } else {
        state$.value = controller.text.isEmpty
            ? UIKitState.defaultState
            : UIKitState.active;
        isFocused$.value = false;
      }
      return;
    }, [focusNode.hasFocus]);

    final themeData = UIKitTheme.of(context).textInputThemeData;

    UIKitColorScheme colors = _defineColors(context, themeData);
    UIKitSizeScheme size = _defineSize(context, themeData);
    UIKitShadowScheme shadows = _defineShadows(context, themeData);

    Color? backgroundColor;
    Color? contentColor;
    Color? borderColor;
    List<BoxShadow>? currentShadows;

    switch (state$.value) {
      case UIKitState.defaultState:
        backgroundColor = colors.defaultBackgroundColor;
        contentColor = colors.defaultContentColor;
        borderColor = colors.defaultBorderColor;
        currentShadows = shadows.defaultShadow;
        break;
      case UIKitState.hover:
        backgroundColor = colors.hoverBackgroundColor;
        contentColor = colors.hoverContentColor;
        borderColor = colors.hoverBorderColor;
        currentShadows = shadows.hoverShadow;
        break;
      case UIKitState.focused:
        backgroundColor = colors.focusedBackgroundColor;
        contentColor = colors.focusedContentColor;
        borderColor = colors.focusedBorderColor;
        currentShadows = shadows.focusedShadow;
        break;
      case UIKitState.active:
        backgroundColor = colors.activeBackgroundColor;
        contentColor = colors.activeContentColor;
        borderColor = colors.activeBorderColor;
        currentShadows = shadows.activeShadow;
        break;
      case UIKitState.disabled:
        backgroundColor = colors.disabledBackgroundColor;
        contentColor = colors.disabledContentColor;
        borderColor = colors.disabledBorderColor;
        currentShadows = shadows.disabledShadow;
        break;
      default:
        break;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MouseRegion(
          cursor: state$.value == UIKitState.disabled
              ? SystemMouseCursors.basic
              : SystemMouseCursors.text,
          onHover: (_) {
            if (!(isDisabled ?? false) && state$.value != UIKitState.focused) {
              state$.value = UIKitState.hover;
              isHovered$.value = true;
            }
          },
          onExit: (_) {
            if (!(isDisabled ?? false) && state$.value != UIKitState.focused) {
              state$.value = controller.text.isEmpty
                  ? UIKitState.defaultState
                  : UIKitState.active;
              isHovered$.value = false;
            }
          },
          child: GestureDetector(
            onTap: () {
              if (!(isDisabled ?? false)) {
                if (isFocused$.value) {
                  state$.value = controller.text.isEmpty
                      ? UIKitState.defaultState
                      : UIKitState.active;
                } else {
                  state$.value = UIKitState.focused;
                }
                isFocused$.value = !isFocused$.value;
              }
            },
            onTapDown: (_) {
              if (!(isDisabled ?? false) &&
                  state$.value != UIKitState.focused) {
                state$.value = UIKitState.focused;
              }
            },
            onTapUp: (_) {
              if (!(isDisabled ?? false) &&
                  state$.value != UIKitState.focused) {
                state$.value = isHovered$.value
                    ? UIKitState.hover
                    : controller.text.isEmpty
                        ? UIKitState.defaultState
                        : UIKitState.active;
              }
            },
            onTapCancel: () {
              if (!(isDisabled ?? false) &&
                  state$.value != UIKitState.focused) {
                state$.value = isHovered$.value
                    ? UIKitState.hover
                    : controller.text.isEmpty
                        ? UIKitState.defaultState
                        : UIKitState.active;
              }
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(
                color: styleType == TextInputStyleType.filled
                    ? backgroundColor
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(size.borderRadius ?? 8),
                border: styleType == TextInputStyleType.filled &&
                        state$.value == UIKitState.focused
                    ? Border.all(
                        color: borderColor ?? Colors.transparent,
                        width: size.borderSize ?? 1,
                      )
                    : null,
                boxShadow: currentShadows,
              ),
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  if (leading != null) ...[
                    leading!,
                    const SizedBox(width: 6),
                  ],
                  Expanded(
                    child: EditableText(
                      controller: controller,
                      focusNode: focusNode,
                      cursorColor: Colors.transparent,
                      backgroundCursorColor: Colors.transparent,
                      rendererIgnoresPointer: true,
                      mouseCursor: isDisabled ?? false
                          ? SystemMouseCursors.basic
                          : SystemMouseCursors.text,
                      selectionColor: Colors.white,
                      style:
                          size.labelTextStyle?.copyWith(color: contentColor) ??
                              TextStyle(color: contentColor),
                    ),
                  ),
                  if (errorIcon != null) ...[
                    errorIcon!,
                    const SizedBox(width: 10),
                  ],
                  trailing ?? const SizedBox(),
                ],
              ),
            ),
          ),
        ),
        if (styleType == TextInputStyleType.line) ...[
          const SizedBox(height: 3),
          Divider(
            thickness: size.borderSize,
            color: borderColor,
          ),
        ],
        if (assistiveText != null) ...[
          const SizedBox(height: 8),
          assistiveText!
        ]
      ],
    );
  }

  UIKitColorScheme _defineColors(
    BuildContext context,
    UIKitTextInputThemeData themeData,
  ) {
    UIKitColorScheme colorScheme;

    if (this.colorScheme == null) {
      if (inputType == TextInputType.input &&
          styleType == TextInputStyleType.filled) {
        colorScheme = themeData.filledInputcolorScheme;
      } else if (inputType == TextInputType.input &&
          styleType == TextInputStyleType.line) {
        colorScheme = themeData.lineInputcolorScheme;
      } else if (inputType == TextInputType.search &&
          styleType == TextInputStyleType.filled) {
        colorScheme = themeData.filledSearchcolorScheme;
      } else if (inputType == TextInputType.search &&
          styleType == TextInputStyleType.line) {
        colorScheme = themeData.lineSearchcolorScheme;
      } else {
        colorScheme = themeData.filledInputcolorScheme;
      }
    } else {
      colorScheme = this.colorScheme!;
    }
    return colorScheme;
  }

  UIKitSizeScheme _defineSize(
    BuildContext context,
    UIKitTextInputThemeData themeData,
  ) {
    UIKitSizeScheme sizeScheme;

    if (this.sizeScheme == null) {
      if (inputType == TextInputType.search) {
        sizeScheme = themeData.searchSizeScheme;
      } else {
        sizeScheme = themeData.inputSizeScheme;
      }
    } else {
      sizeScheme = this.sizeScheme!;
    }
    return sizeScheme;
  }

  UIKitShadowScheme _defineShadows(
    BuildContext context,
    UIKitTextInputThemeData themeData,
  ) {
    UIKitShadowScheme shadowScheme;

    if (this.shadowScheme == null) {
      shadowScheme = themeData.shadowScheme;
    } else {
      shadowScheme = this.shadowScheme!;
    }
    return shadowScheme;
  }
}
