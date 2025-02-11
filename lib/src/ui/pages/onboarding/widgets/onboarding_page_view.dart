import 'package:commons/shared/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nrbtv/src/index.dart';
import 'package:nrbtv/src/ui/pages/onboarding/widgets/widgets.dart';
import 'package:ui_kit/widgets/app_loading_indicator.dart';

class OnboardingPageView extends StatefulWidget {
  const OnboardingPageView({super.key});

  @override
  State<OnboardingPageView> createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends State<OnboardingPageView> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnboardingCubit, OnboardingState>(
      listenWhen: _listenWhen,
      listener: (_, state) => _animateToPage(state.pageIndex),
      builder: (_, state) {
        return AppStatusWidget(
          status: state.status,
          loaderWidget: const Center(
            child: AppLoadingIndicator(size: 70),
          ),
          errorWidget: const Center(
            child: Text('An error occurred'),
          ),
          widget: Stack(
            children: [
              PageView(
                controller: _pageController,
                pageSnapping: true,
                onPageChanged: _onSwipe,
                children: state.onboardingTabList
                    .map(
                      (e) => OnboardingTab(
                        title: e.name,
                        subTitle: e.description,
                      ),
                    )
                    .toList(),
              ),
              Positioned(
                bottom: 100,
                left: 0,
                right: 0,
                child: PageIndicator(),
              ),
              const _OnboardingButton(),
            ],
          ),
        );
      },
    );
  }

  /// When the page index has changed, isNavigating with click and is not loading
  bool _listenWhen(OnboardingState previous, OnboardingState current) =>
      current.pageIndex != previous.pageIndex &&
      current.status == Status.navigatingWithClick &&
      _pageController.hasClients &&
      current.status != Status.loading;

  /// OnPageChanged
  void _onSwipe(int index) =>
      context.read<OnboardingCubit>().isNavigatingWithClick
          ? null
          : context.read<OnboardingCubit>().onPageChanged(index);

  /// Navigate with PageController
  void _animateToPage(int pageIndex) => _pageController
      .animateToPage(
        pageIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      )
      .whenComplete(
          () => context.read<OnboardingCubit>().emitFinishedClickStatus());

  // bool _isUrl(String input) {
  //   Uri? uri = Uri.tryParse(input);
  //   return uri != null && uri.hasScheme && uri.hasAuthority;
  // }
}

class _OnboardingButton extends StatelessWidget {
  const _OnboardingButton();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 24,
      left: 0,
      right: 0,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: OnboardingButton(
                onPressed: () => context.read<OnboardingCubit>().nextPage(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
