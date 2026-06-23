import 'package:flutter/material.dart';
import '../../features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import '../theming/colors.dart';

class Customappbar extends StatefulWidget implements PreferredSizeWidget {
  const Customappbar({super.key, required this.isblack, this.isHome = false});

  final bool isblack;
  final bool isHome;

  @override
  State<Customappbar> createState() => _CustomappbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomappbarState extends State<Customappbar> {
  bool isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isblackk = widget.isblack;
    bool showBackButton = Navigator.canPop(context) && !widget.isHome;

    return Padding(
      padding: EdgeInsets.all(12.0.w),
      child: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: isblackk ? Colorss.primreColor : Colors.white,

        leading: GestureDetector(
          onTap: () {
            if (isSearching) {
              setState(() {
                isSearching = false;
                _searchController.clear();
                context.read<HomeCubit>().searchProducts('');
              });
            } else {
              if (showBackButton) {
                Navigator.pop(context);
              } else {
                Scaffold.of(context).openDrawer();
              }
            }
          },
          child: isSearching
              ? Icon(
                  Icons.close,
                  color: isblackk ? Colors.white : Colors.black,
                  size: 24.sp,
                )
              : (showBackButton
                  ? Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: isblackk ? Colors.white : Colors.black,
                      size: 22.sp,
                    )
                  : SvgPicture.asset(
                      'assets/images/icons/Menu.svg',
                      color: isblackk ? Colors.white : Colors.black,
                      height: 30.h,
                    )),
        ),

        leadingWidth: 25.w,
        centerTitle: true,

        title: (widget.isHome && isSearching)
            ? TextField(
                controller: _searchController,
                autofocus: true,
                style: TextStyle(
                  color: isblackk ? Colors.white : Colors.black,
                  fontSize: 16.sp,
                ),
                decoration: InputDecoration(
                  hintText: 'Search products...',
                  hintStyle: TextStyle(
                    color: isblackk ? Colors.white60 : Colors.black45,
                  ),
                  border: InputBorder.none,
                ),
                onChanged: (query) {
                  context.read<HomeCubit>().searchProducts(query);
                },
              )
            : SvgPicture.asset(
                'assets/images/homePhoto/Group 10285.svg',
                width: 50.w,
                color: isblackk ? Colors.white : Colors.black,
              ),

        actions: [
          if (widget.isHome) ...[
            GestureDetector(
              onTap: () {
                setState(() {
                  isSearching = !isSearching;
                  if (!isSearching) {
                    _searchController.clear();
                    context.read<HomeCubit>().searchProducts('');
                  }
                });
              },
              child: SvgPicture.asset(
                'assets/images/icons/Search.svg',
                color: isblackk ? Colors.white : Colors.black,
              ),
            ),
            Gap(15.0.w),
            GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(
                'assets/images/icons/shopping bag.svg',
                color: isblackk ? Colors.white : Colors.black,
              ),
            ),
          ],
        ],
      ),
    );
  }
}