import 'package:app_focus/app_focus.dart';
import 'package:commons/commons.dart';
import 'package:nrbtv/src/bloc/epg_cubit/epg_cubit.dart';
import 'package:nrbtv/src/data/models/content/live_model.dart';
import 'package:nrbtv/src/data/models/content/tv_schedule_model.dart';
import 'package:nrbtv/src/index.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppView extends StatefulWidget {
  static const path = '/home';
  static const name = 'app-view';
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  late final Map<int, Widget> pages;

  late final LiveModel? live;

  @override
  void initState() {
    live = context.read<EpgCubit>().state.live;
    pages = {
      BottomBarTab.archive.index: const HomePage(
        key: PageStorageKey('home_page'),
      ),
      BottomBarTab.account.index: BlocProvider<ProfileCubit>(
        key: const ValueKey('account'),
        create: (ctx) {
          final ProfileRepository repo = ProfileRepositoryImpl(
            profileRemoteDataSource: ProfileRemoteDataSource(
              ctx.read<CustomHTTPClient>(),
            ),
          );
          return ProfileCubit(
            getAuthTokenUseCase:
                GetAuthTokenUseCase(ctx.read<AuthRepository>()),
            profileRepository: repo,
          );
        },
        child: const ProfilePage(),
      ),
      BottomBarTab.live.index: BlocBuilder<EpgCubit, EpgState>(
        builder: (context, state) {
          final live = state.live;
          if (live == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return VideoPlayerPage(
            isTrailer: false,
            video: TvScheduleModel(
              id: 21,
              start: '',
              end: '',
              name: live.title,
              link: live.sources.getPreferredVideoSource() ?? '',
              thumbnail: live.images.getBanner(),
              isFuture: false,
            ),
            key: const PageStorageKey('page_content'),
          );
        },
      )
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final int index = context.select<AppCubit, int>(
      (cubit) => cubit.state.currentTab.index,
    );

    if (kDebugMode) {
      assert(pages[index] != null,
          'Add BottomBarTabIndex to map if you add page to app or tab to enum');
    }

    return AppAuthDialogListener(
      child: AppFocusGroup(
        child: AppScaffold(
          hasNavbar: true,
          body: AnimatedSwitcher(
            duration: Durations.short4,
            transitionBuilder: (Widget child, Animation<double> animation) {
              print('is tv ${context.isTv}');
              final Offset tvOffset = context.read<AppCubit>().state.canPop
                  ? const Offset(1, 0)
                  : const Offset(0, 1);

              const Offset offset = Offset(1, 0);
              return SlideTransition(
                position: Tween<Offset>(
                  begin: context.isTv ? tvOffset : offset,
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
            child: pages[index]!,
          ),
        ),
      ),
    );
  }
}
