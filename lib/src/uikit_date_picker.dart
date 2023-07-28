import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smartup_uikit/smartup_uikit.dart';
import 'helpers/uikit_helper_functions.dart';
import 'helpers/uikit_color_scheme.dart';
import 'helpers/uikit_shadow_scheme.dart';
import 'helpers/uikit_size_scheme.dart';
import 'theme/uikit_theme.dart';
import 'helpers/uikit_calendar_button.dart';
import 'helpers/uikit_month_selector.dart';
import 'helpers/uikit_year_selector.dart';
import 'uikit_button.dart';

class UIKitDatePicker extends HookWidget {
  const UIKitDatePicker({
    super.key,
    this.isRangePicker = true,
    this.dropdownButtonTrailing,
    this.dropdownMenuItemTrailing,
    this.colorScheme,
    this.sizeScheme,
    this.shadowScheme,
    this.dateMustBeAfter,
    this.dateMustBeBefore,
  });

  final bool isRangePicker;
  final Widget? dropdownButtonTrailing;
  final Widget? dropdownMenuItemTrailing;
  final UIKitColorScheme? colorScheme;
  final UIKitSizeScheme? sizeScheme;
  final UIKitShadowScheme? shadowScheme;

  // dateMustBeAfter and dateMustBeBefore are set by the user if he wants to set a range of acceptable date.
  final DateTime? dateMustBeAfter;
  final DateTime? dateMustBeBefore;

  @override
  Widget build(BuildContext context) {
    // If the user gave as limits for the acceptable dates the we change the values of year$ and month$ to the beginning of the limit.
    // This is done so the calendar starts on the first month the user is allowed to select.
    final year$ = useState<int>(
        dateMustBeAfter != null ? dateMustBeAfter!.year : DateTime.now().year);
    final month$ = useState<int>(dateMustBeAfter != null
        ? dateMustBeAfter!.month
        : DateTime.now().month);
    final selectedDates$ = useState<List<DateTime?>>(
      List.filled(2, null, growable: true),
    );
    final selectFirst$ = useState(true);
    final themeData$ = useState(UIKitTheme.of(context).datePickerThemeData);
    final colors$ = useState(define(colorScheme, themeData$.value.colorScheme));
    final size$ = useState(define(sizeScheme, themeData$.value.sizeScheme));
    final shadows$ = useState(
      define(shadowScheme, themeData$.value.shadowScheme),
    );
    DateTime date = findDate(DateTime(year$.value, month$.value, 1), 1);

    // This function returns the onTap function of each calendar button.
    void Function(DateTime)? calendarButtonOnTap() {
      // If the user did specify a limit we check to see if the date in question is within limits.
      // This widget is grayed out / disabled if a null onTap is given.
      return (dateMustBeAfter != null && !date.isAfter(dateMustBeAfter!))
          ? null
          : (dateMustBeBefore != null && !date.isBefore(dateMustBeBefore!))
              ? null
              : date.month != month$.value
                  ? null
                  : isRangePicker
                      ? (newDate) {
                          selectFirst$.value
                              ? selectedDates$.value.first = newDate
                              : selectedDates$.value.last = newDate;
                          selectFirst$.value = !selectFirst$.value;
                          if (!selectedDates$.value.contains(null)) {
                            selectedDates$.value.sort(
                              (a, b) => a!.compareTo(b!),
                            );
                          }
                        }
                      : (newDate) => selectedDates$.value = [newDate];
    }

    Map<int, String> availableMonthsMap() {
      const monthsMap = {
        1: 'Ιανουάριος',
        2: 'Φεβρουάριος',
        3: 'Μάρτιος',
        4: 'Απρίλιος',
        5: 'Μάιος',
        6: 'Ιούνιος',
        7: 'Ιούλιος',
        8: 'Αύγουστος',
        9: 'Σεπτέμβριος',
        10: 'Οκτώβριος',
        11: 'Νοέμβριος',
        12: 'Δεκέμβριος',
      };

      if (dateMustBeAfter == null && dateMustBeBefore == null) {
        return monthsMap;
      }
      if (dateMustBeAfter != null && dateMustBeBefore != null) {
        if (year$.value != dateMustBeAfter!.year &&
            year$.value != dateMustBeBefore!.year) {
          return monthsMap;
        }
      }

      Map<int, String> temp = {};
      if (dateMustBeAfter != null && dateMustBeBefore == null) {
        monthsMap.forEach((key, value) {
          if (key >= dateMustBeAfter!.month) {
            temp[key] = value;
          }
        });
      } else if (dateMustBeAfter != null && dateMustBeBefore != null) {
        if (dateMustBeAfter!.year == dateMustBeBefore!.year &&
            dateMustBeBefore!.year == year$.value) {
          monthsMap.forEach((key, value) {
            if (key >= dateMustBeAfter!.month &&
                key <= dateMustBeBefore!.month) {
              temp[key] = value;
            }
          });
        } else if (dateMustBeAfter!.year == year$.value) {
          monthsMap.forEach((key, value) {
            if (key >= dateMustBeAfter!.month) {
              temp[key] = value;
            }
          });
        } else {
          monthsMap.forEach((key, value) {
            if (key <= dateMustBeBefore!.month) {
              temp[key] = value;
            }
          });
        }
      } else {
        monthsMap.forEach((key, value) {
          if (key <= dateMustBeBefore!.month) {
            temp[key] = value;
          }
        });
      }
      return temp;
    }

    final availableMonthsMap$ = useState(availableMonthsMap());
    return AnimatedContainer(
      //height: 250,
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
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 60,
                      child: Text(
                        "Έτος",
                        style: UIKitTheme.of(context).typography.body2Regular,
                      ),
                    ),
                    Expanded(
                      child: UIKitYearSelector(
                        dateMustBeAfter: dateMustBeAfter,
                        dateMustBeBefore: dateMustBeBefore,
                        onChanged: (value) {
                          year$.value = value!;
                          availableMonthsMap$.value = availableMonthsMap();
                        },
                        trailing: dropdownButtonTrailing,
                        itemTrailing: dropdownMenuItemTrailing,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    SizedBox(
                      width: 60,
                      child: Text(
                        "Μήνας",
                        style: UIKitTheme.of(context).typography.body2Regular,
                      ),
                    ),
                    Expanded(
                      child: UIKitMonthSelector(
                        initialValue: month$.value,
                        dateMustBeAfter: dateMustBeAfter,
                        onChanged: (value) => month$.value = value!,
                        trailing: dropdownButtonTrailing,
                        itemTrailing: dropdownMenuItemTrailing,
                        monthsMap: availableMonthsMap$.value,
                      ),
                    ),
                  ],
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
                  // For the calendarButtons the dimension needed was 6 : 5. Since i added day labels i changed it to 7 : 6.
                  isSixWeekMonth(year$.value, month$.value) ? 7 : 6,
                  (rowIndex) {
                    if (rowIndex == 0) {
                      List<String> days = ["Δ", "Τ", "Τ", "Π", "Π", "Σ", "Κ"];
                      return TableRow(
                          children: List.generate(7, (index) {
                        return MediaQuery(
                          data: MediaQuery.of(context).copyWith(
                            textScaleFactor: 1,
                          ),
                          child: TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(2),
                              child: Center(
                                child: Text(
                                  days[index],
                                  style: UIKitTheme.of(context)
                                      .typography
                                      .headings4Regular
                                      ?.copyWith(
                                        color: Colors.black,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }));
                    }
                    return TableRow(
                      children: List.generate(
                        7,
                        (columnIndex) {
                          if (!(rowIndex == 1 && columnIndex == 0)) {
                            date = date.add(const Duration(days: 1));
                          }
                          return MediaQuery(
                            data: MediaQuery.of(context).copyWith(
                              textScaleFactor: 1,
                            ),
                            child: TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              child: Padding(
                                padding: const EdgeInsets.all(2),
                                child: UIKitCalendarButton(
                                  date: date,
                                  isSelected:
                                      selectedDates$.value.contains(date),
                                  isBetweenSelected: isRangePicker
                                      ? selectedDates$.value.contains(null)
                                          ? false
                                          : date.isAfter(
                                                selectedDates$.value.first!,
                                              ) &&
                                              date.isBefore(
                                                selectedDates$.value.last!,
                                              )
                                      : false,
                                  onTap: calendarButtonOnTap(),
                                ),
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
          if (isRangePicker) ...[
            const SizedBox(height: 24),
            Row(
              children: [
                if (selectFirst$.value)
                  Icon(
                    Icons.arrow_right,
                    color: colors$.value.defaultContentColor,
                  ),
                const SizedBox(width: 4),
                Text(
                  'Από: ${(selectedDates$.value[0] ?? '').toString().split(' ')[0]}',
                  style: size$.value.labelStyle?.copyWith(
                    color: selectFirst$.value
                        ? colors$.value.defaultContentColor
                        : colors$.value.defaultContentColor?.withOpacity(0.7),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 2),
            Row(
              children: [
                if (!selectFirst$.value)
                  Icon(
                    Icons.arrow_right,
                    color: colors$.value.defaultContentColor,
                  ),
                const SizedBox(width: 4),
                Text(
                  'Έως: ${(selectedDates$.value[1] ?? '').toString().split(' ')[0]}',
                  style: size$.value.labelStyle?.copyWith(
                    color: selectFirst$.value
                        ? colors$.value.defaultContentColor?.withOpacity(0.7)
                        : colors$.value.defaultContentColor,
                  ),
                ),
              ],
            ),
          ],
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
                onTap: () {
                  selectedDates$.value.removeWhere((e) => e == null);
                  Navigator.of(context).pop(
                    selectedDates$.value,
                  );
                },
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