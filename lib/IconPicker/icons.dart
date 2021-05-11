/// FlutterIconMap
/// Author Rebar Ahmad
/// https://github.com/Ahmadre
/// rebar.ahmad@gmail.com

export 'Packs/material_icon_pack.dart';
export 'Packs/Cupertino.dart';
export 'Packs/FontAwesome.dart';
export 'Packs/LineIcons.dart';

import '../Models/IconPack.dart';

import 'Packs/material_icon_pack.dart';
import 'Packs/Cupertino.dart';
import 'Packs/FontAwesome.dart';
import 'Packs/LineIcons.dart';

import 'package:flutter/widgets.dart';

class IconManager {
  static Map<String, IconData> getSelectedPack(IconPack? pickedPack) {
    switch (pickedPack) {
      case IconPack.material:
        return MaterialIconPack.icons;
      case IconPack.cupertino:
        return cupertinoIcons;
      case IconPack.fontAwesomeIcons:
        return fontAwesomeIcons;
      case IconPack.lineAwesomeIcons:
        return lineAwesomeIcons;
      default:
        return MaterialIconPack.icons;
    }
  }
}
