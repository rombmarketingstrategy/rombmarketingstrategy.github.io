import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rombmarketingstrategy/src/utils/paddings.dart';

class SmallIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final Color? color;
  final double? size;

  const SmallIconButton({required this.onTap, required this.icon, this.size, this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(100),
      child: Ink(
        padding: Paddings.a4,
        child: Icon(
          icon,
          size: size ?? 24.sp,
          color: color ?? Theme.of(context).colorScheme.onBackground,
        ),
      ),
    );
  }
}
