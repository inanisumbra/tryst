import 'package:flutter/material.dart';
import 'package:neumorphic_kit/neumorphic_kit.dart';
import 'package:tryst/home/widgets/liquid_model.dart';
import 'package:tryst/theme/globals.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
class Liquid extends StatelessWidget
{
    const Liquid({
        super.key,
        required this.isFlipped,
        required this.controller
    });

    final AnimationController controller;
    final bool isFlipped;

    @override
    Widget build(BuildContext context)
    {
        final model = Provider.of<LiquidModel>(context);
        final double height = 200.0;
        return Center(
            child: AnimatedContainer(
                duration: Duration(milliseconds: 2000),
                curve: Curves.elasticOut,
                transform: Matrix4.identity()
                ..translate(
                    0.0,
                    isFlipped ? -model.openValue - 100 : model.openValue + 100
                ),
                decoration: BoxDecoration(
                    color: Global.bgColorDark,
                    boxShadow: [
                        BoxShadow(
                            blurRadius: 30.0,
                            color: !isFlipped ? const Color.fromARGB(6, 21, 23, 30) : const Color.fromARGB(14, 29, 29, 31),
                            offset: Offset(isFlipped ? -2 : 2, isFlipped ? -3 : 3)
                        )
                    ],
                    borderRadius: BorderRadius.all(
                        Radius.circular(15.0)
                    )
                ),
                height: height,
                child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                        Transform(
                            transform: Matrix4.identity()
                            ..scale(1.0, isFlipped ? -1.0 : 1.0)
                            ..translate(0.0, isFlipped ? -height * 2 + 50 : -height + 50),
                            child: Lottie.asset(
                                'liquid.json',
                                controller: controller,
                                animate: false,
                                height: height,
                                delegates: LottieDelegates(
                                    values: [
                                        ValueDelegate.color(
                                            const ['**', 'Rectangle 1', 'Fill 1'],
                                            value: Global.bgColorDark
                                        // value: Colors.red
                                        ),
                                        ValueDelegate.color(const ['**', 'Shape 1', 'Fill 1'],
                                            value: Global.bgColorDark)
                                    // value: Colors.red)
                                    ]
                                )
                            )
                        ),
                        isFlipped
                            ? SizedBox()
                            : GestureDetector(
                                onTap: ()
                                {
                                    model.openLiquidMenu(controller);
                                },
                                child: NeumorphicCard(
                                    theme: NeumorphicTheme(
                                        baseColor:
                                        model.isOpening ? Global.activeColor : Global.bgColor,
                                        shadowDarkColor: Colors.black12,
                                        shadowLightColor: Colors.white10,
                                        depth: 3,
                                        lightSource: Offset.zero,
                                        intensity: 0.2
                                    ),
                                    borderRadius: 8,
                                    child: Icon(Icons.add,size: 36, color: model.isOpening ? Global.bgColor : Global.activeColor)
                                )
                            )
                    ]
                )
            )
        );
    }
}
