import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled1/core/colors/colorAssets.dart';
import 'package:untitled1/screens/login_screen/view/components/login_components.dart';

Widget deptGrid() {
  return Column(
    children: [
      SizedBox(
        height: 10.h,
      ),
      Row(
        children: [
          SizedBox(
            width: 50.w,
            child: Divider(
              thickness: 2.w,
              color: ColorAssets.greyText,
              // color: Colors.black,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          customText(
            text: "department name",
            fontSize: 12.sp,
            color: ColorAssets.greyText,
          ),
          SizedBox(
            width: 5.w,
          ),
          Icon(
            Icons.edit,
            size: 15.sp,
            color: ColorAssets.greyText,
          ),
        ],
      ),
      SizedBox(
        height: 5.h,
      ),
      GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        shrinkWrap: true,
        mainAxisSpacing: 10.w,
        crossAxisSpacing: 10.w,
        childAspectRatio: 16 / 10,
        children: List.generate(
          4,
          (index) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.w,
                  color: ColorAssets.greyText,
                ),
                borderRadius: BorderRadius.circular(
                  8.r,
                ),
              ),
              padding: EdgeInsetsDirectional.all(
                8.w,
              ),
              child: Row(
                children: [
                  VerticalDivider(
                    thickness: 2.w,
                    color: ColorAssets.darkBlue,
                  ),
                  SizedBox(
                    width: 100.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customText(
                            text: "Employee name",
                            overflow: TextOverflow.ellipsis,
                            fontSize: 16.sp,
                            color: ColorAssets.darkBlue,
                            fontWeight: FontWeight.bold),
                        Container(
                          padding: EdgeInsetsDirectional.all(
                            3.w,
                          ),
                          decoration: BoxDecoration(
                            color: ColorAssets.primaryButton.withOpacity(
                              .1,
                            ),
                            borderRadius: BorderRadius.circular(
                              5.r,
                            ),
                          ),
                          child: customText(
                            text: "ADMIN",
                            fontSize: 8.sp,
                            color: ColorAssets.primaryButton,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.email_outlined,
                              color: ColorAssets.greyText,
                              size: 10.sp,
                            ),
                            customText(
                              text: "user email",
                              fontSize: 8.sp,
                              color: ColorAssets.darkBlue,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.phone,
                              color: ColorAssets.greyText,
                              size: 10.sp,
                            ),
                            customText(
                              text: "user phone",
                              fontSize: 8.sp,
                              color: ColorAssets.darkBlue,
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      )
    ],
  );
}
