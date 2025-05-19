import 'package:instastyle/feature/home/data/model/dynamic_style.dart';
import 'package:instastyle/feature/home/presentation/style/iphone_music.dart';
import 'package:instastyle/feature/home/presentation/style/iphone_note.dart';
import 'package:instastyle/feature/home/presentation/style/iphone_note_dark.dart';
import 'package:instastyle/feature/home/presentation/style/ligh_box_glow.dart';
import 'package:instastyle/feature/home/presentation/style/light_box.dart';

List<DynamicStyle> get dynamicStyle => [
      DynamicStyle(
        name: 'iphone note',
        imagePath: 'assets/images/light_iphone.png',
        builder: (child) => IphoneNote(child: child),
      ),
      DynamicStyle(
        name: 'iphone music',
        imagePath:  'assets/images/style_applemusic.png',
        builder: (child) => IphoneMusic(child: child),
      ),
      DynamicStyle(

        name: 'iphone note dark',
        imagePath: 'assets/images/dark_iphone.png',
        builder: (child) => IphoneNoteDark(child: child),
      ),
      DynamicStyle(
        name: 'light box',
        imagePath:  'assets/images/style_lightBox.jpg',
        builder: (child) => LightBox(child: child),
      ),
      DynamicStyle(
        name: 'light box glow',
        imagePath: 'assets/images/glow.png',
        builder: (child) => LightBoxGlow(child: child),
      )
    ];
