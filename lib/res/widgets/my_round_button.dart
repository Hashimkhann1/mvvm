import 'package:flutter/material.dart';

class MyRoundButton extends StatelessWidget {
  final double? height;
  final double width;
  final Color? btnColor;
  final String title;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? titleColor;
  final BorderRadius? borderRadius;
  final void Function()? onTap;

  const MyRoundButton({super.key,
    this.height,
    this.width = double.infinity ,
    this.btnColor ,
    required this.title,
    this.fontWeight ,
    this.borderRadius ,
    this.fontSize,
    this.titleColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius: borderRadius
        ),
        child: Text(title,style: TextStyle(fontSize: fontSize , fontWeight: fontWeight,color: titleColor),),
      ),
    );
  }
}
