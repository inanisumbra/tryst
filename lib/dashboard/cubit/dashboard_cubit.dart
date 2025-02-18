
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:const_date_time/const_date_time.dart';
import 'package:equatable/equatable.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(const DashboardState());

  void focusDateChanged(DateTime? date) {
    emit(state.copyWidth(focusDate: date));
  }

  void updateRiskLevel() {
    final int risk = Random().nextInt(100);
    // Update with connection to user data riskLevel from algorithm data
    emit(state.copyWidth(riskLevel: risk));
  }
}