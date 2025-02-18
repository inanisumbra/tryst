import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tryst/dashboard/cubit/dashboard_cubit.dart';
import 'package:tryst/dashboard/widgets/widgets.dart';
import 'package:tryst/theme/globals.dart';


class DashboardPage extends StatelessWidget
{
    const DashboardPage({super.key, required this.switchToPage});
    final void Function(int index) switchToPage;

    @override
    Widget build(BuildContext context)
    {
        return BlocProvider(
            create: ( _) => DashboardCubit(), 
            child: Container(
                padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 16),
                color: Global.bgColorDark,
                child: Column(mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 4,
                    children: [
                        Timeline(),
                        RiskAssesment(),
                        AddTrystButton(onPressed: () {
                          switchToPage(1);
                        }),
                        Insights()
                    ])
            ));
    }
}
