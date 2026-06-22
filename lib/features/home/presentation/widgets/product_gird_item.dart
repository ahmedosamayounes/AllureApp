import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../data/models/product_model.dart';

class ProductGridItem extends StatelessWidget {
  final ProductModel product;

  const ProductGridItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.checkoutScreen, arguments: product);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child:
                      product.imageUrl != null && product.imageUrl!.isNotEmpty
                      ? Image.network(
                          product.imageUrl!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        )
                      : Container(
                          color: Colors.grey.shade800,
                          child: Center(
                            child: Text(
                              'No Image',
                              style: TextStyle(color: Colorss.primreColor),
                            ),
                          ),
                        ),
                ),
                Positioned(
                  bottom: 8.h,
                  right: 10.w,
                  child: SvgPicture.asset('assets/images/icons/Heart.svg'),
                ),
              ],
            ),
          ),
          Gap(8.h),
          Text(
            product.product_name ?? '',
            style: TextStyle(
              color: Colorss.primreColor,
              fontFamily: "TenorSans",
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Gap(4.h),
          Text(
            '\$ ${product.product_price}',
            style: TextStyle(
              fontSize: 16.sp,
              color: Colorss.priceColor,
              fontFamily: "TenorSans",
            ),
          ),
        ],
      ),
    );
  }
}
