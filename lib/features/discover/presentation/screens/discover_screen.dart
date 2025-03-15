import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_fonts.dart';
import '../../../../l10n/app_localizations.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.discover,
            style: TextStyle(
              fontSize: AppFonts.subHeaderSize,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
