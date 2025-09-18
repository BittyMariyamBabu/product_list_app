import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CommonSvg extends StatelessWidget {
  const CommonSvg({super.key, required this.path, required this.width, required this.height});
  final String path;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
  return SvgPicture.asset(
    path,
    width: width,
    height: height,
  );
  }
}