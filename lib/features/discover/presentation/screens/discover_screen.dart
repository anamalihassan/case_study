import 'package:case_study/core/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_fonts.dart';
import '../../../../core/theme/custom_theme.dart';
import '../../../../l10n/app_localizations.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Column(
        children: [
          _buildSearchWidget(context),
          SingleChildScrollView(
            child: Column(
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
          )
        ],
      ),
    );
  }

  Widget _buildSearchWidget(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).extension<CustomAppTheme>()?.searchBorderColor ?? AppColors.searchBorderColor,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
    );
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: TextFormField(
        cursorColor: theme.disabledColor,
        style: TextStyle(color: theme.primaryColor),
        decoration: InputDecoration(
          suffixIcon: SvgPicture.asset(iconFilter, height: 20, width: 20, fit: BoxFit.scaleDown),
          prefixIcon: SvgPicture.asset(iconSearch, height: 16, width: 16, fit: BoxFit.scaleDown),
          contentPadding: const EdgeInsets.all(12.0),
          labelText: AppLocalizations.of(context)!.find,
          labelStyle: TextStyle(
            color: Theme.of(context).extension<CustomAppTheme>()?.textHintColor,
            fontWeight: FontWeight.w500,
          ),
          constraints: const BoxConstraints(
            maxHeight: 44,
          ),
          focusedBorder: inputBorder,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          enabledBorder: inputBorder,
          border: inputBorder,
        ),
      ),
    );
  }
}
