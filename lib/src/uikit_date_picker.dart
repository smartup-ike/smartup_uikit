import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'helpers/uikit_calendar_button.dart';
import 'helpers/uikit_month_selector.dart';
import 'helpers/uikit_year_selector.dart';

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
    this.actions = const [],
  });

  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    final year$ = useState<int>(DateTime.now().year);
    final month$ = useState<int>(DateTime.now().month);
    final selectedDates$ = useState<List<DateTime?>>(
      List.filled(2, null),
    );
    final selectFirst$ = useState(true);
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
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
        boxShadow: const [],
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
                  child: MonthSelector(
                    onChanged: (value) => month$.value = value! + 1,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: UIKitYearSelector(
                    onChanged: (value) => year$.value = value! + 1,
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
                  6,
                  (rowIndex) {
                    return TableRow(
                      children: List.generate(
                        7,
                        (columnIndex) {
                          if (!(rowIndex == 0 && columnIndex == 0)) {
                            date = date.add(const Duration(days: 1));
                          }
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
            children: actions!,
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
}
