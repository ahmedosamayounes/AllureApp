import 'package:flutter/material.dart';
import '../../../../core/theming/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TotalPriceSection extends StatelessWidget {
  const TotalPriceSection({super.key, required this.totalPrice});
  final String totalPrice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        children: [
          Text(
            'Est. Total'.toUpperCase(),
            style: TextStyle(
              fontSize: 15.sp,
              letterSpacing: 4,
              fontFamily: "TenorSans",
              color: Colors.grey.shade700,
            ),
          ),
          const Spacer(),
          Text(
            totalPrice,
            style: TextStyle(
              color: Colorss.priceColor,
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              fontFamily: "TenorSans",
            ),
          ),
        ],
      ),
    );
  }
}
