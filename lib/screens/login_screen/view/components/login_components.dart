import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled1/core/colors/colorAssets.dart';

Widget customText({
  required String text,
  required double fontSize,
  required Color? color,
  TextOverflow? overflow,
  FontWeight? fontWeight,
  TextAlign? textAlign,
}) {
  return Text(
    text,
    textAlign: textAlign,
    overflow: overflow,
    style: GoogleFonts.roboto(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
    ),
  );
}

Widget customTextField({
  required TextEditingController controller,
  FormFieldValidator? validator,
  required String label,
  required TextInputType keyboardType,
  Color? fillColor,
  int? maxLines,
  bool? obscureText,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: keyboardType,
    obscureText: obscureText ?? false,
    validator: validator,
    maxLines: maxLines ?? 1,
    decoration: InputDecoration(
      labelText: label,
      filled: true,
      fillColor: fillColor,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorAssets.darkBlue,
          width: 2.w,
        ),
        borderRadius: BorderRadius.circular(
          4.r,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorAssets.darkBlue,
          width: 2.w,
        ),
        borderRadius: BorderRadius.circular(
          4.r,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorAssets.darkBlue,
          width: 2.w,
        ),
        borderRadius: BorderRadius.circular(
          4.r,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
          width: 2.w,
        ),
        borderRadius: BorderRadius.circular(
          4.r,
        ),
      ),
    ),
  );
}

Widget customButton({
  required VoidCallback onPressed,
  required String text,
  required double fontSize,
  required double width,
  required double height,
  required Color textColor,
  FontWeight? fontWeight,
  TextAlign? textAlign,
  double? radius,
  double? borderWidth,
  double? elevation,
  Color? borderColor,
  Color? bGColor,
  double? strokeAlign,
}) {
  return SizedBox(
    width: width,
    height: height,
    child: ElevatedButton(
      onPressed: onPressed,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              radius ?? 0.r,
            ),
            side: BorderSide(
              color: borderColor ?? const Color(0xFF000000),
              width: borderWidth ?? 0,
              strokeAlign: strokeAlign ?? BorderSide.strokeAlignInside,
            ),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color?>(bGColor),
        elevation: MaterialStateProperty.all<double?>(elevation),
      ),
      child: customText(
        text: text,
        color: textColor,
        fontSize: fontSize,
      ),
    ),
  );
}
