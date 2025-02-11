import 'package:commons/commons.dart';
import 'package:nrbtv/src/data/models/content/content.dart';
import 'package:nrbtv/src/ui/pages/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nrbtv/src/bloc/content_cubit/content_cubit.dart';
import 'package:nrbtv/src/ui/pages/home/phone_widgets/widgets.dart';
import 'package:nrbtv/src/ui/pages/pages.dart';
import 'package:nrbtv/src/ui/widgets/widgets.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:nrbtv/src/core/core.dart';

part 'phone_widgets/video_hero.dart';
part 'phone_widgets/image_hero.dart';
part 'phone_widgets/hero_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ScrollController _controller = ScrollController();

  @override
  void initState() {
    context.read<ContentCubit>().getHomeContent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContentCubit, ContentState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return AppStatusWidget(
          status: state.homePageStatus,
          loaderWidget: const Center(
            child: AppLoadingIndicator(size: 70),
          ),
          errorWidget: const CustomScrollView(slivers: [
            SliverFillRemaining(
              child: Center(
                child: Text('An error occurred'),
              ),
            ),
          ]),
          widget: RefreshIndicator.adaptive(
            onRefresh: () {
              context.read<ContentCubit>().getHomeContent();
              return Future.value();
            },
            child: CustomScrollView(
              controller: _controller,
              slivers: [
                if (!context.isTv)
                  BackdropAppBar(onPressed: () {
                    context.pushNamed(ProvidedSearchPage.path);
                  }),
                SliverList.list(
                  children: [
                    const DeviceWrapper(
                      widget: _HeroSection(),
                      tvWidget: Margins.vertical20,
                    ),
                    DeviceWrapper(
                      widget: HomePhoneView(
                        controller: _controller,
                      ),
                      tvWidget: HomeTvView(
                        controller: _controller,
                      ),
                    ),
                    const DeviceWrapper(
                      widget: SizedBox(height: 100),
                      tvWidget: SizedBox.shrink(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
