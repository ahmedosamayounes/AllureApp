import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; 
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../routing/routes.dart';
import '../theming/colors.dart';

class AppSuccessDialog extends StatelessWidget {
  final String orderId;
  const AppSuccessDialog({
    super.key, 
    required this.orderId, 
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                context.read<CheckoutCubit>().resetCheckout(); 
                Navigator.pop(context);
              },
              child: const Align(
                alignment: Alignment.topRight,
                child: Icon(CupertinoIcons.clear, color: Colors.grey),
              ),
            ),
            Gap(10.h),

            Text(
              'Order Placed!'.toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
                fontFamily: "TenorSans",
                letterSpacing: 4,
                color: Colors.black,
              ),
            ),
            Gap(20.h),

            SvgPicture.asset('assets/images/icons/done.svg', height: 60.h),
            Gap(20.h),

            Text(
              'Your order was successful',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15.sp,
                fontFamily: "TenorSans",
                color: Colors.grey.shade600,
              ),
            ),
            Gap(8.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Order ID:',
                  style: TextStyle(
                    fontFamily: "TenorSans",
                    fontSize: 14.sp,
                    color: Colors.grey.shade500,
                  ),
                ),
                Gap(6.w),
                Text(
                  orderId, 
                  style: TextStyle(
                    fontFamily: "TenorSans",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Gap(20.h),

            SvgPicture.asset(
              'assets/images/icons/12.svg',
              color: Colors.grey.shade300,
              width: 150.w,
            ),
            Gap(20.h),

            Text(
              'Rate your experience',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15.sp,
                fontFamily: "TenorSans",
                color: Colors.black87,
              ),
            ),
            Gap(12.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildRateEmoji('assets/images/icons/Disappointed.png'),
                Gap(12.w),
                _buildRateEmoji('assets/images/icons/Happy.png'),
                Gap(12.w),
                _buildRateEmoji('assets/images/icons/In Love.png'),
              ],
            ),
            Gap(30.h),

            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      context.read<CheckoutCubit>().resetCheckout();
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        Routes.homeScreen,
                        (route) => false,
                      );
                    },
                    child: Container(
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Center(
                        child: Text(
                          'Submit'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "TenorSans",
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                      ),
                        ),
                      ),
                    ),
                  ),
                ),
                Gap(12.w),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      context.read<CheckoutCubit>().resetCheckout();
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.r),
                        border: Border.all(
                          width: 1.w,
                          color: Colors.grey.shade300,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Back'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "TenorSans",
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRateEmoji(String assetPath) {
    return Image.asset(
      assetPath,
      color: Colorss.priceColor,
      width: 28.w,
      height: 28.h,
    );
  }
}