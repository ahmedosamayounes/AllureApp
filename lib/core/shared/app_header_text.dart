import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppHeaderText extends StatelessWidget {
  const AppHeaderText({
    super.key,
    required this.title,
    required this.size,
    required this.isSvg,
  });
  final String title;
  final double size;
  final bool isSvg;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title.toUpperCase(),
          style: TextStyle(
            fontFamily: "TenorSans",
            letterSpacing: 2,
            fontSize: size,
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w500,
          ),
        ),
        isSvg
            ? SvgPicture.asset(
                'assets/images/icons/12.svg',
                color: Colors.black,
                width: 160.w,
              )
            : SizedBox.shrink(),
      ],
    );
  }
}
