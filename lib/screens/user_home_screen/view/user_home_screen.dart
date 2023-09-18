import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:untitled1/screens/login_screen/view/components/login_components.dart';

import '../../../components/task_card/task_card.dart';
import '../../../core/colors/colorAssets.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 56.h,
        title: Row(

          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customText(
                  text: "Today",
                  fontSize: 16.sp,
                  color: ColorAssets.darkBlue,
                  fontWeight: FontWeight.bold,
                ),
                customText(
                  text:
                      "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                  fontSize: 12.sp,
                  color: ColorAssets.greyText,
                ),
              ],
            ),
          ],
        ),
        actions: [
          CircularPercentIndicator(
            radius: 20.r,
            percent: 9 / 20,
            center: customText(
              text: "9/20",
              fontSize: 8.sp,
              color: ColorAssets.darkBlue,
            ),
            backgroundColor: Color(0xff94C68D).withOpacity(.4),
            progressColor: Color(0xff94C68D),
          ),
          SizedBox(
            width: 10.w,
          ),
          CircularPercentIndicator(
            radius: 20.r,
            percent: 5 / 20,
            center: customText(
              text: "5/20",
              fontSize: 8.sp,
              color: ColorAssets.darkBlue,
            ),
            backgroundColor: Color(0xffFBA85B66).withOpacity(.4),
            progressColor: Color(0xffFBA85B66),
          ),
          SizedBox(
            width: 10.w,
          ),
          CircularPercentIndicator(
            radius: 20.r,
            percent: 1 / 8,
            center: customText(
              text: "1/8",
              fontSize: 8.sp,
              color: ColorAssets.darkBlue,
            ),
            backgroundColor: Color(0xffF87B7B66).withOpacity(.4),
            progressColor: Color(0xffF87B7B),
          ),
          SizedBox(
            width: 10.w,
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.only(
            start: 24.w,
            end: 24.w,
          ),
          child: Column(
            children: [
              CalendarTimeline(
                firstDate: DateTime(
                  DateTime.now().year - 1,
                  DateTime.now().month,
                  DateTime.now().day,
                ),
                initialDate: DateTime(
                  DateTime.now().year,
                  DateTime.now().month,
                  DateTime.now().day,
                ),
                lastDate: DateTime(
                  DateTime.now().year + 1,
                  DateTime.now().month,
                  DateTime.now().day,
                ),
                onDateSelected: (v) {},
                dotsColor: Colors.white,
                monthColor: ColorAssets.darkBlue,
                dayNameColor: ColorAssets.greyText,
                activeBackgroundDayColor: ColorAssets.darkBlue,
                activeDayColor: Colors.orangeAccent,
                dayColor: ColorAssets.darkBlue,
                showYears: true,
                shrink: false,
              ),
              SizedBox(
                height: 50.h,
              ),
              taskCard(),
            ],
          ),
        ),
      ),
    );
  }
}
