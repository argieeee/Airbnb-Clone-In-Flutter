import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../models/booking_steps.dart';

class SelectDateWidget extends StatelessWidget {
  const SelectDateWidget({
    Key? key,
    required this.step,
  }) : super(key: key);

  final BookingSteps step;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var expandedHeight = size.height - 112 - 60 - 32 - 16;

    return Card(
      elevation: 0.0,
      clipBehavior: Clip.antiAlias,
      child: AnimatedContainer(
        height: step == BookingSteps.selectDate ? expandedHeight : 60,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 16.0,
        ),
        duration: const Duration(milliseconds: 300),
        child: step == BookingSteps.selectDate
            ? SingleChildScrollView( // Wrap with SingleChildScrollView
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'When\'s your trip?',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              const SingleChoice(),
              const SizedBox(height: 16.0),
              const Calendar(),
              const SizedBox(height: 16.0),
              SizedBox(
                height: 48,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text('Exact dates'),
                    ),
                    const SizedBox(width: 8.0),
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text('± 1 day'),
                    ),
                    const SizedBox(width: 8.0),
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text('± 2 days'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      if (step == BookingSteps.selectDestination) {
                        // Handle skip action
                      } else {
                        // Handle other actions
                      }
                    },
                    child: const Text('Skip'),
                  ),
                  FilledButton(
                    onPressed: () {
                      // Handle Next button action
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: Theme.of(context)
                          .colorScheme
                          .secondary,
                      minimumSize: const Size(120, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text('Next'),
                  ),
                ],
              ),
            ],
          ),
        )
            : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'When',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Any week',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}


class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  CalendarState createState() => CalendarState();
}

class CalendarState extends State<Calendar> {
  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(
          () {
        if (args.value is PickerDateRange) {
          _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
              ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
        } else if (args.value is DateTime) {
          _selectedDate = args.value.toString();
        } else if (args.value is List<DateTime>) {
          _dateCount = args.value.length.toString();
        } else {
          _rangeCount = args.value.length.toString();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SfDateRangePicker(
      onSelectionChanged: _onSelectionChanged,
      selectionMode: DateRangePickerSelectionMode.range,
      initialSelectedRange: PickerDateRange(
        DateTime.now().subtract(const Duration(days: 4)),
        DateTime.now().add(
          const Duration(days: 3),
        ),
      ),
    );
  }
}

enum CalendarOptions { day, week, month, year }

class SingleChoice extends StatefulWidget {
  const SingleChoice({Key? key});

  @override
  State<SingleChoice> createState() => _SingleChoiceState();
}

class _SingleChoiceState extends State<SingleChoice> {
  CalendarOptions calendarView = CalendarOptions.day;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( // Wrap with SingleChildScrollView
      child: SegmentedButtonTheme(
        data: SegmentedButtonThemeData(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16.0,
              ),
            ),
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return Theme.of(context).colorScheme.secondary;
                }
                return Theme.of(context).colorScheme.surface;
              },
            ),
            foregroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return Theme.of(context).colorScheme.onSecondary;
                }
                return Theme.of(context).colorScheme.onSurface;
              },
            ),
            textStyle: MaterialStateProperty.resolveWith<TextStyle>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  );
                }
                return Theme.of(context).textTheme.bodyText1!;
              },
            ),
          ),
        ),
        child: SegmentedButton<CalendarOptions>(
          showSelectedIcon: false,
          segments: const <ButtonSegment<CalendarOptions>>[
            ButtonSegment<CalendarOptions>(
              value: CalendarOptions.day,
              label: Text('Dates'),
            ),
            ButtonSegment<CalendarOptions>(
              value: CalendarOptions.month,
              label: Text('Months'),
            ),
            ButtonSegment<CalendarOptions>(
              value: CalendarOptions.year,
              label: Text('Flexible'),
            ),
          ],
          selected: <CalendarOptions>{calendarView},
          onSelectionChanged: (Set<CalendarOptions> newSelection) {
            setState(() {
              calendarView = newSelection.first;
            });
          },
        ),
      ),
    );
  }
}