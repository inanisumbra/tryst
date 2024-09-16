import 'package:flutter/material.dart';
import 'package:polynectr/page/navigation/navigation1/coordinator.dart';

import 'const/string_const.dart';
import 'const/color_const.dart';
import 'const/page_str_const.dart';
import "page/page_const.dart";
import 'package:flutter/services.dart';
import 'dart:async';

import 'package:logging/logging.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sentry_logging/sentry_logging.dart';


// ATTENTION: Change the DSN below with your own to see the events in Sentry. Get one at sentry.io
const String sentry_dsn =
    'https://bf8e0a0d58aa841923a84e653c32f569@o4507716137582592.ingest.us.sentry.io/4507716166352896';


var _isIntegrationTest = false;

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  await setupSentry(
    () => runApp(
      SentryWidget(
        child: DefaultAssetBundle(
          bundle: SentryAssetBundle(),
          child: const MyApp(),
        ),
      ),
    ),
    sentry_dsn,
  );
}

Future<void> setupSentry(
  AppRunner appRunner,
  String dsn, {
  bool isIntegrationTest = false,
  BeforeSendCallback? beforeSendCallback,
}) async {
  await SentryFlutter.init(
    (options) {
      options.dsn = sentry_dsn;
      options.tracesSampleRate = 1.0;
      options.profilesSampleRate = 1.0;
      options.reportPackages = false;
      options.addInAppInclude('sentry_flutter_example');
      options.considerInAppFramesByDefault = false;
      options.attachThreads = true;
      options.enableWindowMetricBreadcrumbs = true;
      options.addIntegration(LoggingIntegration(minEventLevel: Level.INFO));
      options.sendDefaultPii = true;
      options.reportSilentFlutterErrors = true;
      options.attachScreenshot = true;
      options.screenshotQuality = SentryScreenshotQuality.low;
      options.attachViewHierarchy = true;
      // We can enable Sentry debug logging during development. This is likely
      // going to log too much for your app, but can be useful when figuring out
      // configuration issues, e.g. finding out why your events are not uploaded.
      options.debug = true;
      options.spotlight = Spotlight(enabled: true);
      options.enableTimeToFullDisplayTracing = true;
      options.enableMetrics = true;

      options.maxRequestBodySize = MaxRequestBodySize.always;
      options.maxResponseBodySize = MaxResponseBodySize.always;
      options.navigatorKey = navigatorKey;

      _isIntegrationTest = isIntegrationTest;
      if (_isIntegrationTest) {
        options.dist = '1';
        options.environment = 'integration';
        options.beforeSend = beforeSendCallback;
      }
    },
    // Init your App.
    appRunner: appRunner,
  );
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return MaterialApp(
      title: StringConst.APP_NAME,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: themeRed,
        hintColor: blueDeep,
        fontFamily: "Montserrat",
      ),
      home: const HomePage(),
      routes: {
        //PROFILE pages
        CHAT_PAGES[0]: (context) => const ChatPageOne(),
        PROFILE_PAGES[0]: (context) => const ProfilePageOne(),
        PROFILE_PAGES[1]: (context) => const ProfilePageTwo(),

        SIGN_UP_PAGES[0]: (context) => const SignPageOne(),
        SIGN_UP_PAGES[1]: (context) => const SignPageTwo(),
        SIGN_UP_PAGES[2]: (context) => const SignPageThree(),
        SIGN_UP_PAGES[3]: (context) => const SignPageFour(),
        SIGN_UP_PAGES[4]: (context) => const SignPageFive(),
        SIGN_UP_PAGES[5]: (context) => const SignPageSix(),
        SIGN_UP_PAGES[6]: (context) => const SignPageSeven(),
        SIGN_UP_PAGES[7]: (context) => const SignPageEight(),
        SIGN_UP_PAGES[8]: (context) => const SignPageNine(),
        SIGN_UP_PAGES[9]: (context) => const SignPageTeen(),
        SIGN_UP_PAGES[10]: (context) => const SignPageEleven(),

        ///FEED group page
        FEED_PAGES[0]: (context) => const FeedPageOne(),
        FEED_PAGES[1]: (context) => const FeedPageTwo(),
        FEED_PAGES[2]: (context) => const FeedThreePage(),
        FEED_PAGES[3]: (context) => const FeedPageFour(),
        FEED_PAGES[4]: (context) => const FeedFivePage(),
        FEED_PAGES[5]: (context) => const FeedPageTen(),
        FEED_PAGES[6]: (context) => const FeedPageEleven(),
        FEED_PAGES[7]: (context) => const FeedPageTwelve(),
        FEED_PAGES[8]: (context) => const FeedPageThirteen(),

        SHOPPING_PAGES[0]: (context) => const ShopPageEighteen(),
        SHOPPING_PAGES[1]: (context) => const ShopPageNineteen(),

        NAVIGATION_PAGES[0]: (context) => const NavigationOneCoordinator(),
        //FIXME there are other pages to jump with 'page_str_const.dart',there should be make by manager
      },
      onUnknownRoute: (setting) =>
          MaterialPageRoute(builder: (context) => const EmptyPage()),
    );
  }
}
