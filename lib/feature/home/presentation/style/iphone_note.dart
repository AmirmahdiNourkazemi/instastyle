import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IphoneNote extends StatefulWidget {
  final Widget? child;
  const IphoneNote({super.key, required this.child});

  @override
  State<IphoneNote> createState() => _IphoneNoteState();
}

class _IphoneNoteState extends State<IphoneNote> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.4),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Row(
              children: [
                Text(
                  'Done',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontFamily: 'sf', color: Colors.yellowAccent),
                ),
                SvgPicture.asset(
                  'assets/icons/note-more.svg',
                  color: Colors.yellowAccent,
                  width: 25,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
