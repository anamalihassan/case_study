import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_fonts.dart';

class TabButtonWidget extends StatelessWidget {
  const TabButtonWidget({
    super.key,
    required this.title,
    required this.isSelected,
    required this.width,
    this.onTap,
  });

  final String title;
  final bool isSelected;
  final double width;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: AppFonts.menuTitleSize,
                  color: isSelected ? AppColors.backgroundGreen : AppColors.unselectedTab,
                ),
              ),
            ),
            Container(
              color: isSelected ? AppColors.backgroundGreen : AppColors.searchBorderColor,
              height: 2,
            ),
          ],
        ),
      ),
    );
  }
}
