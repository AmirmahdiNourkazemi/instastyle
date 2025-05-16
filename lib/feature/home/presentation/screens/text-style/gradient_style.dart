import 'package:flutter/material.dart';

class GradientStyle extends StatefulWidget {
  final Widget? child;
  final String text;
  final double valueFontSize;
  const GradientStyle(
      {super.key,
      required this.child,
      required this.text,
      required this.valueFontSize});

  @override
  State<GradientStyle> createState() => _GradientStyleState();
}

class _GradientStyleState extends State<GradientStyle> {
  @override
  Widget build(BuildContext context) {
    var lines = widget.text.split('\n');
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: lines.map((txt) {
              return Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    color: Colors.white,
                    child: Opacity(
                      opacity: 0,
                      child: Text(
                        txt,
                        style: TextStyle(
                          fontSize: widget.valueFontSize,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList()),
        widget.child ?? Container()
      ],
    );

//     // return Stack(
//     //   alignment: Alignment.center,
//     //   children: [
//     //     // Text(
//     //     //   widget.text,
//     //     //   textDirection: TextDirection.rtl,
//     //     //   textAlign: TextAlign.center,
//     //     //   style: TextStyle(
//     //     //     fontSize: widget.valueFontSize,
//     //     //   ),
//     //     // ),
//     //     // ShaderMask(
//     //     //     blendMode: BlendMode.softLight,
//     //     //     shaderCallback: (rect) => const SweepGradient(
//     //     //             // stops: [0.0, 0.5, 0.0],
//     //     //             // begin: Alignment.center,
//     //     //             // end: Alignment.centerRight,
//     //     //             colors: [
//     //     //               Colors.white38,
//     //     //               Colors.purple,
//     //     //             ]).createShader(rect),
//     //     //     child: Padding(
//     //     //       padding: const EdgeInsets.only(right: 10.0),
//     //     //       child:,
//     //     //     )),
//     //     widget.child ?? Container()
//     //   ],
//     // );
//   }
// }
// class GradientStyle extends StatelessWidget {
//   final Widget? child;
//   final String text;
//   final double valueFontSize;

//   const GradientStyle({
//     super.key,
//     required this.child,
//     required this.text,
//     required this.valueFontSize,
//   });

//   @override
//   Widget build(BuildContext context) {
//     var lines = text.split('\n');
//     return Stack(
//       alignment: Alignment.center,
//       children: [
//         SizedBox(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: lines.map((txt) {
//               return Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Align(
//                     alignment: Alignment.center,
//                     child: IntrinsicWidth(
//                       child: Padding(
//                         padding: const EdgeInsets.all(2),
//                         child: Container(
//                           padding: const EdgeInsets.all(4),
//                           color: Colors.white,
//                           child: Opacity(
//                             opacity: 0,
//                             child: Text(
//                               txt,
//                               style: TextStyle(
//                                 fontSize:
//                                     valueFontSize, // Use the current font size
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             }).toList(),
//           ),
//         ),
//         child ?? Container(),
//       ],
//     );
//   }
// }
  }
}
