import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tryst/app/app.dart';

class Timeline extends StatefulWidget {
  const Timeline({super.key});
  @override
  State<Timeline> createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  DateTime _selectedDate = DateTime.now();
  late final EasyDatePickerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = EasyDatePickerController();
  }

  @override
  void dispose() {
    // do not forget to dispose the controller
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme _colorScheme = Theme.of(context).colorScheme;
    final _creationTime = context.select((AppBloc bloc) => bloc.state.user.metadata?.creationTime); 
    return Theme(
      data: Theme.of(context),
      child: Builder(
        builder: (context) {
          return EasyTheme(
            data: EasyTheme.of(context).copyWith(
              dayBorder: WidgetStatePropertyAll(
                BorderSide(color: _colorScheme.secondary)
              ),
              dayForegroundColor: WidgetStatePropertyAll(_colorScheme.secondary)
            ),
            child: EasyDateTimeLine(
              initialDate: _creationTime as DateTime,
              onDateChange: (selectedDate) {
                setState(() {
                  _selectedDate = selectedDate;
                });
              },
              activeColor: _colorScheme.primary,
              headerProps: EasyHeaderProps(
                monthPickerType: MonthPickerType.dropDown,
                dateFormatter: DateFormatter.monthOnly(),
                monthStyle:TextStyle(color: _colorScheme.tertiary),
              ),
              dayProps: EasyDayProps(
                dayStructure: DayStructure.dayNumberOnly,
                borderColor:_colorScheme.tertiary,
                activeDayStyle: DayStyle(
                  borderRadius: 12.0,
                  dayNumStyle: TextStyle(color: _colorScheme.secondary, fontWeight: FontWeight.bold, fontSize: 18),
                ),
                inactiveDayStyle: DayStyle(
                  borderRadius: 12.0,
                  dayNumStyle: TextStyle(color: _colorScheme.tertiary, fontSize: 18),
                  ),
                )
              
              
              
            ),
          );
        },
      ),
    );
  }
}