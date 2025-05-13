import 'package:flutter/material.dart';

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
          ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(14)),
              child: Image.asset('assets/images/iphone-notes.jpg')),
              
         Container(
          padding: const EdgeInsets.symmetric(
            vertical: 40
          ),
          decoration:  BoxDecoration(
            color: Colors.white.withOpacity(0.8),
           borderRadius: const BorderRadius.vertical(
             bottom: Radius.circular(14)  
           )
          ),
          child: widget.child,
         )
        ],
      ),
    );
  }
}
