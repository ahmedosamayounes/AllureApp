import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/theming/colors.dart';
import 'local_data.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: LocalData.banners.length,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Image.asset(
                      LocalData.banners[itemIndex],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
          options: CarouselOptions(
            height: 200.h,
            aspectRatio: 16 / 9,
            viewportFraction: 0.85,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 4),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            enlargeCenterPage: true,
            autoPlayCurve: Curves.fastOutSlowIn,
          ),
        ),
        Gap(20.h),
        Text(
          'New Products'.toUpperCase(),
          style: TextStyle(
            color: Colorss.primreColor,
            fontSize: 20.sp,
            letterSpacing: 4,
            fontFamily: "TenorSans",
            fontWeight: FontWeight.w500,
          ),
        ),
        Gap(15.h),
      ],
    );
  }
}
