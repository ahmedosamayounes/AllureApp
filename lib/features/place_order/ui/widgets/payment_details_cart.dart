import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class PaymentDetailsCart extends StatefulWidget {
  const PaymentDetailsCart({super.key});

  @override
  State<PaymentDetailsCart> createState() => _PaymentDetailsCartState();
}

class _PaymentDetailsCartState extends State<PaymentDetailsCart> {
  Map<String, dynamic>? _savedCardInfo;

  @override
  Widget build(BuildContext context) {
    final cardNumber = _savedCardInfo?["number"]?.toString() ?? '';
    final lastDigits = cardNumber.length > 4
        ? cardNumber.substring(cardNumber.length - 4)
        : cardNumber;
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          SvgPicture.asset('assets/images/icons/MasterCard.svg', height: 20.h),
          Gap(12.w),
          Text(
            'Master Card ending  •••• $lastDigits',
            style: TextStyle(
              fontFamily: "TenorSans",
              fontSize: 15.sp,
              color: const Color(0xff17181A),
            ),
          ),
        ],
      ),
    );
  }
}
