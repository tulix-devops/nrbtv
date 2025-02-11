import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nrbtv/src/bloc/bloc.dart';
import 'package:nrbtv/src/index.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:local_storage/local_storage.dart';
import 'package:nrbtv/src/ui/app_view.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({
    super.key,
  });

  static const path = '/';
  static const name = 'splash';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft
    ]);

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 3), () {
      _init();
    });
  }

  void _init() async {
    context
        .read<LocalStorage>()
        .init()
        .then((value) => context.read<AppCubit>().init())
        .then((_) {
      final bool isAuthenticated =
          context.read<AppCubit>().state.isAuthenticated;
      if (isAuthenticated) {
        Navigator.of(context).pushReplacementNamed(AppView.path);
        return;
      }

      Navigator.of(context).pushReplacementNamed(LoginPage.path);
    }).then((_) => context.read<LocalStorage>().delete(CacheKeys.contentList));

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.uiColors.surface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Image.asset(
            Assets.nrbLogo,
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 0.4,
          ),
          const Spacer(),
          const AppLoadingIndicator(size: 60),
          const Spacer(),
        ],
      ),
    );
  }
}

// class SplashPage extends StatefulWidget {
//   const SplashPage({super.key});

//   static const path = '/';
//   static const name = 'splash';

//   @override
//   State<SplashPage> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashPage> {
//   @override
//   void initState() {
//     super.initState();
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.portraitUp,
//     ]);

//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
//     Future.delayed(Durations.long2, _init);
//   }

//   void _init() async {
//     await context.read<LocalStorage>().init();

//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
//         overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
//     if (!mounted) return;

//     await context.read<AppCubit>().init();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: DecoratedBox(
//         decoration: BoxDecoration(
//           color: UiAppColors.onSecondary,
//         ),
//         child: Center(
//           child: SizedBox(
//               width: 120,
//               height: 120,
//               child: CircularProgressIndicator(
//                 color: Colors.black,
//               )),
//         ),
//       ),
//     );
//   }
// }
