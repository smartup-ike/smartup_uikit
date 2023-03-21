import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'helpers/uikit_states.dart';
import 'helpers/uikit_color_scheme.dart';
import 'helpers/uikit_helper_functions.dart';
import 'helpers/uikit_shadow_scheme.dart';
import 'helpers/uikit_size_scheme.dart';
import 'theme/uikit_theme.dart';
import 'uikit_checkbox.dart';
import 'helpers/uikit_icon_theme.dart';

class UIKitDropdownMenuItem<T> extends HookWidget {
  const UIKitDropdownMenuItem({
    super.key,
    required this.value,
    required this.onTap,
    this.label,
    this.trailing,
    this.children,
    required this.multiselect,
    required this.isSelected,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  }) : assert(
          multiselect ^ (trailing != null),
          'Either \'selectable\' is true and the widget has a checkbox or it has a trailing widget, not both.',
        );

  final T value;
  final VoidCallback onTap;
  final Widget? label;
  final Widget? trailing;
  final List<UIKitDropdownMenuItem<T>>? children;
  final bool multiselect;
  final bool isSelected;
  final UIKitColorScheme? colorScheme;
  final UIKitSizeScheme? sizeScheme;
  final UIKitShadowScheme? shadowScheme;

  @override
  Widget build(BuildContext context) {
    final state$ = useState(
      isSelected ? UIKitState.active : UIKitState.defaultState,
    );
    final isHovered$ = useState(false);
    final themeData$ = useState(UIKitTheme.of(context).menuItemThemeData);
    final colors$ = useState(define(colorScheme, themeData$.value.colorScheme));
    final size$ = useState(define(sizeScheme, themeData$.value.sizeScheme));
    final shadows$ =
        useState(define(shadowScheme, themeData$.value.shadowScheme));

    useEffect(() {
      state$.value = isSelected ? UIKitState.active : UIKitState.defaultState;
      return;
    }, [isSelected]);

    final colorHelper = findStateAttributes(
      colors$.value,
      shadows$.value,
      state$.value,
    );

    return MouseRegion(
      onHover: (e) {
        if (e.kind != PointerDeviceKind.touch) {
          isHovered$.value = true;
          state$.value = UIKitState.hover;
        }
      },
      onExit: (_) {
        isHovered$.value = false;
        state$.value = isSelected ? UIKitState.active : UIKitState.defaultState;
      },
      child: GestureDetector(
        onTap: () {
          state$.value = UIKitState.active;
          onTap.call();
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: size$.value.padding,
          decoration: BoxDecoration(
            color: colorHelper.backgroundColor ?? Colors.transparent,
            borderRadius: BorderRadius.circular(size$.value.borderRadius ?? 8),
            border: Border.all(
              color: colorHelper.borderColor ?? Colors.transparent,
              width: size$.value.borderSize ?? 0,
            ),
            boxShadow: colorHelper.shadows,
          ),
          child: Row(
            children: [
              if (multiselect) ...[
                IgnorePointer(
                  child: UIKitCheckbox(
                    isChecked: isSelected,
                    icon: const Icon(
                      Icons.check,
                      size: 12,
                    ),
                  ),
                ),
                SizedBox(width: size$.value.spacing),
              ],
              DefaultTextStyle(
                style: size$.value.labelStyle
                        ?.copyWith(color: colorHelper.contentColor) ??
                    const TextStyle(),
                child: label ?? const Text(''),
              ),
              if (trailing != null) ...[
                const Spacer(),
                UIKitIconTheme(
                  size: size$.value.trailingSize,
                  color: colorHelper.secondaryContentColor,
                  child: trailing!,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
