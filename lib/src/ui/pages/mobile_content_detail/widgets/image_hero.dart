part of 'widgets.dart';

class _ImageHero extends StatefulWidget {
  const _ImageHero({
    required this.content,
  });

  final ContentModel content;

  @override
  State<_ImageHero> createState() => _ImageHeroState();
}

class _ImageHeroState extends State<_ImageHero> {
  bool isEpisodeTitlePressed = false;

  void toggleEpisodeDescr() {
    setState(() {
      isEpisodeTitlePressed = !isEpisodeTitlePressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      // for android tv
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
                      widget.content.images.thumbnail ?? '',
                      fit: BoxFit.cover,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return DefaultShimmer.Shimmer.fromColors(
                          baseColor:
                              context.uiColors.tvSurface.withOpacity(0.9),
                          highlightColor: context.uiColors.secondary,
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            color: Colors.white,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              // if (widget.episode != null)
              //   InkWell(
              //     onTap: () => toggleEpisodeDescr(),
              //     child: Padding(
              //       padding: EdgeInsets.only(
              //           left: 15, bottom: isEpisodeTitlePressed ? 140 : 80),
              //       child: Row(
              //         crossAxisAlignment: CrossAxisAlignment.center,
              //         children: [
              //           Text(
              //             'Episode ${widget.episode!}: ${widget.episode!.title}',
              //             style: TextStyles.h4.white,
              //             overflow: TextOverflow.ellipsis,
              //             softWrap: true,
              //             maxLines: 2,
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              if (isEpisodeTitlePressed) const SizedBox(height: 10),
              if (isEpisodeTitlePressed)
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    bottom: 60,
                    right: 15,
                  ),
                  child: Text(
                    widget.content.description!,
                    style: TextStyles.h6.white,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    maxLines: 3,
                  ),
                ),
              // if (widget.episode == null)
              //   Padding(
              //     padding: const EdgeInsets.only(left: 15, bottom: 80),
              //     child: Row(
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       children: [
              //         Expanded(
              //           child: Text(
              //             widget.episode != null
              //                 ? 'Episode ${'12'}: ${widget.episode!.title}'
              //                 : widget.content.title,
              //             style: TextStyles.h4.white,
              //             overflow: TextOverflow.ellipsis,
              //             softWrap: true,
              //             maxLines: 2,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              Positioned.fill(
                bottom: 10,
                left: 10,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: _ActionsRow(content: widget.content),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _ActionsRow extends StatefulWidget {
  const _ActionsRow({required this.content});

  final ContentModel content;

  @override
  State<_ActionsRow> createState() => _ActionsRowState();
}

class _ActionsRowState extends State<_ActionsRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppChip.mediumPrimaryRounded(
          label: 'Play',
          onPressed: () => _onPlayPressed(),
          prefixIcon: (asset: Assets.play, size: 24),
          isOutlined: true,
        ),
        Margins.horizontal10,
        // BlocSelector<VodCubit, VodState, bool>(
        //   selector: (state) {
        //     return state.savedcontents.contains(widget.content.id);
        //   },
        //   builder: (context, iscontentSaved) {
        //     final SavedButtonModel buttonModel = SavedButtonUtil.getModel(
        //       iscontentSaved,
        //     );

        //     return AppChip.mediumPrimaryRounded(
        //       label: buttonModel.label,
        //       prefixIcon: (asset: buttonModel.icon, size: 24),
        //       onPressed: () =>
        //           context.read<ContentCubit>().savecontent(widget.content),
        //       isOutlined: buttonModel.isOutlined,
        //     );
        //   },
        // ),
      ],
    );
  }

  void _onPlayPressed() {
    context.pushNamed(
      VideoPlayerPage.name,
      extra: {'contentModel': widget.content, 'isTrailer': false},
    );
    context.read<ContentCubit>().setSelectedContent(widget.content);
  }
}
