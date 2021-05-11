/// IconDataSerialization
/// Author Rebar Ahmad
/// https://github.com/Ahmadre
/// rebar.ahmad@gmail.com

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/IconPicker/Packs/legacy_material_icon_pack.dart';
import 'package:flutter_iconpicker/IconPicker/icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Converts an IconData to a Map.
/// Useful for saving IconData for further retreivement.
Map<String, dynamic> iconDataToMap(IconData iconData) {
  var fontFamily = iconData.fontFamily;
  if (fontFamily != 'MaterialIcons')
    throw UnimplementedError("this patch is only working with MaterialIcons");

  String iconName = MaterialIconPack.getNameOfIconPoint(iconData.codePoint);
  int? codePoint = LegacyMaterialIconPack.icons[iconName]?.codePoint;
  print('icon: ');
  print(iconName);
  print(codePoint);
  Map<String, dynamic> result = Map<String, dynamic>.from({
    'fontFamily': iconData.fontFamily,
    'iconName': MaterialIconPack.getNameOfIconPoint(iconData.codePoint),
    'version': MaterialIconPack.versionNumber,
    // ----> only for legacy
    'codePoint': codePoint,
    'fontPackage': iconData.fontPackage,
    'matchTextDirection': iconData.matchTextDirection,
    // <---- only for legacy
  });
  return result;
}

/// Converts a Map to IconData.

IconData mapToIconData(Map<String, dynamic> map) {
  int? version = map['version'];
  String fontFamily = map['fontFamily'];
  var codePoint = map['codePoint'];

  // if it's not material icons do it as we did before
  if (fontFamily != 'MaterialIcons') {
    return IconData(map['codePoint'],
        fontFamily: map['fontFamily'],
        fontPackage: map['fontPackage'],
        matchTextDirection: map['matchTextDirection']);
  }

  // if no version is specified, convert with the legacy icon class
  // to icon name and then convert it back to the correct icon data
  if (version == null) {
    var name = LegacyMaterialIconPack.getNameOfIconPoint(codePoint);
    return MaterialIconPack.getIconDataOfName(name);
  }

  if (version == 1) {
    String name = map['iconName'];
    return MaterialIconPack.getIconDataOfName(name);
  }

  throw Exception('could not parse iconData');
}
