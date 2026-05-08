import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
class CustomLabel extends StatelessWidget {
  const CustomLabel({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.titleColor,
      ),
    );
  }
}