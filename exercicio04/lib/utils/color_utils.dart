import 'dart:ui';

class ColorUtils {
  static Color fromHex(String hexCode) {
    final colorHexRegex = RegExp('(#{0,1})([0-9a-fA-F]{6})');

    if (!colorHexRegex.hasMatch(hexCode)) {
      throw Exception('"$hexCode" is not a valid color code');
    }
    hexCode = hexCode.replaceFirst('#', '0');

    return Color(0xff000000 + int.parse(hexCode, radix: 16));
  }
}
