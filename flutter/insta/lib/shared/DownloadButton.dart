// import 'package:flutter/cupertino.dart';
//
// @immutable
// class DownloadButton extends StatefulWidget {
//   const DownloadButton({
//     Key? key,
//     this.progress = 0.0,
//   }) : super(key: key);
//
//   final double progress;
//
//   @override
//   _DownloadButtonState createState() => _DownloadButtonState();
// }
//
// class _DownloadButtonState extends State<DownloadButton> {
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         _buildButtonShape(
//           child: _buildText(),
//         ),
//         _buildDownloadingProgress(),
//       ],
//     );
//   }
//
//   Widget _buildDownloadingProgress() {
//     return Positioned.fill(
//       child: AnimatedOpacity(
//         duration: widget.transitionDuration,
//         opacity: _isDownloading || _isFetching ? 1.0 : 0.0,
//         curve: Curves.ease,
//         child: Stack(
//           alignment: Alignment.center,
//           children: [
//             _buildProgressIndicator(),
//             if (_isDownloading)
//               const Icon(
//                 Icons.stop,
//                 size: 14.0,
//                 color: CupertinoColors.activeBlue,
//               ),
//           ],
//         ),
//       ),
//     );
//   }
//
//
//   Widget _buildProgressIndicator() {
//     return AspectRatio(
//       aspectRatio: 1.0,
//       child: TweenAnimationBuilder<double>(
//         tween: Tween(begin: 0.0, end: widget.progress),
//         duration: const Duration(milliseconds: 200),
//         builder: (BuildContext context, double progress, Widget? child) {
//           return CircularProgressIndicator(
//             backgroundColor: _isDownloading ? CupertinoColors.lightBackgroundGray : Colors.white.withOpacity(0.0),
//             valueColor:
//             AlwaysStoppedAnimation(_isFetching ? CupertinoColors.lightBackgroundGray : CupertinoColors.activeBlue),
//             strokeWidth: 2.0,
//             value: _isFetching ? null : progress,
//           );
//         },
//       ),
//     );
//   }
// }