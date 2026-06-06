import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../theming/colors.dart';

class Customappbar extends StatelessWidget implements PreferredSizeWidget {
  const Customappbar({super.key, required this.isblack, this.isHome = false});

  final bool isblack;
  final bool isHome;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    bool isblackk = isblack;

    bool showBackButton = Navigator.canPop(context) && !isHome;

    return Padding(
      padding: EdgeInsets.all(12.0.w),
      child: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: isblackk ? Colorss.primreColor : Colors.white,

        leading: GestureDetector(
          onTap: () {
            if (showBackButton) {
              Navigator.pop(context);
            } else {
              Scaffold.of(context).openDrawer();
            }
          },
          child: showBackButton
              ? Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: isblackk ? Colors.white : Colors.black,
                  size: 22.sp,
                )
              : SvgPicture.asset(
                  'assets/images/icons/Menu.svg',
                  color: isblackk ? Colors.white : Colors.black,
                  height: 30.h,
                ),
        ),

        leadingWidth: 25.w,
        centerTitle: true,
        title: SvgPicture.asset(
          'assets/images/homePhoto/Group 10285.svg',
          width: 50.w,
          color: isblackk ? Colors.white : Colors.black,
        ),
        actions: [
          SvgPicture.asset(
            'assets/images/icons/Search.svg',
            color: isblackk ? Colors.white : Colors.black,
          ),
          Gap(15.0.w),
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(
              'assets/images/icons/shopping bag.svg',
              color: isblackk ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
