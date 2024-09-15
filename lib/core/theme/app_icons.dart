import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

sealed class AppIcons {
  AppIcons._();

  static SvgPicture home = SvgPicture.asset("assets/icons/home.svg");
  static SvgPicture save = SvgPicture.asset("assets/icons/save.svg");
  static SvgPicture search = SvgPicture.asset("assets/icons/search.svg");
  static SvgPicture magicBox = SvgPicture.asset("assets/icons/magic_box.svg");
  static SvgPicture noResult = SvgPicture.asset("assets/icons/no_results.svg");
}

extension ExtSvg on SvgPicture {
  SvgPicture copyWith({double? height, double? width, Color? color}) {
    return SvgPicture(
      bytesLoader,
      height: height ?? this.height,
      width: width ?? this.width,
      colorFilter: color != null ? ColorFilter.mode(color, BlendMode.srcIn) : colorFilter,
    );
  }
}
