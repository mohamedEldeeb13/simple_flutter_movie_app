import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constant/my_colors.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(children: [
          TextSpan(
              text: title,
              style: TextStyle(
                  color: MyColors.myWhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp)),
          TextSpan(
              text: value,
              style: TextStyle(color: MyColors.myWhite, fontSize: 16.sp)),
        ]));
  }
}
