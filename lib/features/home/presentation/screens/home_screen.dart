// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application/core/shared/app_bar.dart';
import 'package:flutter_application/core/shared/app_drawer.dart';
import 'package:flutter_application/core/theming/colors.dart';
import 'package:flutter_application/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter_application/features/home/presentation/cubit/home_state.dart';
import 'package:flutter_application/features/home/presentation/widgets/footer.dart';
import 'package:flutter_application/features/home/presentation/widgets/home_header.dart';
import 'package:flutter_application/features/home/presentation/widgets/product_gird_item.dart';
import 'package:flutter_application/features/home/presentation/widgets/see_more_categories.dart';
import 'package:flutter_application/features/home/presentation/widgets/social_media_contact.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      backgroundColor: Colors.white,
      appBar: const Customappbar(isblack: false, isHome: true),
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            final displayedProducts = context
                .read<HomeCubit>()
                .filteredProducts;

            return state.when(
              initial: () => const SizedBox.shrink(),
              loading: () {
                if (displayedProducts.isNotEmpty) {
                  return _buildHomeContent(displayedProducts);
                }
                return Center(
                  child: CircularProgressIndicator(color: Colorss.primreColor),
                );
              },
              error: (message) => Center(
                child: Text(
                  'Database Error: $message',
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.red,
                    fontFamily: "TenorSans",
                  ),
                ),
              ),
              success: (products) {
                return _buildHomeContent(displayedProducts);
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildHomeContent(List displayedProducts) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: HomeHeader()),

        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 15.0.r),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12.w,
              mainAxisSpacing: 16.h,
              childAspectRatio: 0.6.h,
            ),
            delegate: SliverChildBuilderDelegate((context, index) {
              return ProductGridItem(product: displayedProducts[index]);
            }, childCount: displayedProducts.length),
          ),
        ),

        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0.r),
            child: Column(
              children: [
                Gap(30.h),
                const SeeMoreCategoriesList(),
                Gap(30.h),
                const SocialMediaContact(),
                Gap(30.h),
              ],
            ),
          ),
        ),

        const SliverToBoxAdapter(child: Footer()),
      ],
    );
  }
}
