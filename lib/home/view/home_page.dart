// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:tryst/app/app.dart';
// import 'package:tryst/home/home.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   static Page<void> page() => const MaterialPage<void>(child: HomePage());

//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;
//     final user = context.select((AppBloc bloc) => bloc.state.user);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home'),
//         actions: <Widget>[
//           IconButton(
//             key: const Key('homePage_logout_iconButton'),
//             icon: const Icon(Icons.exit_to_app),
//             onPressed: () {
//               context.read<AppBloc>().add(const AppLogoutPressed());
//             },
//           ),
//         ],
//       ),
//       body: Align(
//         alignment: const Alignment(0, -1 / 3),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             const Background(),
//             Avatar(photo: user.photo),
//             const SizedBox(height: 12),
//             Text(user.email ?? '', style: textTheme.titleLarge),
//             const SizedBox(height: 4),
//             Text(user.name ?? '', style: textTheme.headlineSmall),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tryst/app/app.dart';
import 'package:tryst/home/widgets/timeline.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static Page<void> page() => const MaterialPage<void>(child: HomePage());

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 0);

  /// Controller to handle bottom nav bar and also handles initial page
  final NotchBottomBarController _controller =
      NotchBottomBarController(index: 0);

  int maxCount = 5;

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// widget list
    final List<Widget> bottomBarPages = [
      Page1(
        controller: (_controller),
      ),
      const Page2(),
      const Page3(),
    ];
    final ColorScheme _colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: <Widget>[
          IconButton(
            key: const Key('homePage_logout_iconButton'),
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              context.read<AppBloc>().add(const AppLogoutPressed());
            },
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
              /// Provide NotchBottomBarController
              notchBottomBarController: _controller,
              color: _colorScheme.primary,
              textOverflow: TextOverflow.visible,
              maxLine: 1,
              shadowElevation: 5,
              kBottomRadius: 28.0,
              durationInMilliSeconds: 600,

              // notchShader: const SweepGradient(
              //   startAngle: 0,
              //   endAngle: pi / 2,
              //   colors: [Colors.red, Colors.green, Colors.orange],
              //   tileMode: TileMode.mirror,
              // ).createShader(Rect.fromCircle(center: Offset.zero, radius: 8.0)),
              notchColor: _colorScheme.primary,

              /// restart app if you change removeMargins
              removeMargins: false,
              bottomBarWidth: 500,
              bottomBarHeight: 48,
              showShadow: false,

              itemLabelStyle: const TextStyle(fontSize: 10),
              showLabel: false,
              elevation: 1,
              bottomBarItems: [
                BottomBarItem(
                  inActiveItem: Icon(Icons.home_outlined,
                      color: _colorScheme.tertiary, size: 24),
                  activeItem: Icon(Icons.home_outlined,
                      color: _colorScheme.secondary, size: 24),
                  itemLabel: 'Page 1',
                ),
                BottomBarItem(
                  inActiveItem: Icon(Icons.add_box_outlined,
                      color: _colorScheme.tertiary, size: 24),
                  activeItem: Icon(Icons.add_box_outlined,
                      color: _colorScheme.secondary, size: 24),
                  itemLabel: 'Page 2',
                ),
                BottomBarItem(
                  inActiveItem: Icon(Icons.manage_accounts_outlined,
                      color: _colorScheme.tertiary, size: 24),
                  activeItem: Icon(Icons.manage_accounts_outlined,
                      color: _colorScheme.secondary, size: 24),
                  itemLabel: 'Page 3',
                ),
              ],
              onTap: (index) {
                _pageController.jumpToPage(index);
              },
              kIconSize: 24.0,
            )
          : null,
    );
  }
}

/// add controller to check weather index through change or not. in page 1
class Page1 extends StatelessWidget {
  final NotchBottomBarController? controller;

  const Page1({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    

    return Container(
      color: Colors.black87,
      child: Center(
        /// adding GestureDetector
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            controller?.jumpTo(2);
          },
          child: Column(
            mainAxisSize:MainAxisSize.max,
            children: [
              Timeline()
            ]
          ),
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blueGrey, child: const Center(child: Text('Page 2')));
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blueGrey, child: const Center(child: Text('Page 3')));
  }
}
