import 'package:app_focus/app_focus.dart';
import 'package:commons/commons.dart';
import 'package:nrbtv/src/bloc/epg_cubit/epg_cubit.dart';
import 'package:nrbtv/src/data/data_sources/live_datasource/live_data_source.dart';
import 'package:nrbtv/src/data/repositories/epg/epg_repository.dart';
import 'package:nrbtv/src/index.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nrbtv/src/bloc/content_cubit/content_cubit.dart';
import 'package:nrbtv/src/bloc/search_page_filter/search_filter_bloc.dart';
import 'package:local_storage/local_storage.dart';

import 'pages/content/content_page.dart';

class AppView extends StatefulWidget {
  static const path = '/home';
  static const name = 'app-view';
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  late final Map<int, Widget> pages;

  @override
  void initState() {
    pages = {
      // BottomBarTab.search.index: BlocProvider<SearchFilterBloc>(
      //   key: const ValueKey('search'),
      //   create: (ctx) {
      //     final ContentRepository repo = ContentRepositoryImpl(
      //         contentRemoteRepository:
      //             ContentRemoteDataSource(ctx.read<CustomHTTPClient>()));
      //     return SearchFilterBloc(contentRepository: repo);
      //   },
      //   child: const TvSearchPage(),
      // ),
      BottomBarTab.archive.index: MultiBlocProvider(
        key: const ValueKey('home'),
        providers: [
          BlocProvider<EpgCubit>(
            create: (context) => EpgCubit(
              repo: EpgRepositoryImpl(
                dataSource: LiveDataSource(context.read<CustomHTTPClient>()),
              ),
            )..getEpg(4),
          ),
        ],
        child: const HomePage(),
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
      BottomBarTab.live.index: BlocProvider<EpgCubit>(
        key: const ValueKey('live'),
        create: (ctx) => EpgCubit(
          repo: EpgRepositoryImpl(
            dataSource: LiveDataSource(context.read<CustomHTTPClient>()),
          ),
        )..getLive(),
        child: ContentPage(
          contentTypeIndex: ContentType.channel.value,
        ),
      ),
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
