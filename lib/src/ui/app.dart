import 'package:commons/commons.dart';
import 'package:nrbtv/src/bloc/epg_cubit/epg_cubit.dart';
import 'package:nrbtv/src/data/data_sources/live_datasource/live_data_source.dart';
import 'package:nrbtv/src/data/models/content/tv_schedule_model.dart';
import 'package:nrbtv/src/data/repositories/epg/epg_repository.dart';
import 'package:nrbtv/src/ui/pages/search/search_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nrbtv/src/bloc/content_cubit/content_cubit.dart';
import 'package:nrbtv/src/bloc/search_page_filter/search_filter_bloc.dart';
import 'package:nrbtv/src/data/models/collection/collection_model.dart';
import 'package:nrbtv/src/data/models/content/content.dart';
import 'package:nrbtv/src/index.dart';
import 'package:nrbtv/src/ui/app_view.dart';
import 'package:nrbtv/src/ui/pages/collection_details/collection_details_page.dart';
import 'package:nrbtv/src/ui/pages/content_detail/content_detail_page.dart';
import 'package:nrbtv/src/ui/pages/see_all/see_all_page.dart';
import 'package:nrbtv/src/ui/pages/tv_search/tv_search_input_page.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:app_localization/app_localization.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return AppProvider(
      child: AppBlocProvider(
        child: Builder(
          builder: (context) {
            if (!context
                .read<DeviceModelService>()
                .isOrientationPortrait(context)) {
              SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                  overlays: []);
            } else {
              SystemChrome.setEnabledSystemUIMode(
                SystemUiMode.manual,
                overlays: SystemUiOverlay.values,
              );
            }
            return Shortcuts(
              shortcuts: <LogicalKeySet, Intent>{
                LogicalKeySet(LogicalKeyboardKey.select):
                    const ActivateIntent(),
              },
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                locale: context.select<LocalizationCubit, Locale>(
                  (c) => c.state.locale,
                ),
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                themeMode: ThemeMode.dark,
                darkTheme: _getTheme(context, Brightness.dark),
                initialRoute: SplashPage.path,
                onGenerateRoute: (settings) =>
                    onGenerateRoute(settings, context),
              ),
            );
          },
        ),
      ),
    );
  }
}

CupertinoPageRoute<dynamic> onGenerateRoute(
    RouteSettings settings, BuildContext context) {
  Widget page;

  try {
    switch (settings.name) {
      case TermsOfUsePage.path:
        page = const TermsOfUsePage();

      case ProvidedSearchPage.path:
        page = const ProvidedSearchPage();
      case SplashPage.path:
        page = const SplashPage();

      case LoginPage.path:
        page = BlocProvider<LoginCubit>(
          create: (context) {
            final AuthRepository authRepo = context.read<AuthRepository>();
            return LoginCubit(LoginUseCase(authRepo));
          },
          child: context.isTv ? const TvLoginPage() : const LoginPage(),
        );

      case OnboardingPage.path:
        page = const OnboardingPage();

      case SignUpPage.path:
        page = BlocProvider<SignUpCubit>(
          create: (ctx) {
            final AuthRepository authRepo = ctx.read<AuthRepository>();

            return SignUpCubit(SignUpUseCase(authRepo));
          },
          child: context.isTv ? const TvSignUpPage() : const SignUpPage(),
        );

      case CollectionDetailsPageProvider.path:
        final args = settings.arguments as Map<String, dynamic>;
        page = CollectionDetailsPageProvider(
          collectionModel: args['collectionModel'] as CollectionModel,
          collectionTitle: args['String'] as String?,
        );

      case AppView.path:
        page = MultiBlocProvider(
          providers: [
            BlocProvider<VodCubit>(
              create: (context) {
                final VodRepository repo = context.read<VodRepository>();
                return VodCubit(vodRepository: repo)
                  ..init()
                  ..fetchCategoryList()
                  ..fetchCountryList()
                  ..fetchHomeList();
              },
            ),
            BlocProvider<ChannelCubit>(
              create: (context) {
                final ChannelRepository repo = ChannelRepositoryImpl(
                  channelRemoteDataSource: ChannelRemoteDataSource(
                    context.read<CustomHTTPClient>(),
                  ),
                );
                return ChannelCubit(channelRepository: repo)..init();
              },
            ),
            BlocProvider<EpgCubit>(create: (context) {
              final EpgRepository repo = EpgRepositoryImpl(
                dataSource: LiveDataSource(
                  context.read<CustomHTTPClient>(),
                ),
              );
              return EpgCubit(repo: repo)
                ..getLive()
                ..getEpg(4);
            })
          ],
          child: const AppView(),
        );

      case MobileContentDetailPage.path:
        final args = settings.arguments as Map<String, dynamic>?;
        if (args == null) {
          page = const _ErrorPage('Missing navigation parameters');
        } else {
          final content = args['content'] as ContentModel?;
          if (content == null) {
            page = const Text('empty');
          } else {
            page = MobileContentDetailPage(content: content);
          }
        }

      case SeeAllPage.path:
        final args = settings.arguments as Map<String, dynamic>?;
        if (args == null) {
          page = const _ErrorPage('Missing navigation parameters');
        } else {
          final typeId = args['typeId'] as int?;
          final contentCubit = args['contentCubit'] as ContentCubit?;

          if (typeId == null || contentCubit == null) {
            page = const _ErrorPage('Invalid navigation parameters');
          } else {
            page = BlocProvider.value(
              value: contentCubit,
              child: SeeAllPage(typeId: typeId),
            );
          }
        }

      case ContentDetailPage.path:
        final args = settings.arguments as Map<String, dynamic>?;
        if (args == null) {
          page = const _ErrorPage('Missing navigation parameters');
        } else {
          final content = args['content'] as ContentModel?;
          if (content == null) {
            page = const Text('empty');
          } else {
            page = ContentDetailPage(video: content);
          }
        }

      case VideoPlayerPage.path:
        final args = settings.arguments as Map<String, dynamic>;
        final content = args['tvScheduleModel'] as TvScheduleModel;
        final isTrailer = args['isTrailer'] as bool;
        final epgCubit = args['epgCubit'] as EpgCubit;

        page = BlocProvider.value(
          value: epgCubit,
          child: VideoPlayerPage(
            isTrailer: isTrailer,
            video: content,
          ),
        );

      // case SubscribePage.path:
      //   page = const SubscribePage();

      case PrivacyPolicyPage.path:
        page = const PrivacyPolicyPage();

      case TermsOfUsePage.path:
        page = const TermsOfUsePage();

      case TvSearchInputPage.path:
        final Map<String, dynamic> args =
            settings.arguments as Map<String, dynamic>;
        page = BlocProvider.value(
          value: args['searchFilterBloc'] as SearchFilterBloc,
          child: const TvSearchInputPage(),
        );

      default:
        page = _ErrorPage('No route defined for ${settings.name}');
    }
  } catch (e) {
    debugPrint('Error in route generation: $e');
    page = _ErrorPage('Navigation error occurred: $e');
  }
  return CupertinoPageRoute<dynamic>(
    builder: (context) => page,
    settings: settings,
  );
}

class _ErrorPage extends StatelessWidget {
  final String message;

  const _ErrorPage(this.message);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(message),
      ),
    );
  }
}

ThemeData _getTheme(BuildContext context, Brightness b) {
  return ThemeData(
// focusColor: AppColors.greyscale[600],
    progressIndicatorTheme: Theme.of(context).progressIndicatorTheme.copyWith(
          color: Colors.black,
        ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: ZoomPageTransitionsBuilder(
          allowEnterRouteSnapshotting: false,
        ),
      },
    ),
    scaffoldBackgroundColor:
        context.select<AppCubit, bool>((value) => value.state.isDeviceTv)
            ? context.uiColors.tvSurface
            : context.uiColors.surface,
// this is a dynamic color depending on the theme mode
    fontFamily: 'Urbanist',
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: context.uiColors.onSecondary,
      selectionColor: context.uiColors.primary.withOpacity(0.08),
      selectionHandleColor: context.uiColors.primary,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: context.uiColors.primary,
      brightness: b,
    ),
    useMaterial3: true,
  );
}
