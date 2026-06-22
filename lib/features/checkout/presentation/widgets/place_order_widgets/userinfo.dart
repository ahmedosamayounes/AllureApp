import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/shared/app_bar.dart';
import '../../../../../core/shared/app_button.dart';
import '../../../../../core/shared/app_header_text.dart';
import '../../../../../core/shared/app_text_filed.dart';

class Userinfo extends StatefulWidget {
  const Userinfo({super.key});

  @override
  State<Userinfo> createState() => _UserinfoState();
}

class _UserinfoState extends State<Userinfo> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController zipController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: const Customappbar(isblack: false),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15.0.r),
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: AppHeaderText(
                          title: "Add Your Address",
                          size: 24.sp,
                          isSvg: true,
                        ),
                      ),
                      Gap(30.h),

                      Row(
                        children: [
                          Expanded(
                            child: AppTextFiled(
                              name: "First name",
                              width: double.infinity,
                              controller: firstNameController,
                            ),
                          ),
                          Gap(15.w),
                          Expanded(
                            child: AppTextFiled(
                              name: "Last name",
                              width: double.infinity,
                              controller: lastNameController,
                            ),
                          ),
                        ],
                      ),

                      Gap(15.h),
                      AppTextFiled(
                        name: "Address",
                        width: double.infinity,
                        controller: addressController,
                      ),

                      Gap(15.h),
                      AppTextFiled(
                        name: "City",
                        width: double.infinity,
                        controller: cityController,
                      ),

                      Gap(15.h),
                      Row(
                        children: [
                          Expanded(
                            child: AppTextFiled(
                              name: "State",
                              width: double.infinity,
                              controller: stateController,
                            ),
                          ),
                          Gap(15.w),
                          Expanded(
                            child: AppTextFiled(
                              name: "ZIP code",
                              width: double.infinity,
                              controller: zipController,
                            ),
                          ),
                        ],
                      ),

                      Gap(15.h),
                      AppTextFiled(
                        name: "Phone number",
                        width: double.infinity,
                        controller: phoneController,
                      ),
                    ],
                  ),
                ),
                Gap(60.h),

                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pop(context, {
                        "first": firstNameController.text,
                        "last": lastNameController.text,
                        "address": addressController.text,
                        "city": cityController.text,
                        "state": stateController.text,
                        "zip": zipController.text,
                        "phone": phoneController.text,
                      });
                    }
                  },
                  child: const AppButton(name: "Continue"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
