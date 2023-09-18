import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled1/core/colors/colorAssets.dart';
import 'package:untitled1/screens/login_screen/view/components/login_components.dart';

Widget taskCard() {
  return Material(
    elevation: 5,
    borderRadius: BorderRadius.circular(
      20.r,
    ),
    child: Container(
      width: 312.w,
      height: 150.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          20.r,
        ),
      ),
      padding: EdgeInsetsDirectional.all(
        10.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customText(
            text: "NEW",
            fontSize: 16.sp,
            color: ColorAssets.primaryButton,
          ),
          Divider(
            thickness: 2.w,
            color: ColorAssets.greyText,
          ),
          SizedBox(
            height: 52.h,
            child: Row(
              children: [
                VerticalDivider(
                  thickness: 4.w,
                  color: ColorAssets.primaryButton,
                ),
                SizedBox(
                  width: 9.w,
                ),
                SizedBox(
                  width: 240.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customText(
                        text: "Create a High-Intensity Interval",
                        fontSize: 16.sp,
                        color: ColorAssets.darkBlue,
                        overflow: TextOverflow.ellipsis,
                      ),
                      customText(
                        text: "Design a 20-minute HIIT workout routine.",
                        fontSize: 16.sp,
                        color: ColorAssets.greyText,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.more_vert,
                )
              ],
            ),
          ),
          SizedBox(
            height: 23.h,
          ),
          Row(
            children: [
              Icon(
                Icons.access_time_outlined,
                size: 17.sp,
                color: ColorAssets.greyText,
              ),
              SizedBox(
                width: 10.w,
              ),
              customText(
                  text: "starts 12/9/2023 - ends 16/9/2023",
                  fontSize: 13.sp,
                  color: ColorAssets.darkBlue,
                  fontWeight: FontWeight.bold)
            ],
          )
        ],
      ),
    ),
  );
}
