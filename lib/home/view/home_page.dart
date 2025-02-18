// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:tryst/app/app.dart';
// import 'package:tryst/home/home.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   static Page<void> page() => const MaterialPage<void>(child: HomePage());

// ignore_for_file: unused_field

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
import 'package:google_fonts/google_fonts.dart';
import 'package:tryst/add_tryst/view/add_tryst_view.dart';
import 'package:tryst/app/app.dart';
import 'package:tryst/dashboard/view/dashboard_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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

  void switchToPage(index) {
    _pageController.animateToPage(index, duration: Duration(seconds: 1), curve: Curves.decelerate);
    _controller.jumpTo(index);
  }

  int maxCount = 5;
  final _today = DateTime.now();

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// widget list
    final List<Widget> bottomBarPages = [
      DashboardPage(switchToPage: switchToPage),
      const AddTrystView(),
      const Page3(),
    ];
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Welcome back ${context.select((AppBloc bloc) => bloc.state.user.name ?? 'Generic Bob')}...', style: GoogleFonts.megrim(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: colorScheme.tertiary.withAlpha(150)
        )),
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
              color: colorScheme.surface.withAlpha(200),
              textOverflow: TextOverflow.visible,
              maxLine: 1,
              shadowElevation: 3,
              kBottomRadius: 28.0,
              durationInMilliSeconds: 600,

              // notchShader: const SweepGradient(
              //   startAngle: 0,
              //   endAngle: pi / 2,
              //   colors: [Colors.red, Colors.green, Colors.orange],
              //   tileMode: TileMode.mirror,
              // ).createShader(Rect.fromCircle(center: Offset.zero, radius: 8.0)),
              notchColor: colorScheme.surface.withAlpha(200),

              /// restart app if you change removeMargins
              removeMargins: false,
              bottomBarWidth: MediaQuery.of(context).size.width,
              bottomBarHeight: 42,
              showShadow: false,

              itemLabelStyle: const TextStyle(fontSize: 10),
              showLabel: false,
              elevation: 1,
              bottomBarItems: [
                BottomBarItem(
                  inActiveItem: Icon(Icons.home_outlined,
                      color: colorScheme.tertiary.withAlpha(200), size: 24),
                  activeItem: Icon(Icons.home_outlined,
                      color: colorScheme.secondary, size: 24),
                  itemLabel: 'Dashboard',
                ),
                BottomBarItem(
                  inActiveItem: Icon(Icons.add_box_outlined,
                      color: colorScheme.tertiary.withAlpha(200), size: 24),
                  activeItem: Icon(Icons.add_box_outlined,
                      color: colorScheme.secondary, size: 24),
                  itemLabel: 'Tryst',
                ),
                BottomBarItem(
                  inActiveItem: Icon(Icons.manage_accounts_outlined,
                      color: colorScheme.tertiary.withAlpha(200), size: 24),
                  activeItem: Icon(Icons.manage_accounts_outlined,
                      color: colorScheme.secondary, size: 24),
                  itemLabel: 'Page 3',
                ),
              ],
              onTap: (index) {
                switchToPage(index);
              },
              kIconSize: 24.0,
            )
          : null,
    );
  }
}


class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blueGrey, child: const Center(child: Text('Page 3')));
  }
}
