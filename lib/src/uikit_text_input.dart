import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'helpers/uikit_helper_functions.dart';
import 'helpers/uikit_sizes.dart';
import 'helpers/uikit_text_input_style.dart';
import 'theme/uikit_text_input_theme_data.dart';
import 'helpers/uikit_icon_theme.dart';
import 'helpers/uikit_states.dart';
import 'helpers/uikit_color_scheme.dart';
import 'helpers/uikit_shadow_scheme.dart';
import 'helpers/uikit_size_scheme.dart';
import 'theme/uikit_theme.dart';

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
    this.focusNode,
    this.onSubmitted,
    this.onChanged,
    this.maxLines,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
    this.styleType,
    this.inputType,
  })  : assert(
          styleType == null && inputType == null,
          'styleType and inputType must be null. If you want to set them use the named constructors instead',
        ),
        assert(
          onSubmitted == null,
          'Must be null by default. Use <search> named constructors to set its value.',
        ),
        size = null;

  const UIKitTextInput.smallFilledInput({
    super.key,
    this.leading,
    this.trailing,
    this.errorIcon,
    this.label,
    this.assistiveText,
    this.isDisabled,
    required this.controller,
    this.focusNode,
    this.onChanged,
    this.maxLines,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  })  : styleType = TextInputStyleType.filled,
        inputType = TextInputType.input,
        size = UIKitSizes.small,
        onSubmitted = null;

  const UIKitTextInput.smallLineInput({
    super.key,
    this.leading,
    this.trailing,
    this.errorIcon,
    this.label,
    this.assistiveText,
    this.isDisabled,
    required this.controller,
    this.focusNode,
    this.onChanged,
    this.maxLines,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  })  : styleType = TextInputStyleType.line,
        inputType = TextInputType.input,
        size = UIKitSizes.small,
        onSubmitted = null;

  const UIKitTextInput.smallFilledSearch({
    super.key,
    this.leading,
    this.trailing,
    this.isDisabled,
    required this.controller,
    this.focusNode,
    this.onSubmitted,
    this.onChanged,
    this.maxLines,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  })  : styleType = TextInputStyleType.filled,
        inputType = TextInputType.search,
        size = UIKitSizes.small,
        label = null,
        errorIcon = null,
        assistiveText = null;

  const UIKitTextInput.smallLineSearch({
    super.key,
    this.leading,
    this.trailing,
    this.isDisabled,
    required this.controller,
    this.focusNode,
    this.onSubmitted,
    this.onChanged,
    this.maxLines,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  })  : styleType = TextInputStyleType.line,
        inputType = TextInputType.search,
        size = UIKitSizes.small,
        label = null,
        errorIcon = null,
        assistiveText = null;

  const UIKitTextInput.mediumFilledInput({
    super.key,
    this.leading,
    this.trailing,
    this.errorIcon,
    this.label,
    this.assistiveText,
    this.isDisabled,
    required this.controller,
    this.focusNode,
    this.onChanged,
    this.maxLines,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  })  : styleType = TextInputStyleType.filled,
        inputType = TextInputType.input,
        size = UIKitSizes.medium,
        onSubmitted = null;

  const UIKitTextInput.mediumLineInput({
    super.key,
    this.leading,
    this.trailing,
    this.errorIcon,
    this.label,
    this.assistiveText,
    this.isDisabled,
    required this.controller,
    required this.focusNode,
    this.onChanged,
    this.maxLines,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  })  : styleType = TextInputStyleType.line,
        inputType = TextInputType.input,
        size = UIKitSizes.medium,
        onSubmitted = null;

  const UIKitTextInput.mediumFilledSearch({
    super.key,
    this.leading,
    this.trailing,
    this.isDisabled,
    required this.controller,
    this.focusNode,
    this.onSubmitted,
    this.onChanged,
    this.maxLines,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  })  : styleType = TextInputStyleType.filled,
        inputType = TextInputType.search,
        size = UIKitSizes.medium,
        label = null,
        errorIcon = null,
        assistiveText = null;

  const UIKitTextInput.mediumLineSearch({
    super.key,
    this.leading,
    this.trailing,
    this.isDisabled,
    required this.controller,
    this.focusNode,
    this.onSubmitted,
    this.onChanged,
    this.maxLines,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  })  : styleType = TextInputStyleType.line,
        inputType = TextInputType.search,
        size = UIKitSizes.medium,
        label = null,
        errorIcon = null,
        assistiveText = null;

  const UIKitTextInput.largeFilledInput({
    super.key,
    this.leading,
    this.trailing,
    this.errorIcon,
    this.label,
    this.assistiveText,
    this.isDisabled,
    required this.controller,
    this.focusNode,
    this.onChanged,
    this.maxLines,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  })  : styleType = TextInputStyleType.filled,
        inputType = TextInputType.input,
        size = UIKitSizes.large,
        onSubmitted = null;

  const UIKitTextInput.largeLineInput({
    super.key,
    this.leading,
    this.trailing,
    this.errorIcon,
    this.label,
    this.assistiveText,
    this.isDisabled,
    required this.controller,
    this.focusNode,
    this.onChanged,
    this.maxLines,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  })  : styleType = TextInputStyleType.line,
        inputType = TextInputType.input,
        size = UIKitSizes.large,
        onSubmitted = null;

  const UIKitTextInput.largeFilledSearch({
    super.key,
    this.leading,
    this.trailing,
    this.isDisabled,
    required this.controller,
    this.focusNode,
    this.onSubmitted,
    this.onChanged,
    this.maxLines,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  })  : styleType = TextInputStyleType.filled,
        inputType = TextInputType.search,
        size = UIKitSizes.large,
        label = null,
        errorIcon = null,
        assistiveText = null;

  const UIKitTextInput.largeLineSearch({
    super.key,
    this.leading,
    this.trailing,
    this.isDisabled,
    required this.controller,
    this.focusNode,
    this.onSubmitted,
    this.onChanged,
    this.maxLines,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  })  : styleType = TextInputStyleType.line,
        inputType = TextInputType.search,
        size = UIKitSizes.large,
        label = null,
        errorIcon = null,
        assistiveText = null;

  /// [Widget] that appears on the left side.
  final Widget? leading;

  /// [Widget] that appears on the right side.
  final Widget? trailing;

  /// [Widget] that appears right before [trailing] when in error state.
  final Widget? errorIcon;

  /// [Widget] that appears right after [leading].
  final Widget? label;

  /// [Widget] that is on the bottom of this widget, under the input text field.
  final Widget? assistiveText;

  /// [bool] indicating whether this widget is disabled.
  final bool? isDisabled;

  /// [TextEditingController] that handles the input text.
  final TextEditingController controller;

  /// [FocusNode] that handles focus events.
  final FocusNode? focusNode;

  /// [Function] with a [String] parameter. Must be null by default for input
  /// constructors. Must not be null for search constructors.
  final void Function(String)? onSubmitted;

  /// [Function] with a [String] parameter. Called on each character input.
  final void Function(String)? onChanged;

  /// How many lines this widget can show on screen.
  final int? maxLines;

  /// [UIKitColorScheme]
  /// If given, overwrites the apps theme.
  final UIKitColorScheme? colorScheme;

  /// [UIKitSizeScheme]
  /// If given, overwrites the apps theme.
  final UIKitSizeScheme? sizeScheme;

  /// [UIKitShadowScheme]
  /// If given, overwrites the apps theme.
  final UIKitShadowScheme? shadowScheme;

  /// [TextInputStyleType]
  /// Must be null. Use named constructors to set the style to either filled
  /// or line.
  final TextInputStyleType? styleType;

  /// Must be null. Use named constructors to set the inputType to either
  /// filled or line.
  final TextInputType? inputType;

  /// [UIKitSizes] determining the size that this widget gets from theme.
  /// Must be null by default. Use named constructors to set its value instead.
  final UIKitSizes? size;

  @override
  Widget build(BuildContext context) {
    // a fallback focusnode in case none is provided
    final focusNodeFallback = useFocusNode();
    final focusNode = this.focusNode ?? focusNodeFallback;

    final state$ = useState(
      isDisabled ?? false
          ? UIKitState.disabled
          : controller.text.isEmpty
              ? UIKitState.defaultState
              : UIKitState.active,
    );
    final isHovered$ = useState(false);
    final isFocused$ = useState(focusNode.hasFocus);

    final focusListener = useCallback(() {
      focusNode.hasFocus ? isFocused$.value = true : isFocused$.value = false;
    }, []);

    useEffect(() {
      focusNode.addListener(focusListener);

      return () {
        focusNode.removeListener(focusListener);
      };
    }, []);

    useEffect(() {
      if (isFocused$.value) {
        state$.value = UIKitState.focused;
        focusNode.requestFocus();
      } else {
        state$.value = controller.text.isEmpty
            ? UIKitState.defaultState
            : UIKitState.active;
        focusNode.unfocus();
      }
      return;
    }, [isFocused$.value]);

    final themeData$ = useState(UIKitTheme.of(context).textInputThemeData);

    final colors$ = useState(define(colorScheme, findColors(themeData$.value)));
    final size$ = useState(define(sizeScheme, findSize(themeData$.value)));
    final shadows$ =
        useState(define(shadowScheme, findShadows(themeData$.value)));

    final colorHelper = findStateAttributes(
      colors$.value,
      shadows$.value,
      state$.value,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MouseRegion(
          cursor: state$.value == UIKitState.disabled
              ? SystemMouseCursors.basic
              : SystemMouseCursors.text,
          onHover: (e) {
            if (!(isDisabled ?? false) &&
                state$.value != UIKitState.focused &&
                e.kind != PointerDeviceKind.touch) {
              state$.value = controller.text.isEmpty
                  ? UIKitState.hover
                  : UIKitState.active;
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
                if (!isFocused$.value) {
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
              height: size$.value.height,
              width: size$.value.width,
              padding: size$.value.padding,
              decoration: BoxDecoration(
                color: colorHelper.backgroundColor,
                borderRadius: styleType == TextInputStyleType.filled
                    ? BorderRadius.circular(size$.value.borderRadius ?? 8)
                    : null,
                border: styleType == TextInputStyleType.filled
                    ? Border.all(
                        color: colorHelper.borderColor ?? Colors.transparent,
                        width: size$.value.borderSize ?? 1,
                      )
                    : Border(
                        bottom: BorderSide(
                          color: colorHelper.borderColor ?? Colors.transparent,
                          width: size$.value.borderSize ?? 1,
                        ),
                      ),
                boxShadow: colorHelper.shadows,
              ),
              child: Row(
                children: [
                  if (leading != null) ...[
                    UIKitIconTheme(
                      color: colorHelper.contentColor,
                      size: size$.value.leadingSize,
                      child: leading!,
                    ),
                    SizedBox(width: size$.value.spacing),
                  ],
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (label != null) ...[
                          DefaultTextStyle(
                            style: state$.value == UIKitState.active ||
                                    state$.value == UIKitState.focused ||
                                    state$.value == UIKitState.error
                                ? size$.value.focusedLabelStyle?.copyWith(
                                      color: colorHelper.secondaryContentColor,
                                    ) ??
                                    TextStyle(
                                        color:
                                            colorHelper.secondaryContentColor)
                                : size$.value.labelStyle?.copyWith(
                                      color: colorHelper.secondaryContentColor,
                                    ) ??
                                    TextStyle(
                                        color:
                                            colorHelper.secondaryContentColor),
                            child: label!,
                          ),
                          if (state$.value == UIKitState.active ||
                              state$.value == UIKitState.focused ||
                              state$.value == UIKitState.error)
                            SizedBox(
                              height: (size$.value.labelStyle?.fontSize ?? 0) -
                                  (size$.value.focusedLabelStyle?.fontSize ??
                                      0) +
                                  findMissingSize(),
                            ),
                        ],
                        TextField(
                          controller: controller,
                          focusNode: focusNode,
                          onSubmitted: onSubmitted,
                          onChanged: onChanged,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.zero,
                            isCollapsed: true,
                          ),
                          cursorColor: Colors.transparent,
                          // backgroundCursorColor: Colors.transparent,
                          // rendererIgnoresPointer: true,

                          maxLines: maxLines,
                          mouseCursor: state$.value == UIKitState.disabled
                              ? SystemMouseCursors.basic
                              : SystemMouseCursors.text,
                          // selectionColor: Colors.white,
                          style: size$.value.inputStyle?.copyWith(
                                color: colorHelper.contentColor,
                              ) ??
                              TextStyle(color: colorHelper.contentColor),
                        ),
                      ],
                    ),
                  ),
                  if (errorIcon != null) ...[
                    UIKitIconTheme(
                      color: colorHelper.contentColor,
                      size: size$.value.leadingSize,
                      child: errorIcon!,
                    ),
                    SizedBox(width: size$.value.secondarySpacing),
                  ],
                  if (trailing != null) ...[
                    UIKitIconTheme(
                      color: colorHelper.contentColor,
                      size: size$.value.trailingSize,
                      child: trailing!,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
        if (assistiveText != null) ...[
          SizedBox(height: size$.value.spacing),
          DefaultTextStyle(
            style: size$.value.assistiveStyle
                    ?.copyWith(color: colorHelper.secondaryContentColor) ??
                TextStyle(color: colorHelper.secondaryContentColor),
            child: assistiveText!,
          ),
        ],
      ],
    );
  }

  UIKitColorScheme findColors(UIKitTextInputThemeData themeData) {
    UIKitColorScheme colorScheme;

    if (inputType == TextInputType.input &&
        styleType == TextInputStyleType.filled) {
      colorScheme = themeData.filledInputColorScheme;
    } else if (inputType == TextInputType.input &&
        styleType == TextInputStyleType.line) {
      colorScheme = themeData.lineInputColorScheme;
    } else if (inputType == TextInputType.search &&
        styleType == TextInputStyleType.filled) {
      colorScheme = themeData.filledSearchColorScheme;
    } else {
      colorScheme = themeData.lineSearchColorScheme;
    }

    return colorScheme;
  }

  UIKitSizeScheme findSize(UIKitTextInputThemeData themeData) {
    UIKitSizeScheme sizeScheme;

    switch (size) {
      case UIKitSizes.small:
        if (inputType == TextInputType.input &&
            styleType == TextInputStyleType.filled) {
          sizeScheme = themeData.smallFilledInputSizeScheme;
        } else if (inputType == TextInputType.input &&
            styleType == TextInputStyleType.line) {
          sizeScheme = themeData.smallLineInputSizeScheme;
        } else if (inputType == TextInputType.search &&
            styleType == TextInputStyleType.filled) {
          sizeScheme = themeData.smallFilledSearchSizeScheme;
        } else {
          sizeScheme = themeData.smallLineSearchSizeScheme;
        }
        break;
      case UIKitSizes.medium:
        if (inputType == TextInputType.input &&
            styleType == TextInputStyleType.filled) {
          sizeScheme = themeData.mediumFilledInputSizeScheme;
        } else if (inputType == TextInputType.input &&
            styleType == TextInputStyleType.line) {
          sizeScheme = themeData.mediumLineInputSizeScheme;
        } else if (inputType == TextInputType.search &&
            styleType == TextInputStyleType.filled) {
          sizeScheme = themeData.mediumFilledSearchSizeScheme;
        } else {
          sizeScheme = themeData.mediumLineSearchSizeScheme;
        }
        break;
      default:
        if (inputType == TextInputType.input &&
            styleType == TextInputStyleType.filled) {
          sizeScheme = themeData.largeFilledInputSizeScheme;
        } else if (inputType == TextInputType.input &&
            styleType == TextInputStyleType.line) {
          sizeScheme = themeData.largeLineInputSizeScheme;
        } else if (inputType == TextInputType.search &&
            styleType == TextInputStyleType.filled) {
          sizeScheme = themeData.largeFilledSearchSizeScheme;
        } else {
          sizeScheme = themeData.largeLineSearchSizeScheme;
        }
        break;
    }

    return sizeScheme;
  }

  UIKitShadowScheme findShadows(UIKitTextInputThemeData themeData) {
    UIKitShadowScheme shadowScheme;

    if (inputType == TextInputType.input &&
        styleType == TextInputStyleType.filled) {
      shadowScheme = themeData.filledInputShadowScheme;
    } else if (inputType == TextInputType.input &&
        styleType == TextInputStyleType.line) {
      shadowScheme = themeData.lineInputShadowScheme;
    } else if (inputType == TextInputType.search &&
        styleType == TextInputStyleType.filled) {
      shadowScheme = themeData.filledSearchShadowScheme;
    } else {
      shadowScheme = themeData.lineSearchShadowScheme;
    }

    return shadowScheme;
  }

  double findMissingSize() {
    switch (size) {
      case UIKitSizes.large:
        return 2;
      case UIKitSizes.small:
        return 0;
      default:
        return 1;
    }
  }
}
