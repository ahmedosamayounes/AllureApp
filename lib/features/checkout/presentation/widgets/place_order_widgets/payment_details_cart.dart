import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class PaymentDetailsCart extends StatelessWidget {
  final Map<String, dynamic> savedCardInfo;

  const PaymentDetailsCart({
    super.key,
    required this.savedCardInfo,
  });

  @override
  Widget build(BuildContext context) {
    final String paymentMethod = savedCardInfo["paymentMethod"] ?? 'Card';
    final int amount = savedCardInfo["amountPaid"] ?? 0;
    final String status = savedCardInfo["status"] ?? '';

    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            paymentMethod == "Stripe Card"
                ? 'assets/images/icons/MasterCard.svg'
                : 'assets/images/icons/CreditCard.svg', // لوجو احتياطي
            height: 20.h,
          ),
          Gap(12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$paymentMethod Paid Successfully',
                  style: TextStyle(
                    fontFamily: "TenorSans",
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff17181A),
                  ),
                ),
                Gap(4.h),
                Text(
                  'Amount: \$$amount | Status: $status',
                  style: TextStyle(
                    fontFamily: "TenorSans",
                    fontSize: 12.sp,
                    color: Colors.grey.shade600,
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