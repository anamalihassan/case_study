import 'package:flutter/material.dart';

import '../../../../core/constants/app_fonts.dart';
import '../../../../l10n/app_localizations.dart';

class MyBookingScreen extends StatelessWidget {
  const MyBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.my_booking,
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
