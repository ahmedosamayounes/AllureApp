import 'package:flutter/material.dart';
import '../../../../core/theming/colors.dart';
import 'local_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class SeeMoreCategoriesList extends StatelessWidget {
  const SeeMoreCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'See More Categories '.toUpperCase(),
          style: TextStyle(
            color: Colorss.primreColor,
            fontSize: 23.sp,
            letterSpacing: 2,

            fontFamily: "TenorSans",
          ),
        ),
        Gap(5.h),
        SvgPicture.asset(
          'assets/images/icons/12.svg',
          color: Colorss.primreColor,
        ),
        Gap(30.h),
        SizedBox(
          // if ListView do not work give him a size
          height: 400.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: LocalData.products.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(8.0.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      LocalData.products[index].image,
                      fit: BoxFit.cover,
                      height: 340.h,
                    ),
                    Gap(10.0.h),
                    Text(
                      LocalData.products[index].name.toUpperCase(),
                      style: TextStyle(
                        color: Colorss.primreColor,
                        fontFamily: "TenorSans",
                        letterSpacing: 2,
                        fontSize: 15.sp,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
