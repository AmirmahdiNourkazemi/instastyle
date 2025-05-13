import 'package:flutter/material.dart';

class IphoneNoteDark extends StatefulWidget {
  final Widget? child;
  const IphoneNoteDark({super.key, required this.child});

  @override
  State<IphoneNoteDark> createState() => _IphoneNoteDarkState();
}

class _IphoneNoteDarkState extends State<IphoneNoteDark> {
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
                  const BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset('assets/images/iphone-notes2.png')),
              
         Container(
          padding: const EdgeInsets.symmetric(
            vertical: 40
          ),
          decoration:  BoxDecoration(
            color: Colors.black.withOpacity(0.5),
           borderRadius: const BorderRadius.vertical(
             bottom: Radius.circular(10)  
           )
          ),
          child: widget.child,
         )
        ],
      ),
    );
  }
}
