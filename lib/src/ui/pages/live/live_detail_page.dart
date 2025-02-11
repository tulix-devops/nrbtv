// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:commons/shared/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nrbtv/src/bloc/bloc.dart';
import 'package:nrbtv/src/data/data.dart';
import 'package:nrbtv/src/data/models/content/content.dart';
import 'package:nrbtv/src/ui/pages/pages.dart';
import 'package:nrbtv/src/ui/widgets/widgets.dart';
import 'package:ui_kit/ui_kit.dart';

import 'package:nrbtv/src/core/core.dart';

class LiveDetailPage extends StatefulWidget {
  const LiveDetailPage({
    super.key,
    required this.channel,
  });

  final ChannelModel channel;

  static const path = 'liveDetailScreen';
  static const name = 'liveDetailScreen';
  @override
  State<LiveDetailPage> createState() => _LiveDetailedScreenState();
}

class _LiveDetailedScreenState extends State<LiveDetailPage> {
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      hasNavbar: false,
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              child: Column(
                children: [
                  AnimatedSwitcher(
                    duration: Durations.extralong4,
                    switchInCurve: Curves.easeInOut,
                    switchOutCurve: Curves.easeInOut,
                    child: isPlaying
                        ? _VideoHeader(
                            onPressed: _triggerIsPlaying,
                            channel: widget.channel,
                          )
                        : _ImageHeader(
                            onPressed: _triggerIsPlaying,
                            channel: widget.channel,
                          ),
                  ),
                  Margins.vertical24,
                  _LiveChannelDescription(
                    channel: widget.channel,
                  ),
                ],
              ),
            ),
            AppBar(
              forceMaterialTransparency: true,
              titleSpacing: 0,
              title: Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.sizeOf(context).width / 1.65),
                child: Focus(
                  focusNode: FocusNode(),
                  child: Center(
                    child: Image.asset(
                      Assets.pockoMiniLogo,
                      height: 40,
                      width: 60,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _triggerIsPlaying() {
    // if (Platform.isIOS &&
    //     context.read<AppCubit>().state.isAuthenticated &&
    //     !context.read<AppCubit>().state.isSubscribed) {
    //   context.read<AppCubit>().showSubscribeDialog();
    //   return;
    // }

    if (!context.read<AppCubit>().state.isAuthenticated) {
      context.read<AppCubit>().showAuthDialog();
      return;
    }

    if (!context.read<AppCubit>().state.isSubscribed) {
      context.pushNamed(SubscribePage.name);
      return;
    }

    setState(() {
      isPlaying = !isPlaying;
    });
  }
}

class _VideoHeader extends StatelessWidget {
  const _VideoHeader({
    required this.onPressed,
    required this.channel,
  });
  final void Function() onPressed;

  final ChannelModel channel;

  @override
  Widget build(BuildContext context) {
    final bool isTv = context.isTv;

    return SafeArea(
      bottom: false,
      child: Container(
          padding: isTv
              ? const EdgeInsets.fromLTRB(100, 10, 100, 0)
              : EdgeInsets.zero,
          width: double.infinity,
          child: const SizedBox.shrink()
          // : ClipRRect(
          //     child: AspectRatio(
          //       aspectRatio: 16 / 9,
          //       child: AppVideoPlayer(
          //         video: ContentModel.empty,
          //         image: channel.banner,
          //         link: channel.source,
          //       ),
          //     ),
          //   ),
          ),
    );
  }
}

class _ImageHeader extends StatelessWidget {
  const _ImageHeader({required this.onPressed, required this.channel});
  final void Function() onPressed;
  final ChannelModel channel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Stack(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              ShaderMask(
                shaderCallback: (Rect bounds) {
                  return AppColors.homePageMask.createShader(bounds);
                },
                blendMode: BlendMode.srcATop,
                child: AnimatedSwitcher(
                  duration: Durations.long2,
                  switchInCurve: Curves.easeInOut,
                  switchOutCurve: Curves.easeInOut,
                  child: SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: Image.network(
                      // APIList.videoStorage(channel.storageRecord.thumb),
                      // channel.storage.record.thumb ?? "",
                      channel.banner,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 60),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        channel.title,
                        style: TextStyles.h4.white,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned.fill(
                bottom: 10,
                left: 10,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: _ActionRowWidget(
                    prefixIcon: (asset: Assets.play, size: 24),
                    label: 'Watch',
                    onTap: onPressed,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _LiveChannelDescription extends StatelessWidget {
  const _LiveChannelDescription({
    required this.channel,
  });

  final ChannelModel channel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              channel.title,
              style: TextStyles.bodyLargeBold.copyWith(fontSize: 24),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        Margins.vertical10,
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'Welcome to the POCKO Channel, your ultimate destination for unforgettable family entertainment! Get ready to embark on a thrilling cinematic journey with our carefully curated collection of movies and TV shows. At POCKO channel, we pride ourselves on providing captivating content that is suitable for all viewers. We believe in creating an immersive and enjoyable experience for the whole family, where entertainment meets quality.',
            style: TextStyles.bodyMedium,
          ),
        ),
        // Margins.vertical20,
        // const AlsoWatchWidget(),
      ],
    );
  }
}

class _ActionRowWidget extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final ({String asset, double size}) prefixIcon;

  const _ActionRowWidget({
    required this.label,
    required this.onTap,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    const BorderRadius radius = BorderRadius.all(Radius.circular(20));
    const EdgeInsets padding =
        EdgeInsets.symmetric(vertical: 7, horizontal: 15);

    return Material(
      color: Colors.transparent,
      borderRadius: radius,
      child: InkWell(
        borderRadius: radius,
        onTap: onTap,
        autofocus: true,
        child: Ink(
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: context.uiColors.primary,
            ),
            borderRadius: radius,
          ),
          child: Padding(
            padding: padding,
            child: DefaultButtonContent(
              prefixIcon: prefixIcon,
              suffixIcon: null,
              iconColor: context.uiColors.primary,
              contentMargin: 6,
              text: Text(
                label,
                maxLines: 1,
                style: TextStyle(color: context.uiColors.primary),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
