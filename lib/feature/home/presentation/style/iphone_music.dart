import 'package:flutter/material.dart';

class IphoneMusic extends StatefulWidget {
  final Widget? child;
  const IphoneMusic({super.key, required this.child});

  @override
  State<IphoneMusic> createState() => _IphoneMusicState();
}

class _IphoneMusicState extends State<IphoneMusic> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), 
      color: Colors.white.withOpacity(0.3)
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: widget.child!,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(14)),
                child: Image.asset('assets/images/iphone-music.png')),
          ),
              const SizedBox(
                height: 8,
              ),
        
        ],
      ),
    );
  }
}
