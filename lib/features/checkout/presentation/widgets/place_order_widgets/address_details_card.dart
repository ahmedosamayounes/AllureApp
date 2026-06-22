import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class AddressDetailsCard extends StatelessWidget {
  AddressDetailsCard({super.key, required this.savedAddress});
  Map<String, dynamic> savedAddress;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${savedAddress["first"] ?? ''} ${savedAddress["last"] ?? ''}"
                .toUpperCase(),
            style: TextStyle(
              color: const Color(0xff1A1A1A),
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
              fontFamily: "TenorSans",
            ),
          ),
          Gap(4.h),
          Text(
            "${savedAddress["address"] ?? ''}".toUpperCase(),
            style: TextStyle(
              color: const Color(0xff555555),
              fontSize: 14.sp,
              fontFamily: "TenorSans",
            ),
          ),
          Text(
            "${savedAddress["city"] ?? ''}, ${savedAddress["state"] ?? ''}"
                .toUpperCase(),
            style: TextStyle(
              color: const Color(0xff555555),
              fontSize: 14.sp,
              fontFamily: "TenorSans",
            ),
          ),
        ],
      ),
    );
  }
}
