part of 'widgets.dart';

// class _VideoHero extends StatelessWidget {
//   const _VideoHero({required this.channelThumbnail, required this.link});

//   final String? channelThumbnail;
//   final String link;
//   @override
//   Widget build(BuildContext context) {
//     final bool isTv = context.isTv;

//     return SafeArea(
//       bottom: false,
//       child: Padding(
//         padding:
//             isTv ? const EdgeInsets.fromLTRB(100, 10, 100, 0) : EdgeInsets.zero,
//         child: SizedBox(
//           height: isTv ? null : 240,
//           // for android tv
//           width: double.infinity,
//           child: Stack(
//             alignment: Alignment.bottomLeft,
//             children: [
//               PageView(
//                 children: [
//                   Stack(
//                     children: [
//                       ClipRRect(
//                         borderRadius:
//                             const BorderRadius.all(Radius.circular(10)),
//                         child: AspectRatio(
//                           aspectRatio: 16 / 9,
//                           child: AppVideoPlayer(
//                             video: ContentModel.empty,
//                             image: Assets.bigBangTheory,
//                             // link: 'https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
//                             link: link,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
