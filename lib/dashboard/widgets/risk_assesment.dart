import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tryst/dashboard/cubit/dashboard_cubit.dart';
class RiskAssesment extends StatelessWidget
{
    const RiskAssesment({super.key});
    @override
    Widget build(BuildContext context)
    {
        int? _riskLevel = context.select((DashboardCubit cubit) => cubit.state.riskLevel);
        if (_riskLevel == 0)
        {
            context.read<DashboardCubit>().updateRiskLevel();
        }
        final ColorScheme _scheme = Theme.of(context).colorScheme;
        final double _shortSide = MediaQuery.of(context).size.shortestSide * .7;
        return ConstrainedBox(
            constraints: BoxConstraints.tight(
                Size.square(_shortSide)
            ), 
            child: DecoratedBox(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, 
                    image: DecorationImage(
                        image: AssetImage('risk_circles.png'), 
                        fit: BoxFit.fitWidth,
                        opacity: 0.6)
                ),
                child: Container(
                    padding: EdgeInsets.only(top: 48),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        textBaseline: TextBaseline.ideographic,
                        children: [
                            SvgPicture.asset(
                                'shield_heart.svg', 
                                width: 32, 
                                height: 32,
                                colorFilter: ColorFilter.mode(_scheme.onSurface, BlendMode.srcIn),
                                fit:BoxFit.fitWidth
                                ),
                            Text('${context.select((DashboardCubit cubit) => cubit.state.riskLevel)}%', 
                                style: GoogleFonts.megrim(fontSize: 48, color: _scheme.onSurface, letterSpacing: 1.2, fontWeight: FontWeight.w100)
                            )
                        ]
                    )
                )
            )
        );
    }
}
