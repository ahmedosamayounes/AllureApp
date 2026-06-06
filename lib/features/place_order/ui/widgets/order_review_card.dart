import 'package:flutter/material.dart';
import '../../../../core/theming/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class OrderReviewCard extends StatelessWidget {
  const OrderReviewCard({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.quantity,
  });
  final String image;
  final String name;
  final int price;
  final int quantity;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.network(
              image,
              width: 70.w,
              height: 70.h,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  image,
                  width: 70.w,
                  height: 70.h,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          Gap(15.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name.toUpperCase(),
                  style: TextStyle(
                    fontFamily: "TenorSans",
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff1A1A1A),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Gap(5.h),
                Text(
                  'Price: \$$price',
                  style: TextStyle(
                    fontFamily: "TenorSans",
                    fontSize: 13.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
                Gap(2.h),
                Text(
                  'Quantity: x$quantity',
                  style: TextStyle(
                    fontFamily: "TenorSans",
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: Colorss.priceColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
