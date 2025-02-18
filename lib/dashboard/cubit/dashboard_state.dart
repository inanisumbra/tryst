part of 'dashboard_cubit.dart';

final class DashboardState extends Equatable {
  const DashboardState({
    this.focusDate = const ConstDateTime(2025),
    this.riskLevel = 0
  });

  final DateTime focusDate;
  final int? riskLevel;

  @override
  List<Object?> get props => [
    focusDate,
    riskLevel
  ];

  DashboardState copyWidth({
    DateTime? focusDate,
    int? riskLevel
  }) {
    return DashboardState(
      focusDate: focusDate ?? this.focusDate,
      riskLevel: riskLevel ?? this.riskLevel
    );
  }
}