import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smartup_uikit/smartup_uikit.dart';

import 'date_selector.dart';

class DatePicker extends HookWidget {
  const DatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    final date$ = useState("Επιλέξτε Ημερομηνία");

    void selectRange(value) {
      date$.value = value.toString();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: UIKitTheme.of(context).colors.primary800,
        title: const Text("UIKit Date Picker"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Center(
            child: Column(
              children: [
                Text(date$.value,
                    style: UIKitTheme.of(context).typography.headings3Bold),
                const SizedBox(height: 16),
                SizedBox(
                  height: 80,
                  width: 400,
                  child: DateSelector(
                    onChanged: (value) => selectRange(value),
                    dateMustBeFrom: DateTime(DateTime.now().year,
                        DateTime.now().month,1, 0, 0),
                    dateMustBeUntil: DateTime(2025),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}