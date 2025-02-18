import 'package:google_fonts/google_fonts.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tryst/dashboard/cubit/dashboard_cubit.dart';
EasyThemeData _easyThemeDataFromContext(
    BuildContext context, ColorScheme _colorScheme)
{
    final _baseMonthYearThemeData = MonthYearThemeData(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.elliptical(4, 4))),
        backgroundColor: _colorScheme.surface.withAlpha(50),
        foregroundColor: _colorScheme.onSurface.withAlpha(70),
        border: BorderSide(color: _colorScheme.onSurface.withAlpha(70)));
    return EasyTheme.of(context)
        .copyWith(
            yearBackgroundColor:
            WidgetStatePropertyAll(_colorScheme.surface.withAlpha(50)))
        .copyWithState(
            unselectedDayTheme: DayThemeData(
                backgroundColor: _colorScheme.surface.withAlpha((60)),
                foregroundColor: _colorScheme.onSurface.withAlpha(100),
                border: BorderSide(color: Colors.transparent)),
            selectedDayTheme: DayThemeData(
                backgroundColor: _colorScheme.surface,
                foregroundColor: _colorScheme.secondary),
            disabledDayTheme: DayThemeData(
                backgroundColor: _colorScheme.surface.withAlpha(100),
                foregroundColor: _colorScheme.tertiary.withAlpha(50),
                border: BorderSide(color: _colorScheme.tertiary.withAlpha(50))),
            unselectedCurrentDayTheme: DayThemeData(
                backgroundColor: _colorScheme.surface.withAlpha(50),
                foregroundColor: _colorScheme.onSurfaceVariant,
                border: BorderSide(color: _colorScheme.onSurfaceVariant)),
            selectedCurrentDayTheme: DayThemeData(
                backgroundColor: _colorScheme.onSurfaceVariant.withAlpha(150),
                foregroundColor: _colorScheme.surfaceContainerHigh,
                border: BorderSide(color: Colors.transparent)),
            selectedMonthTheme: _baseMonthYearThemeData.copyWith(
                backgroundColor: _colorScheme.surface,
                foregroundColor: _colorScheme.secondary,
                border: BorderSide(color: Colors.transparent)),
            selectedYearTheme: _baseMonthYearThemeData.copyWith(
                backgroundColor: _colorScheme.surface,
                foregroundColor: _colorScheme.secondary,
                border: BorderSide(color: Colors.transparent)),
            unselectedCurrentMonthTheme: _baseMonthYearThemeData.copyWith(
                backgroundColor: _colorScheme.surface.withAlpha(50),
                foregroundColor: _colorScheme.onSurface.withAlpha(70),
                border: BorderSide(color: _colorScheme.onSurface.withAlpha(70))),
            unselectedYearTheme: _baseMonthYearThemeData.copyWith(
                backgroundColor: _colorScheme.surface.withAlpha(50),
                foregroundColor: _colorScheme.onSurface.withAlpha(70),
                border: BorderSide(color: _colorScheme.onSurface.withAlpha(70))),
            unselectedCurrentYearTheme: _baseMonthYearThemeData.copyWith(
                backgroundColor: _colorScheme.surface.withAlpha(50),
                foregroundColor: _colorScheme.onSurfaceVariant,
                border: BorderSide(color: _colorScheme.onSurfaceVariant)),
            selectedCurrentMonthTheme: _baseMonthYearThemeData.copyWith(
                backgroundColor: _colorScheme.onSurfaceVariant,
                foregroundColor: _colorScheme.surfaceContainerHigh,
                border: BorderSide(color: Colors.transparent)),
            selectedCurrentYearTheme: _baseMonthYearThemeData.copyWith(
                backgroundColor: _colorScheme.onSurfaceVariant,
                foregroundColor: _colorScheme.surfaceContainerHigh,
                border: BorderSide(color: Colors.transparent)),
            ignoreUserInteractionOnAnimating: true);
}
class Timeline extends StatelessWidget
{
    const Timeline({super.key});
    @override
    Widget build(BuildContext context)
    {
        final ColorScheme _colorScheme = Theme.of(context).colorScheme;
        final _controller = EasyDatePickerController();
        final _focusDate =
            context.select((DashboardCubit cubit) => cubit.state.focusDate);
        final DateTime _today = DateTime.now();
        final DateTime _firstDate = _today.subtract(Duration(days: 356));
        final DateTime _lastDate = _today.add(Duration(days: 2));
        return EasyTheme(
            data: _easyThemeDataFromContext(context, _colorScheme),
            child: EasyDateTimeLinePicker(
                controller: _controller,
                itemExtent: 64,
                firstDate: _firstDate,
                lastDate: _lastDate,
                currentDate: _today,
                focusedDate: _focusDate,
                monthYearPickerOptions: MonthYearPickerOptions(
                    initialCalendarMode: EasyDatePickerMode.month,
                    barrierColor: Colors.black54),
                selectionMode: SelectionMode.autoCenter(),
                headerOptions:
                HeaderOptions(headerBuilder: ( context, DateTime date,  onTap)
                    {
                        return InkWell(
                            onTap: onTap,
                            child: _HeaderRowItem(DateFormat.yMMMM().format(date),
                                isFirst: true));
                    }
                ),
                disableStrategy:
                DisableStrategy.after(_lastDate.add(Duration(days: 2))),
                timelineOptions:
                TimelineOptions(height: 80, padding: EdgeInsets.only(left: 16, right: 16, bottom: 16)),
                onDateChange: ( date) =>
                context.read<DashboardCubit>().focusDateChanged(date),
                dayElementsOrder: [DayElement.middle(), DayElement.bottom()]));
    }
}
class _HeaderRowItem extends StatelessWidget
{
    const _HeaderRowItem(this.str, {required this.isFirst});
    final String str;
    final bool isFirst;
    @override
    Widget build(BuildContext context)
    {
        final ColorScheme scheme = Theme.of(context).colorScheme;
        return Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            padding: EdgeInsets.symmetric(vertical: 12),
            width: 20,
            alignment: Alignment.centerLeft,
            child: Text(str,
                style: GoogleFonts.majorMonoDisplay(
                    textStyle: TextStyle(
                        letterSpacing: -1,
                        fontSize: 16,
                        fontWeight: FontWeight.w100,
                        decorationColor: scheme.onSurface.withAlpha(150),
                        color: scheme.onSurface.withAlpha(150)
                    )
                )
            )
        );
    }
}
