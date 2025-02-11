import 'package:app_localization/app_localization.dart';
import 'package:commons/commons.dart';
import 'package:nrbtv/src/ui/app_view.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:local_storage/local_storage.dart';
import 'package:nrbtv/src/bloc/bloc.dart';
import 'package:nrbtv/src/core/core.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:nrbtv/src/data/data_sources/ad/ad_remote_data_source.dart';

import '../../data/data.dart';

class AppProvider extends StatefulWidget {
  const AppProvider({super.key, required this.child});

  final Widget child;
  @override
  State<AppProvider> createState() => _AppProviderState();
}

class _AppProviderState extends State<AppProvider> {
  final LocalStorage _localStorage = HiveLocalStorage();
  late final LocalAuthDataSource _localAuthDataSource =
      LocalAuthDataSource(_localStorage);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<CustomHTTPClient>(
          create: (ctx) => CustomHTTPClient(_localAuthDataSource),
        ),
        RepositoryProvider.value(
          value: _localStorage,
        ),
        RepositoryProvider<AuthRepository>(
          create: (ctx) {
            return AuthRepositoryImpl(
              localAuthDataSource: _localAuthDataSource,
              remoteAuthDataSource: RemoteAuthDataSource(
                ctx.read<CustomHTTPClient>(),
              ),
            );
          },
        ),
        RepositoryProvider<OnboardingRepository>(
          create: (ctx) {
            return OnboardingRepositoryImpl(
              onboardingRemoteDataSource: OnboardingRemoteDataSource(
                ctx.read<CustomHTTPClient>(),
              ),
              onboardingLocalDataSource:
                  OnboardingLocalDataSource(_localStorage),
            );
          },
        ),
        RepositoryProvider<VodRepository>(
          create: (ctx) {
            return VodRepositoryImpl(
              vodRemoteDataSource: VodRemoteDataSource(
                ctx.read<CustomHTTPClient>(),
              ),
              vodLocalDataSource: VodLocalDataSource(_localStorage),
            );
          },
        ),
        RepositoryProvider<DeviceModelService>(
          create: (ctx) => DeviceModelService(),
        ),
        // RepositoryProvider<FirebaseService>(
        //   lazy: false,
        //   create: (ctx) =>
        //       FirebaseService(getAuthTokenUseCase: GetAuthTokenUseCase(ctx.read<AuthRepository>()))..initialize(),
        // ),
      ],
      child: widget.child,
    );
  }
}

class AppBlocProvider extends StatelessWidget {
  const AppBlocProvider({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LocalizationCubit>(
          create: (ctx) {
            final LocalLocalizationDataSource dataSource =
                LocalLocalizationDataSource(ctx.read<LocalStorage>());
            final LocalizationRepository repo =
                LocalizationRepositoryImpl(dataSource);

            return LocalizationCubit(
              getLocaleUseCase: GetLocaleUseCase(localizationRepository: repo),
              setLocaleUseCase: SetLocaleUseCase(localizationRepository: repo),
            );
          },
        ),
        BlocProvider<VideoPlayerCubit>(
          create: (context) {
            return VideoPlayerCubit(
              getAuthTokenUseCase:
                  GetAuthTokenUseCase(context.read<AuthRepository>()),
              adRepository: AdRepositoryImpl(
                adRemoteDataSource: AdRemoteDataSource(
                  context.read<CustomHTTPClient>(),
                ),
              ),
            );
          },
        ),
        BlocProvider<AppCubit>(create: (ctx) {
          final AuthRepository repo = ctx.read<AuthRepository>();

          return AppCubit(
            getAuthTokenUseCase: GetAuthTokenUseCase(repo),
            onboardingRepository: ctx.read<OnboardingRepository>(),
            profileRepository: ProfileRepositoryImpl(
              profileRemoteDataSource: ProfileRemoteDataSource(
                ctx.read<CustomHTTPClient>(),
              ),
            ),
            logoutUseCase: LogoutUseCase(repo),
            authStatusUseCase: AuthStatusUseCase(repo),
          );
        }),
        BlocProvider<NotificationBannerCubit>(
          create: (context) => NotificationBannerCubit(),
        ),
      ],
      child: BlocListener<AppCubit, AppState>(
        // Trigger router refresh for redirections on auth state or app init state changes
        // Logic is stored in gorouter redirector
        listenWhen: (previous, current) =>
            previous.isInitialized != current.isInitialized ||
            previous.isAuthenticated != current.isAuthenticated,
        listener: (context, state) {
          if (!state.isInitialized) return;

          if (state.isAuthenticated && state.shouldNavigateToPaymentPage) {
            context.read<AppCubit>().hideDialog();
            context.read<AppCubit>().initUser();

            if (state.isAuthenticated) {
              context.read<AppCubit>().changeTab(BottomBarTab.home);
              context.goNamed(AppView.path);
            }

            // if (!Platform.isIOS) {
            //   router.goNamed(SubscribePage.name);
            // }

            return;
          }
        },
        child: ThemeColorListener(
          child: child,
        ),
      ),
    );
  }
}
