import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'helpers/uikit_helper_functions.dart';
import 'helpers/uikit_color_scheme.dart';
import 'helpers/uikit_shadow_scheme.dart';
import 'helpers/uikit_size_scheme.dart';
import 'theme/uikit_theme.dart';
import 'helpers/uikit_calendar_button.dart';
import 'helpers/uikit_month_selector.dart';
import 'helpers/uikit_year_selector.dart';
import 'uikit_button.dart';

const daysList = [
  'Δ',
  'Τ',
  'Τ',
  'Π',
  'Π',
  'Σ',
  'Κ',
];

class UIKitDatePicker extends HookWidget {
  const UIKitDatePicker({
    super.key,
    required this.onChanged,
    this.dropdownButtonTrailing,
    this.dropdownMenuItemTrailing,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
  });

  final ValueChanged<List<DateTime?>> onChanged;
  final Widget? dropdownButtonTrailing;
  final Widget? dropdownMenuItemTrailing;
  final UIKitColorScheme? colorScheme;
  final UIKitSizeScheme? sizeScheme;
  final UIKitShadowScheme? shadowScheme;

  @override
  Widget build(BuildContext context) {
    final year$ = useState<int>(DateTime.now().year);
    final month$ = useState<int>(DateTime.now().month);
    final selectedDates$ = useState<List<DateTime?>>(List.filled(2, null));
    final selectFirst$ = useState(true);
    final themeData$ = useState(UIKitTheme.of(context).datePickerThemeData);
    final colors$ = useState(define(colorScheme, themeData$.value.colorScheme));
    final size$ = useState(define(sizeScheme, themeData$.value.sizeScheme));
    final shadows$ = useState(
      define(shadowScheme, themeData$.value.shadowScheme),
    );
    DateTime date = findDate(
      DateTime(
        year$.value,
        month$.value,
        1,
      ),
      1,
    );

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: size$.value.padding,
      decoration: BoxDecoration(
        color: colors$.value.defaultBackgroundColor,
        borderRadius: BorderRadius.circular(size$.value.borderRadius ?? 8),
        border: Border.all(
          color: colors$.value.defaultBorderColor ?? Colors.transparent,
          width: size$.value.borderSize ?? 0,
        ),
        boxShadow: shadows$.value.defaultShadow,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            child: Row(
              children: [
                Expanded(
                  child: UIKitMonthSelector(
                    onChanged: (value) => month$.value = value!,
                    trailing: dropdownButtonTrailing,
                    itemTrailing: dropdownMenuItemTrailing,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: UIKitYearSelector(
                    onChanged: (value) => year$.value = value!,
                    trailing: dropdownButtonTrailing,
                    itemTrailing: dropdownMenuItemTrailing,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Table(
                defaultColumnWidth: const FixedColumnWidth(50),
                border: TableBorder.symmetric(
                  inside: BorderSide.none,
                  outside: BorderSide.none,
                ),
                children: List.generate(
                  isSixWeekMonth(year$.value, month$.value) ? 6 : 5,
                  (rowIndex) {
                    return TableRow(
                      children: List.generate(
                        7,
                        (columnIndex) {
                          if (!(rowIndex == 0 && columnIndex == 0)) {
                            date = date.add(const Duration(days: 1));
                          }
                          // print('Date: ${date.toString()}');
                          // print('isDisabled: ${date.month != month$.value}');
                          // print(
                          //     'isSelected: ${selectedDates$.value.contains(date)}');
                          // print(
                          //     'isBetweenSelected: ${selectedDates$.value.contains(null) ? false : date.isAfter(
                          //           selectedDates$.value.first!,
                          //         ) && date.isBefore(
                          //           selectedDates$.value.last!,
                          //         )}');
                          // print('\n');
                          return TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: const EdgeInsets.all(2),
                              child: UIKitCalendarButton(
                                date: date,
                                isSelected: selectedDates$.value.contains(date),
                                isBetweenSelected:
                                    selectedDates$.value.contains(null)
                                        ? false
                                        : date.isAfter(
                                              selectedDates$.value.first!,
                                            ) &&
                                            date.isBefore(
                                              selectedDates$.value.last!,
                                            ),
                                onTap: date.month != month$.value
                                    ? null
                                    : (newDate) {
                                        selectFirst$.value
                                            ? selectedDates$.value.first =
                                                newDate
                                            : selectedDates$.value.last =
                                                newDate;
                                        selectFirst$.value =
                                            !selectFirst$.value;
                                        if (!selectedDates$.value
                                            .contains(null)) {
                                          selectedDates$.value.sort(
                                            (a, b) => a!.compareTo(b!),
                                          );
                                        }
                                        print(selectedDates$.value.toString());
                                      },
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UIKitButton.smallGhost(
                labelText: const Text('Ακύρωση'),
                onTap: () => Navigator.of(context).pop(),
              ),
              const SizedBox(width: 8),
              UIKitButton.smallPrimary(
                labelText: const Text('Αποθήκευση'),
                onTap: () => Navigator.of(context).pop(selectedDates$.value),
              ),
            ],
          ),
        ],
      ),
    );
  }

  DateTime findDate(DateTime date, int weekday) {
    return date.weekday == weekday
        ? date
        : date.subtract(Duration(days: (date.weekday - weekday).abs()));
  }

  bool isSixWeekMonth(int year, int month) {
    DateTime date = DateTime(year, month, 1);
    if (date.weekday >= DateTime.saturday &&
        [1, 3, 5, 7, 8, 10, 12].contains(month)) {
      return true;
    }
    if (date.weekday == DateTime.sunday && month != DateTime.february) {
      return true;
    }
    return false;
  }
}
