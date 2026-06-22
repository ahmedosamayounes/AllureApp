import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../theming/colors.dart';
import 'app_header_text.dart';

class AppProductCard extends StatefulWidget {
  const AppProductCard({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.onChanged,
  });
  final String image;
  final String name;
  final int price;
  final Function(int) onChanged;

  @override
  State<AppProductCard> createState() => _CustomproductState();
}

class _CustomproductState extends State<AppProductCard> {
  int number = 1;
  int selectedquy = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 15,
            spreadRadius: 0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.network(
              widget.image,
              width: 130.w,
              height: 130.w,
              fit: BoxFit.cover,
            ),
          ),
          Gap(16.w),

          Expanded(
            child: SizedBox(
              height: 130.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppHeaderText(title: widget.name, size: 15.sp, isSvg: false),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${widget.price}',
                        style: TextStyle(
                          color: Colorss.priceColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: "TenorSans",
                        ),
                      ),

                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 4.w,
                          vertical: 4.h,
                        ),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (number > 1) {
                                  setState(() {
                                    number--;
                                    widget.onChanged(number);
                                  });
                                }
                              },
                              child: Container(
                                width: 28.w,
                                height: 28.w,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                padding: EdgeInsets.all(7.r),
                                child: SvgPicture.asset(
                                  'assets/images/icons/mins.svg',
                                  color: Colors.black,
                                ),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.w),
                              child: Text(
                                number.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ),

                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  number++;
                                  widget.onChanged(number);
                                });
                              },
                              child: Container(
                                width: 28.w,
                                height: 28.w,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                padding: EdgeInsets.all(7.r),
                                child: SvgPicture.asset(
                                  'assets/images/icons/Plus (1).svg',
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
