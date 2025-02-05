import 'package:flutter/material.dart';
import 'package:notes/shared/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.title,
    required this.onTap,
    required this.color,
    this.icon,
    this.fontSize = 14,
  }) : super(key: key);

  final String title;
  final Function()? onTap;
  final Color color;
  final IconData? icon;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.width,
        height: 45.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color.withOpacity(0.7),
          borderRadius: BorderRadius.circular(17.5),
          boxShadow: [
            BoxShadow(
              color: appInversePrimary.withOpacity(0.5),
              spreadRadius: 0.0,
              blurRadius: 6.0,
              offset: Offset(0, 2),
            )
          ],
        ),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          // icon
          if (icon != null) // Check if the icon is provided
            Icon(
              icon,
              color: appWhite,
            ),
          if (icon != null) const SizedBox(width: 8.0),
          // title
          Text(
            title,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w700,
              color: appWhite,
            ),
          ),
        ]),
      ),
    );
  }
}
