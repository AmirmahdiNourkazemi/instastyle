import 'package:instastyle/feature/home/data/model/dynamic_style.dart';
import 'package:instastyle/feature/home/presentation/style/iphone_music.dart';
import 'package:instastyle/feature/home/presentation/style/iphone_note.dart';
import 'package:instastyle/feature/home/presentation/style/iphone_note_dark.dart';



  List<DynamicStyle> get dynamicStyle => [
   DynamicStyle(
    name: 'iphone music',
   builder: (child) => IphoneMusic(child: child),
   ),
   DynamicStyle(
    name: 'iphone note',
 builder: (child) => IphoneNote(child: child),
   ),
    DynamicStyle(
    name: 'iphone note dark',
       builder: (child) => IphoneNoteDark(child: child),
   )
  ];

