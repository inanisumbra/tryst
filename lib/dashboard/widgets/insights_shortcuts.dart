import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Insights extends StatelessWidget {
  const Insights({super.key});
  @override
  Widget build(BuildContext context) {
    final List<Widget> insightShortcuts = List.generate(_insightProps.length, (index) {
      final _insightShortcutProps = _insightProps[index];
      return InsightShortcut(insightLabel: _insightShortcutProps.insightLabel, insightIcon: _insightShortcutProps.insightIcon);
    });
    
    final ColorScheme _scheme = Theme.of(context).colorScheme;
    return Container(
      constraints: BoxConstraints.tight(Size.fromHeight(175)),
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Insights',
              style: GoogleFonts.megrim(
                  color: _scheme.onSurface.withAlpha(150),
                  decoration: TextDecoration.overline,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  letterSpacing: 1)),
          Row(
              spacing: 4,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: insightShortcuts)
        ])
    );
  }
}

class InsightShortcut extends StatelessWidget {
  const InsightShortcut(
      {super.key, this.insightIcon, required this.insightLabel});
  final IconData? insightIcon;
  final String insightLabel;
  @override
  Widget build(BuildContext context) {
    final ColorScheme _scheme = Theme.of(context).colorScheme;
    final double _shortThird =
        (MediaQuery.of(context).size.shortestSide * .75) / 3;
    return InkWell(
        borderRadius: BorderRadius.circular(8),
        child: Container(
            constraints: BoxConstraints.tight(Size.square(_shortThird)),
            decoration: BoxDecoration(
              color: _scheme.surface.withAlpha(200),
                borderRadius: BorderRadius.circular(8),
                boxShadow: kElevationToShadow[3]!
                    .map((BoxShadow shadow) =>
                        shadow.copyWith(blurStyle: BlurStyle.outer))
                    .toList()),
            child: Column(
                spacing: 8,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(insightIcon, size: 32, color: _scheme.secondary),
                  Text(insightLabel.toUpperCase(),
                      style: GoogleFonts.lato(fontSize: 16, letterSpacing: -1, color: _scheme.secondary))
                ])));
  }
}

class InsightProp {
  final String insightLabel;
  final IconData insightIcon;
  const InsightProp({required this.insightLabel, required this.insightIcon});
}

const List<InsightProp> _insightProps = [
  InsightProp(
      insightLabel: "Recent", insightIcon: IconData(0xf085a, fontFamily: 'MaterialIcons')),
  InsightProp(
      insightLabel: "Explore", insightIcon: IconData(0xe248, fontFamily: 'MaterialIcons')),
  InsightProp(
      insightLabel: "Chat", insightIcon: IconData(0xf0539, fontFamily: 'MaterialIcons'))
];
