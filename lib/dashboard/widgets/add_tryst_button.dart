
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tryst/theme/globals.dart';

class AddTrystButton extends StatelessWidget {
  const AddTrystButton({super.key, this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
      final ColorScheme _scheme = Theme.of(context).colorScheme;
      return Container(
        clipBehavior: Clip.hardEdge,
        margin:EdgeInsets.only(top: 16),
        alignment: Alignment.center,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: MaterialButton(
          onPressed: onPressed, 
          color: Global.bgColorDark,
          height: 48,
          minWidth: 180,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side:BorderSide(color: _scheme.surfaceBright)
          ),
          clipBehavior: Clip.hardEdge,
          child: Text('Add A Tryst', style: GoogleFonts.majorMonoDisplay(color: _scheme.surfaceBright, fontSize: 18, fontWeight: FontWeight.bold))
          )
      );
  }
}